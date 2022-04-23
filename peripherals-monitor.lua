
---Monitors are a block which act as a terminal, displaying information on one side. This allows them to be read and interacted with in-world without opening a GUI.
---@class Monitor : Redirect, Peripheral
local Monitor = {}

---Set the scale of this monitor. A larger scale will result in the monitor having a lower resolution, but display text much larger.
---@param scale number The monitor's scale. This must be a multiple of 0.5 between 0.5 and 5.
function Monitor.setTextScale(scale) end

---Get the monitor's current text scale.
---@return number scale The monitor's current scale.
function Monitor.getTextScale() end
