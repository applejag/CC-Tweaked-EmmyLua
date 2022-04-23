---Methods for interacting with inventories.
---
---```lua
------@type inventory
---local chest = peripheral.wrap("left")
---
---print("The chest contains " .. chest.size() .. " slots")
---```
---@class inventory
local inventory = {}

---Get the size of this inventory.
---@return integer slots The number of slots in this inventory.
function inventory.size() end

---List all items in this inventory. This returns a table, with an entry for each slot.
---
---Each item in the inventory is represented by a table containing some basic information, much like `turtle.getItemDetail` includes. More information can be fetched with `getItemDetail`. The table contains the item `name`, the `count` and an a (potentially nil) hash of the item's `nbt`. This NBT data doesn't contain anything useful, but allows you to distinguish identical items.
---
---The returned table is sparse, and so empty slots will be `nil` - it is recommended to loop over using `pairs` rather than `ipairs`.
---@return table<integer,ItemInfo> items All items in this inventory.
function inventory.list() end

---Get detailed information about an item.
---
---The returned information contains the same information as each item in `list`, as well as additional details like the display name (`displayName`) and item durability (`damage`, `maxDamage`, `durability`).
---
---Some items include more information (such as enchantments) - it is recommended to print it out using `textutils.serialize` or in the Lua REPL, to explore what is available.
---@param slot integer The slot to get information about.
---@return ItemInfo|nil item Information about the item in this slot, or `nil` if not present.
function inventory.getItemDetail(slot) end

---Get the maximum number of items which can be stored in this slot.
---
---Typically this will be limited to 64 items. However, some inventories (such as barrels or caches) can store hundreds or thousands of items in one slot.
---@param slot integer The slot.
---@return integer limit The maximum number of items in this slot.
function inventory.getItemLimit(slot) end

---Push items from one inventory to another connected one.
---
---This allows you to push an item in an inventory to another inventory on the same wired network. Both inventories must attached to wired modems which are connected via a cable.
---@param toName string The name of the peripheral/inventory to push to. This is the string given to `peripheral.wrap`, and displayed by the wired modem.
---@param fromSlot integer The slot in the current inventory to move items to.
---@param limit? integer The maximum number of items to move. Defaults to the current stack limit.
---@param toSlot? integer The slot in the target inventory to move to. If not given, the item will be inserted into any slot.
---@return integer count The number of transferred items.
function inventory.pushItems(toName, fromSlot, limit, toSlot) end

---Pull items from a connected inventory into this one.
---
---This allows you to transfer items between inventories on the same wired network. Both this and the source inventory must attached to wired modems which are connected via a cable.
---@param fromName string The name of the peripheral/inventory to pull from. This is the string given to `peripheral.wrap`, and displayed by the wired modem.
---@param fromSlot integer The slot in the source inventory to move items from.
---@param limit? integer The maximum number of items to move. Defaults to the current stack limit.
---@param toSlot? integer The slot in current inventory to move to. If not given, the item will be inserted into any slot.
---@return integer count The number of transferred items.
function inventory.pullItems(fromName, fromSlot, limit, toSlot) end

