# Peripherals

The LUA language server cannot automatically determine the peripheral type
for you, so you have to annotate your code with the types.

## Command

```lua
---@type command
local cmd = peripheral.find("command")

cmd.get<TAB>
   .getCommand()
```

## Computer

```lua
---@type computer
local computer = peripheral.find("computer")

computer.get<TAB>
        .getID()
				.getLabel()
```

## Drive

```lua
---@type drive
local drive = peripheral.find("drive")

drive.get<TAB>
     .getDiskLabel()
		 .getMountPath()
		 .getAudioTitle()
		 .getDiskID()
```
