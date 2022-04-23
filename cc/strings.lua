
---Various utilities for working with strings and text.
local strings = {}

---Wraps a block of text, so that each line fits within the given width.
---
---This may be useful if you want to wrap text before displaying it to a `monitor` or `printer` without using `print`.
---
---**Usage:**
---
---- Wrap a string and write it to the terminal.
---
---  ```lua
---  term.clear()
---  local lines = require "cc.strings".wrap("This is a long piece of text", 10)
---  for i = 1, #lines do
---    term.setCursorPos(1, i)
---    term.write(lines[i])
---  end
---  ```
---@param text string The string to wrap.
---@param width? integer The width to constrain to, defaults to the width of the terminal.
---@return string[] lines The wrapped input string as a list of lines.
function strings.wrap(text, width) end

---Makes the input string a fixed width. This either truncates it, or pads it with spaces.
---
---**Usage:**
---
---- Adding spaces.
---
---  ```lua
---  require "cc.strings".ensure_width("a short string", 20)
---  --> "a short string      "
---  ```
---
---- Truncating.
---
---  ```lua
---  require "cc.strings".ensure_width("a rather long string which is truncated", 20)
---  --> "a rather long string"
---  ```
---@param line string The string to normalize.
---@param width? integer The width to constrain to, defaults to the width of the termnial.
---@return string line The string with the specific width.
function strings.ensure_width(line, width) end

return strings
