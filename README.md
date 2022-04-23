# CC-Tweaked EmmyLua Annotations

Based on CC-Tweaked v1.100.4 for Minecraft 1.18.2.
Read from <https://tweaked.cc/>.

EmmyLua Annotations docs: <https://github.com/sumneko/lua-language-server/wiki/EmmyLua-Annotations>

## Install Lua-language-server

### Install on NixOS

```sh
nix-env -iA sumneko-lua-language-server
```

### Install on other

Try follow the docs: <https://github.com/sumneko/lua-language-server/wiki/Precompiled-Binaries>

May be available in your OS's package manager.

## Configure language server in coc.nvim

```json
  "languageserver": {
    "lua": {
      "command": "/home/yourname/.nix-profile/bin/lua-language-server",
      "filetypes": ["lua"],
      "rootPatterns": [".git/", ".settings"],
      "settings": {
        "Lua": {
          "workspace": {
            "library": [
              "/home/yourname/Documents/cc-lua-base-lib"
            ],
            "maxPreload": 2000,
            "preloadFileSize": 1000
          },
          "runtime": {
            "version": "Lua 5.1",
            "builtin": {
              "os": "disable"
            }
          },
          "diagnostics": {
            "enable": true,
            "globals": [],
            "disable": ["lowercase-global"]
          },
          "completion": {
            "keywordSnippet": "Disable"
          }
        }
      }
    }
  }
```
