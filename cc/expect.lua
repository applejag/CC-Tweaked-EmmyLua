
---The `cc.expect` library provides helper functions for verifying that function arguments are well-formed and of the correct type.
---
---## Usage
---
---- Define a basic function and check it has the correct arguments.
---
---  ```lua
---  local expect = require "cc.expect"
---  local expect, field = expect.expect, expect.field
---
---  local function add_person(name, info)
---      expect(1, name, "string")
---      expect(2, info, "table", "nil")
---
---      if info then
---          print("Got age=", field(info, "age", "number"))
---          print("Got gender=", field(info, "gender", "string", "nil"))
---      end
---  end
---
---  add_person("Anastazja") -- `info' is optional
---  add_person("Kion", { age = 23 }) -- `gender' is optional
---  add_person("Caoimhin", { age = 23, gender = true }) -- error!
---  ```
local expect = {}

---Expect an argument to have a specific type.
---@param index integer The 1-based argument index.
---@param value any The argument's value.
---@param ... string The allowed types of the argument.
---@return any value The given `value`.
function expect.expect(index, value, ...) end

---Expect a field to have a specific type.
---@param tbl table The table to index.
---@param index string The field name to check.
---@param ... string The allowed types of the argument.
---@return any field The contents of the given field.
function expect.field(tbl, index, ...) end

---Expect a number to be within a specific range.
---@param num number The value to check.
---@param min? number The minimum value, if `nil` then `-math.huge` is used.
---@param max? number The maximum value, if `nil` then `math.huge` is used.
---@return number value The given `value`.
function expect.range(num, min, max) end

return expect
