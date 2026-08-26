# Show me a better `.tmux.conf`&mdash;I dare you!

## Pi configuration

`pi-settings.json` is the tracked global Pi configuration. The setup scripts symlink it to `~/.pi/agent/settings.json`, so changes made by Pi are reflected directly in this repository.

`bin/pi-git` is installed as `~/.pi/agent/bin/git`. Pi processes must provide an explicit path list after `--` for every commit, for example:

```sh
git commit -m "Describe the change" -- path/to/file path/to/other-file
```

A filename-free commit exits with an error and creates nothing. Normal terminal Git is unchanged; `/usr/bin/git` is the deliberate escape hatch inside Pi.
