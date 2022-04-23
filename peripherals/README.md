# Peripherals

The LUA language server cannot automatically determine the peripheral type
for you, so you have to annotate your code with the types, which is done by
the [`---@type` EmmyLua annotation](https://github.com/sumneko/lua-language-server/wiki/EmmyLua-Annotations#types-and-type).

In the code blocks below, `<TAB>` represents you pressing <kbd>Tab</kbd> on your
keyboard to expand the intellisense suggestions.

:warning: Note that there must be 3 dashes `---`, compared to a regular LUA
comment that only needs 2 dashes `--`.

## Command

<img align="right" width="160" height="160" src="../assets/command.webp"/>

```lua
---@type command
local cmd = peripheral.find("command")

cmd.get<TAB>
   .getCommand()
```

## Computer

<img align="right" width="160" height="160" src="../assets/computer.png"/>

```lua
---@type computer
local computer = peripheral.find("computer")

computer.get<TAB>
        .getID()
        .getLabel()
```

## Drive

<img align="right" width="160" height="160" src="../assets/drive.png"/>

```lua
---@type drive
local drive = peripheral.find("drive")

drive.get<TAB>
     .getDiskLabel()
     .getMountPath()
     .getAudioTitle()
     .getDiskID()
```

## Modem

<img align="right" width="160" height="160" src="../assets/modem.png"/>

```lua
---@type modem
local modem = peripheral.find("modem")

modem.get<TAB>
     .getNamesRemote()
     .getTypeRemote(name)
     .getMethodsRemote(name)
     .getNameLocal()
```

## Monitor

<img align="right" width="160" height="160" src="../assets/monitor.png"/>

```lua
---@type monitor
local monitor = peripheral.find("monitor")

monitor.get<TAB>
       .getTextScale()
       .getCursorPos()
       .getCursorBlink()
       .getSize()
       .getTextColour()
       .getTextColor()
       ...etc
```

## Printer

<img align="right" width="160" height="160" src="../assets/printer.png"/>

```lua
---@type printer
local printer = peripheral.find("printer")

printer.get<TAB>
       .getCursorPos()
       .getPaperSize()
       .getInkLevel()
       .getPaperLevel()
```

## Speaker

<img align="right" width="160" height="160" src="../assets/speaker.png"/>

```lua
---@type speaker
local speaker = peripheral.find("speaker")

speaker.play<TAB>
       .playNote(instrument, volume?, pitch?)
       .playSound(name, volume?, pitch?)
       .playAudio(audio, volume?)
```
