
---Executes a command. The name of the field is used as the command to execute, so `commands.lorem("abc")` is equivalent to `commands.exec("lorem abc")`.
---@class Command
---@param args string The arguments to the command.
---@return boolean success Whether the command executed successfully.
---@return string[] output The output of this command, as a list of lines.
---@return number|nil affected The number of "affected" objects, or `nil` if the command failed. The definition of this varies from command to command.
function Command(args) end

---Asynchronously executes a command. The name of the field is used as the command to execute, so `commands.async.lorem("abc")` is equivalent to `commands.execAsync("lorem abc")`.
---@class AsyncCommand
---@param args string The arguments to the command.
---@return integer id The "task id". When this command has been executed, it will queue a `task_complete` event with a matching id.
function AsyncCommand(args) end

local native = {}

---Execute a specific command.
---@param command string The command to execute.
---@return boolean success Whether the command executed successfully.
---@return string[] output The output of this command, as a list of lines.
---@return number|nil affected The number of "affected" objects, or `nil` if the command failed. The definition of this varies from command to command.
function native.exec(command) end

---Asynchronously execute a specific command.
---
---Unlike exec, this will immediately return, instead of waiting for the command to execute. This allows you to run multiple commands at the same time.
---
---When this command has finished executing, it will queue a task_complete event containing the result of executing this command (what exec would return).
---@param command string The command to execute.
---@return integer id The "task id". When this command has been executed, it will queue a `task_complete` event with a matching id.
function native.execAsync(command) end

---List all available commands which the computer has permission to execute.
---@param ... string The sub-command to complete.
---@return string[] list A list of all available commands.
function native.list(...) end

---Get the position of the current command computer.
---@return integer x This computer's x position.
---@return integer y This computer's y position.
---@return integer z This computer's z position.
function native.getBlockPosition() end

---Get information about a range of blocks.
---
---This returns the same information as `getBlockInfo`, just for multiple blocks at once.
---
---Blocks are traversed by ascending y level, followed by z and x - the returned table may be indexed using `x + z*width + y*depth*depth`.
---@param minX integer The start x coordinate of the range to query.
---@param minY integer The start y coordinate of the range to query.
---@param minZ integer The start z coordinate of the range to query.
---@param maxX integer The end x coordinate of the range to query.
---@param maxY integer The end y coordinate of the range to query.
---@param maxZ integer The end z coordinate of the range to query.
---@param dimension? string The dimension to query (e.g. "minecraft:overworld"). Defaults to the current dimension.
---@return BlockInfo[] blocks A list of information about each block.
function native.getBlockInfos(minX, minY, minZ, maxX, maxY, maxZ, dimension) end

---Get some basic information about a block.
---
---The returned table contains the current name, metadata and block state (as with `turtle.inspect`). If there is a tile entity for that block, its NBT will also be returned.
---@param x integer The x position of the block to query.
---@param y integer The y position of the block to query.
---@param z integer The z position of the block to query.
---@param dimension? string The dimension to query (e.g. "minecraft:overworld"). Defaults to the current dimension.
---@return BlockInfo block The given block's information.
function native.getBlockInfo(x, y, z, dimension) end

---@type table<string, AsyncCommand>
local async = {}

---The commands API allows your system to directly execute Minecraft commands and gather data from the results.
---
---While one may use commands.exec directly to execute a command, the commands API also provides helper methods to execute every command. For instance, `commands.say("Hi!")` is equivalent to `commands.exec("say Hi!")`.
---
---commands.async provides a similar interface to execute asynchronous commands. `commands.async.say("Hi!")` is equivalent to `commands.execAsync("Hi!")`.
---@type table<string,Command>
commands = {
  ---The builtin commands API, without any generated command helper functions
  ---
  ---This may be useful if a built-in function (such as commands.list) has been overwritten by a command.
  native = native,

  ---A table containing asynchronous wrappers for all commands.
  ---
  ---As with commands.execAsync, this returns the "task id" of the enqueued command.
  async = async,
}

---Execute a specific command.
---@param command string The command to execute.
---@return boolean success Whether the command executed successfully.
---@return string[] output The output of this command, as a list of lines.
---@return number|nil affected The number of "affected" objects, or `nil` if the command failed. The definition of this varies from command to command.
function commands.exec(command) end

---Asynchronously execute a specific command.
---
---Unlike exec, this will immediately return, instead of waiting for the command to execute. This allows you to run multiple commands at the same time.
---
---When this command has finished executing, it will queue a task_complete event containing the result of executing this command (what exec would return).
---@param command string The command to execute.
---@return integer id The "task id". When this command has been executed, it will queue a `task_complete` event with a matching id.
function commands.execAsync(command) end

---List all available commands which the computer has permission to execute.
---@param ... string The sub-command to complete.
---@return string[] list A list of all available commands.
function commands.list(...) end

---Get the position of the current command computer.
---@return integer x This computer's x position.
---@return integer y This computer's y position.
---@return integer z This computer's z position.
function commands.getBlockPosition() end

---Get information about a range of blocks.
---
---This returns the same information as `getBlockInfo`, just for multiple blocks at once.
---
---Blocks are traversed by ascending y level, followed by z and x - the returned table may be indexed using `x + z*width + y*depth*depth`.
---@param minX integer The start x coordinate of the range to query.
---@param minY integer The start y coordinate of the range to query.
---@param minZ integer The start z coordinate of the range to query.
---@param maxX integer The end x coordinate of the range to query.
---@param maxY integer The end y coordinate of the range to query.
---@param maxZ integer The end z coordinate of the range to query.
---@param dimension? string The dimension to query (e.g. "minecraft:overworld"). Defaults to the current dimension.
---@return BlockInfo[] blocks A list of information about each block.
function commands.getBlockInfos(minX, minY, minZ, maxX, maxY, maxZ, dimension) end

---Get some basic information about a block.
---
---The returned table contains the current name, metadata and block state (as with `turtle.inspect`). If there is a tile entity for that block, its NBT will also be returned.
---@param x integer The x position of the block to query.
---@param y integer The y position of the block to query.
---@param z integer The z position of the block to query.
---@param dimension? string The dimension to query (e.g. "minecraft:overworld"). Defaults to the current dimension.
---@return BlockInfo block The given block's information.
function commands.getBlockInfo(x, y, z, dimension) end

