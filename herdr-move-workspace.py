#!/usr/bin/env python3
"""Move the active Herdr workspace one position up or down."""

import json
import os
import socket
import sys


def request(method: str, params: dict | None = None) -> dict:
    socket_path = os.environ.get("HERDR_SOCKET_PATH")
    if not socket_path:
        raise RuntimeError("HERDR_SOCKET_PATH is not set")

    payload = {
        "id": f"workspace-keybind:{os.getpid()}",
        "method": method,
        "params": params or {},
    }

    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
        client.connect(socket_path)
        client.sendall(json.dumps(payload).encode() + b"\n")
        response = b""
        while b"\n" not in response:
            chunk = client.recv(65536)
            if not chunk:
                break
            response += chunk

    result = json.loads(response.split(b"\n", 1)[0])
    if "error" in result:
        raise RuntimeError(result["error"])
    return result


def main() -> None:
    if len(sys.argv) != 2 or sys.argv[1] not in {"up", "down"}:
        raise SystemExit("usage: herdr-move-workspace.py <up|down>")

    active_id = os.environ.get("HERDR_ACTIVE_WORKSPACE_ID")
    if not active_id:
        raise RuntimeError("HERDR_ACTIVE_WORKSPACE_ID is not set")

    workspaces = request("workspace.list")["result"]["workspaces"]
    index = next(i for i, workspace in enumerate(workspaces) if workspace["workspace_id"] == active_id)

    if sys.argv[1] == "up":
        if index == 0:
            return
        insert_index = index - 1
    else:
        if index == len(workspaces) - 1:
            return
        insert_index = index + 2

    request(
        "workspace.move",
        {"workspace_id": active_id, "insert_index": insert_index},
    )


if __name__ == "__main__":
    main()
