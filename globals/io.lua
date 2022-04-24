
---A file handle which can be read or written to.
---@class Handle
local Handle = {}

---Close this file handle, freeing any resources it uses.
---@return 'true'|nil success If this handle was successfully closed, or `nil` if this file handle could not be closed.
---@return string? error The reason it could not be closed.
function Handle:close() end

---Flush any buffered output, forcing it to be written to the file
function Handle:flush() end

---Returns an iterator that, each time it is called, returns a new line from the file.
---
---This can be used in a for loop to iterate over all lines of a file
---
---Once the end of the file has been reached, `nil` will be returned. The file is *not* automatically closed.
---
---**Usage:**
---
---- Iterate over every line in a file and print it out.
---
---  ```lua
---  local file = io.open("/rom/help/intro.txt")
---  for line in file:lines() do
---    print(line)
---  end
---  file:close()
---  ```
---
---@param ... any The argument to pass to `Handle:read` for each line.
---@return fun(): string|nil iterator The line iterator.
function Handle:lines(...) end

---Reads data from the file, using the specified formats. For each format provided, the function returns either the data read, or `nil` if no data could be read.
---
---The following formats are available:
---
---- `l`: Returns the next line (without a newline on the end).
---- `L`: Returns the next line (with a newline on the end).
---- `a`: Returns the entire rest of the file.
---- ~~`n`:~~ ~~Returns a number~~ (not implemented in CC).
---
---These formats can be preceded by a `*` to make it compatible with Lua 5.1.
---
---If no format is provided, `l` is assumed.
---
---@param ... '"l"'|'"L"'|'"a"'|'"n"'|'"*l"'|'"*L"'|'"*a"'|'"*n"' The format to use.
---@return string|nil data1 The data read, or `nil` if nothing can be read.
---@return string|nil? data2 Second data read.
---@return string|nil? data3 Second data read.
---@return string|nil? data4 Second data read.
function Handle:read(...) end

---Seeks the file cursor to the specified position, and returns the new position.
---
---`whence` controls where the seek operation starts, and is a string that may be one of these three values:
---
---- `set`: base position is 0 (beginning of the file)
---- `cur`: base is current position
---- `end`: base is end of file
---
---The default value of `whence` is `cur`, and the default value of `offset` is 0. This means that `file:seek()` without arguments returns the current position without moving.
---
---@param whence? '"set"'|'"cur"'|'"end"' The place to set the cursor from.
---@param offset? integer The offset from the start to move to.
---@return integer pos The new location of the file cursor.
function Handle:seek(whence, offset) end

---> **Deprecated**
--->
---> This has no effect in CC.
---
---Sets the buffering mode for an output file.
---
---This has no effect under ComputerCraft, and exists with compatility with base Lua.
---@deprecated
---@param mode string The buffering mode.
---@param size? integer The size of the buffer.
---@see [file:setvbuf](https://www.lua.org/manual/5.1/manual.html#pdf-file:setvbuf) Lua's documentation for `setvbuf`.
function Handle:setvbuf(mode, size) end

---Write one or more values to the file
---@param ... string|number The values to write.
---@return Handle|nil file The current file, allowing chained calls.
---@return string? error The error message which occurred while writing.
function Handle:write(...) end

---Emulates Lua's standard [io library](https://www.lua.org/manual/5.1/manual.html#5.7).
io = {
  ---A file handle representing the "standard input". Reading from this file will prompt the user for input.
  ---@type Handle
  stdin = {},

  ---A file handle representing the "standard output". Writing to this file will display the written text to the screen.
  ---@type Handle
  stdout = {},

  ---A file handle representing the "standard error" stream.
  ---
  ---One may use this to display error messages, writing to it will display them on the terminal.
  ---@type Handle
  stderr = {},
}

---Closes the provided file handle.
---@param file? Handle The file handle to close, defaults tothe current open file.
function io.close(file) end

---Flushes the current output file.
function io.flush() end

---Get or set the current input file.
---@param file? Handle|string The new input file, either as a file path or pre-existing handle.
---@return Handle file The current input file.
function io.input(file) end

---Opens the given file name in read mode and returns an iterator that, each time it is called, returns a new line from the file.
---
---This can be used in a for loop to iterate over all lines of a file
---
---Once the end of the file has been reached, `nil` will be returned. The file is automatically closed.
---
---If no file name is given, the current input will be used instead. In this case, the handle is not used.
---
---**Usage:**
---
---- Iterate over every line in a file and print it out.
---
---  ```lua
---  for line in io.lines("/rom/help/intro.txt") do
---    print(line)
---  end
---  ```
---
---@param filename? string The name of the file to extract lines from.
---@param ... any The argument to pass to `Handle:read` for each line.
---@return fun(): string | nil iterator The line iterator.
function io.lines(filename, ...) end

---Open a file with the given mode, either returning a new file handle or `nil`, plus an error message.
---
---The `mode` string can be any of the following:
---
---- "r": Read mode
---- "w": Write mode
---- "a": Append mode
---
---The mode may also have a `b` at the end, which opens the file in "binary mode". This allows you to read binary files, as well as seek within a file.
---
---@param filename string The name of the file to open.
---@param mode? '"r"'|'"w"'|'"a"'|'"rb"'|'"wb"'|'"ab"' The mode to open the file with. This defaults to `rb`.
---@return Handle|nil file The opened file, or `nil` in case of an error.
---@return string? error The reason the file could not be opened.
function io.open(filename, mode) end

---Get or set the current output file.
---@param file? Handle|string The new output file, either as a file path or pre-existing handle.
---@return Handle file The current output file.
function io.output(file) end

---Read from the currently opened input file.
---
---This is equivalent to `io.input():read(...)`. See the documentation of `Handle:read` for full details.
---@param ... string The formats to read, defaulting to a whole line.
---@return string|nil data1 The data read, or `nil` if nothing can be read.
---@return string|nil? data2 Second data read.
---@return string|nil? data3 Second data read.
---@return string|nil? data4 Second data read.
function io.read(...) end

---Checks whether `handle` is a given file handle, and determine if it is open or not.
---@param handle any The value to check.
---@return '"file"'|'"closed file"'|nil status `"file"` if this is an open file, `"closed file"` if it is a closed file handle, or `nil` if not a file handle.
function io.type(handle) end

---Write to the currently opened output file.
---
---This is equivalent to `io.input():write(...)`. See the documentation of `Handle:write` for full details.
---@param ... string The strings to write.
---@return Handle|nil file The current file, allowing chained calls.
---@return string? error The error message which occurred while writing.
function io.write(...) end
