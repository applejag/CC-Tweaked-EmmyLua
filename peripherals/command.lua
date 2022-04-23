
---This peripheral allows you to interact with command blocks.
---
---Command blocks are only wrapped as peripherals if the `enable_command_block` option is true within the config.
---
---This API is not the same as the `commands` API, which is exposed on command computers.
---@class command
local command = {}

---Get the command this command block will run.
---@return string command The current command.
function command.getCommand() end

---Set the command block's command.
---@param command string The new command.
function command.setCommand(command) end

---Execute the command block once.
---@return boolean success If the command completed successfully.
---@return string|nil error A failure message.
function command.runCommand() end
