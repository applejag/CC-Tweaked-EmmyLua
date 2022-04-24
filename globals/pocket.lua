
---Control the current pocket computer, adding or removing upgrades.
---
---This API is only available on pocket computers. As such, you may use its presence to determine what kind of computer you are using:
---
---```lua
---if pocket then
---  print("On a pocket computer")
---else
---  print("On something else")
---end
---```
pocket = {}

---Search the player's inventory for another upgrade, replacing the existing one with that item if found.
---
---This inventory search starts from the player's currently selected slot, allowing you to prioritise upgrades.
---@return boolean success If an item was equipped.
---@return string? error The reason an item was not equipped.
function pocket.equipBack() end

---Remove the pocket computer's current upgrade.
---@return boolean success If an item was unequipped.
---@return string? error The reason an item was not unequipped.
function pocket.unequipBack() end
