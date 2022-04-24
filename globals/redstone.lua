---Interact with redstone attached to this computer.
---
---The redstone library exposes three "types" of redstone control:
---
---- Binary input/output (`setOutput`/`getInput`): These simply check if a redstone wire has any input or output. A signal strength of 1 and 15 are treated the same.
---- Analogue input/output (`setAnalogOutput`/`getAnalogInput`): These work with the actual signal strength of the redstone wired, from 0 to 15.
---- Bundled cables (`setBundledOutput`/`getBundledInput`): These interact with "bundled" cables, such as those from Project:Red. These allow you to send 16 separate on/off signals. Each channel corresponds to a colour, with the first being `colors.white` and the last `colors.black`.
---
---Whenever a redstone input changes, a `redstone` event will be fired. This may be used instead of repeatedly polling.
---
---This module may also be referred to as `rs`. For example, one may call `rs.getSides()` instead of `redstone.getSides()`.
---
---**Usage:**
---
---- Toggle the redstone signal above the computer every 0.5 seconds.
---
---  ```lua
---  while true do
---    redstone.setOutput("top", not redstone.getOutput("top"))
---    sleep(0.5)
---  end
---  ```
---
---- Mimic a redstone comparator in [subtraction mode](https://minecraft.gamepedia.com/Redstone_Comparator#Subtract_signal_strength).
---
---  ```lua
---  while true do
---    local rear = rs.getAnalogueInput("back")
---    local sides = math.max(rs.getAnalogueInput("left"), rs.getAnalogueInput("right"))
---    rs.setAnalogueOutput("front", math.max(rear - sides, 0))
---  
---    os.pullEvent("redstone") -- Wait for a change to inputs.
---  end
---  ```
---
redstone = {}

rs = redstone

---@alias side '"top"'|'"bottom"'|'"left"'|'"right"'|'"front"'|'"back"'
---@alias sides '{"top", "bottom", "left", "right", "front", "back"}'

---Returns a table containing the six sides of the computer. Namely, "top", "bottom", "left", "right", "front" and "back".
---@return sides sides A table of valid sides.
function redstone.getSides() end

---Turn the redstone signal of a specific side on or off.
---@param side side The side to set.
---@param on boolean Whether the redstone signal should be on or off. When on, a signal strength of 15 is emitted.
function redstone.setOutput(side, on) end

---Get the current redstone output of a specific side.
---@param side side The side to get.
---@return boolean on Whether the redstone output is on or off.
function redstone.getOutput(side) end

---Get the current redstone input of a specific side.
---@param side side The side to get.
---@return boolean on Whether the redstone input is on or off.
function redstone.getInput(side) end

---Set the redstone signal strength for a specific side.
---@param side side The side to set.
---@param value integer The signal strength between 0 and 15.
function redstone.setAnalogOutput(side, value) end

---Set the redstone signal strength for a specific side.
---@param side side The side to set.
---@param value integer The signal strength between 0 and 15.
function redstone.setAnalogueOutput(side, value) end

---Get the redstone output signal strength for a specific side.
---@param side side The side to get.
---@return integer value The output signal strength, between 0 and 15.
function redstone.getAnalogOutput(side) end

---Get the redstone output signal strength for a specific side.
---@param side side The side to get.
---@return integer value The output signal strength, between 0 and 15.
function redstone.getAnalogueOutput(side) end

---Get the redstone input signal strength for a specific side.
---@param side side The side to get.
---@return integer value The input signal strength, between 0 and 15.
function redstone.getAnalogInput(side) end

---Get the redstone input signal strength for a specific side.
---@param side side The side to get.
---@return integer value The input signal strength, between 0 and 15.
function redstone.getAnalogueInput(side) end

---Set the bundled cable output for a specific side.
---@param side side The side to set.
---@param output integer The colour bitmask to set.
function redstone.setBundledOutput(side, output) end

---Get the bundled cable output for a specific side.
---@param side side The side to get.
---@return integer output The bundle cable's output.
function redstone.getBundledOutput(side) end

---Get the bundled cable input for a specific side.
---@param side side The side to get.
---@return integer input The bundle cable's input.
function redstone.getBundledInput(side) end

---Determine if a specific combination of colours are on for the given side.
---
---**Usage:**
---
---- Check if `colors.white` and `colors.black` are on above the computer.
---
---  ```lua
---  print(redstone.testBundledInput("top", colors.combine(colors.white, colors.black)))
---  ```
---
---@param side side The side to test.
---@param mask integer The mask to test.
---@return boolean #If the colours are on.
function redstone.testBundledInput(side, mask) end
