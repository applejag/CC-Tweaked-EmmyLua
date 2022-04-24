# Generic Peripherals

The LUA language server cannot automatically determine the peripheral type
for you, so you have to annotate your code with the types, which is done by
the [`---@type` EmmyLua annotation](https://github.com/sumneko/lua-language-server/wiki/EmmyLua-Annotations#types-and-type).

In the code blocks below, `<TAB>` represents you pressing <kbd>Tab</kbd> on your
keyboard to expand the intellisense suggestions.

:warning: Note that there must be 3 dashes `---`, compared to a regular LUA
comment that only needs 2 dashes `--`.

## energy\_storage

```lua
---@type energy_storage
local e = peripheral.find("energy_storage")

e.get<TAB>
 .getEnergy()
 .getEnergyCapacity()
```

## fluid\_storage

```lua
---@type fluid_storage
local f = peripheral.find("fluid_storage")

f.p<TAB>
 .pushFluid(toName, limit?, fluidName?)
 .pullFluid(fromName, limit?, fluidName?)
```

## inventory

```lua
---@type inventory
local i = peripheral.find("inventory")

i.get<TAB>
 .getItemDetail(slot)
 .getItemLimit(slot)
```
