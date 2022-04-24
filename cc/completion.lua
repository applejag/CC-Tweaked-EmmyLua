
---A collection of helper methods for working with input completion, such as that require by `_G.read`.
local completion = {}

---Complete from a choice of one or more strings.
---
---**Usage:**
---
---- Call `_G.read`, completing the names of various animals.
---
---  ```lua
---  local completion = require "cc.completion"
---  local animals = { "dog", "cat", "lion", "unicorn" }
---  read(nil, nil, function(text) return completion.choice(text, animals) end)
---  ```
---
---@param text string The input string to complete.
---@param choices string[] The list of choices to complete from.
---@param add_space? boolean Whether to add a space after the completed term.
---@return string[] suffixes A list of suffixes of matching strings.
function completion.choice(text, choices, add_space) end

---Complete the name of a currently attached peripheral.
---
---**Usage:**
---
---- Call `_G.read`, completing the names of attached peripherals.
---
---  ```lua
---  local completion = require "cc.completion"
---  read(nil, nil, completion.peripheral)
---  ```
---
---@param text string The input string to complete.
---@param add_space? boolean Whether to add a space after the completed term.
---@return string[] suffixes A list of suffixes of matching strings.
function completion.peripheral(text, add_space) end

---Complete the side of a computer.
---
---**Usage:**
---
---- Call `_G.read`, completing the names of sides.
---
---  ```lua
---  local completion = require "cc.completion"
---  read(nil, nil, completion.side)
---  ```
---
---@param text string The input string to complete.
---@param add_space? boolean Whether to add a space after the completed term.
---@return string[] suffixes A list of suffixes of matching strings.
function completion.side(text, add_space) end

---Complete a setting.
---
---**Usage:**
---
---- Call `_G.read`, completing the names of a setting.
---
---  ```lua
---  local completion = require "cc.completion"
---  read(nil, nil, completion.setting)
---  ```
---
---@param text string The input string to complete.
---@param add_space? boolean Whether to add a space after the completed term.
---@return string[] suffixes A list of suffixes of matching strings.
function completion.setting(text, add_space) end

---Complete the name of a Minecraft command.
---
---**Usage:**
---
---- Call `_G.read`, completing the names of a Minecraft command.
---
---  ```lua
---  local completion = require "cc.completion"
---  read(nil, nil, completion.command)
---  ```
---
---@param text string The input string to complete.
---@param add_space? boolean Whether to add a space after the completed term.
---@return string[] suffixes A list of suffixes of matching strings.
function completion.command(text, add_space) end

return completion
