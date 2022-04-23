
---Methods for interacting with tanks and other fluid storage blocks.
---@class fluid_storage
local fluid_storage = {}

---Get all "tanks" in this fluid storage.
---
---Each tank either contains some amount of fluid or is empty. Tanks with fluids inside will return some basic information about the fluid, including its name and amount.
---
---The returned table is sparse, and so empty tanks will be `nil` - it is recommended to loop over using `pairs` rather than `ipairs`.
---@return table<integer,table> tanks All tanks in this fluid storage.
function fluid_storage.tanks() end

---Move a fluid from one fluid container to another connected one.
---
---This allows you to pull fluid in the current fluid container to another container on the same wired network. Both containers must attached to wired modems which are connected via a cable.
---@param toName string The name of the peripheral/container to push to. This is the string given to `peripheral.wrap`, and displayed by the wired modem.
---@param limit? integer The maximum amount of fluid to move.
---@param fluidName? string The fluid to move. If not given, an arbitrary fluid will be chosen.
---@return integer amount The amount of moved fluid.
function fluid_storage.pushFluid(toName, limit, fluidName) end

---Move a fluid from a connected fluid container into this oneone.
---
---This allows you to pull fluid in the current fluid container from another container on the same wired network. Both containers must attached to wired modems which are connected via a cable.
---@param fromName string The name of the peripheral/container to pull from. This is the string given to `peripheral.wrap`, and displayed by the wired modem.
---@param limit? integer The maximum amount of fluid to move.
---@param fluidName? string The fluid to move. If not given, an arbitrary fluid will be chosen.
---@return integer amount The amount of moved fluid.
function fluid_storage.pullFluid(fromName, limit, fluidName) end

