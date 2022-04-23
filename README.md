# CC-Tweaked EmmyLua Annotations

Based on CC-Tweaked v1.100.4 for Minecraft 1.18.2.
Read from <https://tweaked.cc/>.

EmmyLua Annotations docs: <https://github.com/sumneko/lua-language-server/wiki/EmmyLua-Annotations>

## Install files

```sh
git clone https://github.com/jilleJr/CC-Tweaked-EmmyLua.git ~/Documents/CC-Tweaked-EmmyLua
```

## Install Lua-language-server

### Install on NixOS

```sh
nix-env -i sumneko-lua-language-server
```

### Install on other

Try follow the docs: <https://github.com/sumneko/lua-language-server/wiki/Precompiled-Binaries>

May be available in your OS's package manager.

## Configure language server in coc.nvim

```vim
:CocConfig
```

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
              "/home/yourname/Documents/CC-Tweaked-EmmyLua"
            ],
            "maxPreload": 2000,
            "preloadFileSize": 1000
          },
          "runtime": {
            "version": "Lua 5.1",
            "builtin": {
              "os": "disable",
              "io": "disable"
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

## TODO

Remaining stuff that's not documented:

- [ ] Globals:

  - [x] ~~\_G~~
  - [x] ~~colors~~
  - [x] ~~colours~~
  - [x] ~~commands~~
  - [x] ~~disk~~
  - [x] ~~fs~~
  - [x] ~~gps~~
  - [x] ~~help~~
  - [x] ~~http~~
  - [x] ~~io~~
  - [x] ~~keys~~
  - [x] ~~multishell~~
  - [x] ~~os~~
  - [ ] paintutils
  - [x] ~~parallel~~
  - [x] ~~peripheral~~
  - [ ] pocket
  - [x] ~~rednet~~
  - [ ] redstone
  - [x] ~~settings~~
  - [x] ~~shell~~
  - [x] ~~term~~
  - [x] ~~textutils~~
  - [x] ~~turtle~~
  - [x] ~~vector~~
  - [x] ~~window~~

- [ ] Modules:

  - [ ] cc.audio.dfpwm
  - [ ] cc.completion
  - [x] ~~cc.expect~~
  - [ ] cc.image.nft
  - [ ] cc.pretty
  - [x] ~~cc.require~~
  - [ ] cc.shell.completion
  - [x] ~~cc.strings~~

- [x] ~~Peripherals:~~

  - [x] ~~command~~
  - [x] ~~computer~~
  - [x] ~~drive~~
  - [x] ~~modem~~
  - [x] ~~monitor~~
  - [x] ~~printer~~
  - [x] ~~speaker~~

- [x] ~~Generic peripherals:~~

  - [x] ~~energy\_storage~~
  - [x] ~~fluid\_storage~~
  - [x] ~~inventory~~
