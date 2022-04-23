---Methods for interacting with blocks using Forge's energy storage system.
---
---This works with energy storage blocks, as well as generators and machines which consume energy.
---
---> **Note:**
--->
---> Due to limitations with Forge's energy API, it is not possible to measure throughput (i.e. RF used/generated per tick).
---@class energy_storage
local energy_storage = {}

---Get the energy of this block.
---@return number energy The energy stored in this block, in FE.
function energy_storage.getEnergy() end

---Get the maximum amount of energy this block can store.
---@return number capacity The energy capacity of this block.
function energy_storage.getEnergyCapacity() end
