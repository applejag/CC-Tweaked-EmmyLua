
---A computer or turtle wrapped as a peripheral.
---
---This allows for basic interaction with adjacent computers. Computers wrapped as peripherals will have the type computer while turtles will be turtle.
---@class computer
local computer = {}

---Turn the other computer on.
function computer.turnOn() end

---Shutdown the other computer.
function computer.shutdown() end

---Reboot or turn on the other computer.
function computer.reboot() end

---Get the other computer's ID.
---@return integer id The computer's ID.
function computer.getID() end

---Determine if the other computer is on.
---@return boolean #If the computer is on.
function computer.isOn() end

---Get the other computer's label.
---@return string|nil label The computer's label.
function computer.getLabel() end
