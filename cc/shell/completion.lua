
---A collection of helper methods for working with shell completion.
---
---Most programs may be completed using the build helper method, rather than manually switching on the argument index.
---
---Note, the helper functions within this module do not accept an argument index, and so are not directly usable with the shell.setCompletionFunction. Instead, wrap them using build, or your own custom function.
---
---**Usage:**
---
---- Register a completion handler for example.lua which prompts for a choice of options, followed by a directory, and then multiple files.
---
---  ```lua
---  local completion = require "cc.shell.completion"
---  local complete = completion.build(
---    { completion.choice, { "get", "put" } },
---    completion.dir,
---    { completion.file, many = true }
---  )
---  shell.setCompletionFunction("example.lua", complete)
---  read(nil, nil, shell.complete, "example ")
---  ```
local completion = {}

---Complete the name of a file relative to the current working directory.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@return string[] suffixes A list of suffixes of matching files.
function completion.file(shell, text) end

---Complete the name of a directory relative to the current working directory.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@return string[] suffixes A list of suffixes of matching directories.
function completion.dir(shell, text) end

---Complete the name of a file or directory relative to the current working directory.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@param previous string[] The shell arguments before this one.
---@param add_space? boolean Whether to add a space after the completed item.
---@return string[] suffixes A list of suffixes of matching files and directories.
function completion.dirOrFile(shell, text, previous, add_space) end

---Complete the name of a program.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@return string[] suffixes A list of suffixes of matching programs.
function completion.program(shell, text) end

---Complete arguments of a program.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@param previous string[] The shell arguments before this one.
---@param starting integer Which argument index this program and args start at.
---@return string[] suffixes A list of suffixes of matching programs or arguments.
function completion.programWithArgs(shell, text, previous, starting) end

---Wraps `help.completeTopic` as a build compatible function.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@param previous string[] The shell arguments before this one.
---@return string[] suffixes A list of suffixes of matches.
function completion.help(shell, text, previous) end

---Wraps `cc.completion.choice` as a build compatible function.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@param previous string[] The shell arguments before this one.
---@param choices string[] The list of choices to complete from.
---@param add_space? boolean Whether to add a space after the completed item.
---@return string[] suffixes A list of suffixes of matches.
function completion.choice(shell, text, previous, choices, add_space) end

---Wraps `cc.completion.peripheral` as a build compatible function.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@param previous string[] The shell arguments before this one.
---@param add_space? boolean Whether to add a space after the completed item.
---@return string[] suffixes A list of suffixes of matches.
function completion.peripheral(shell, text, previous, add_space) end

---Wraps `cc.completion.side` as a build compatible function.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@param previous string[] The shell arguments before this one.
---@param add_space? boolean Whether to add a space after the completed item.
---@return string[] suffixes A list of suffixes of matches.
function completion.side(shell, text, previous, add_space) end

---Wraps `cc.completion.setting` as a build compatible function.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@param previous string[] The shell arguments before this one.
---@param add_space? boolean Whether to add a space after the completed item.
---@return string[] suffixes A list of suffixes of matches.
function completion.setting(shell, text, previous, add_space) end

---Wraps `cc.completion.command` as a build compatible function.
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@param previous string[] The shell arguments before this one.
---@param add_space? boolean Whether to add a space after the completed item.
---@return string[] suffixes A list of suffixes of matches.
function completion.command(shell, text, previous, add_space) end

---This argument will be completed with the given function. It is called with the shell object, the string to complete and the arguments before this one.
---@class buildFunc
---@param shell table The shell we're completing in.
---@param text string Current text to complete.
---@param previous string[] The shell arguments before this one.
---@param ... any The remaining fields from index 2 and beyond if passed as a table, where this function is the first field.
---@return string[] suffixes A list of suffixes of matches.
local function buildFunc(shell, text, previous, ...) end

---This acts as a more powerful version of the function case. The table must have a function as the first item - this will be called with the shell, string and preceding arguments as above, but also followed by any additional items in the table. This provides a more convenient interface to pass options to your completion functions.
---
---If this table is the last argument, it may also set the `many` key to true, which states this function should be used to complete any remaining arguments.
---@class buildTable : any[]
---@field [1] buildFunc
---@field many? boolean If this table is the last argument to `build`, it may also set the `many` key to true, which states this function should be used to complete any remaining arguments.
local buildTable = {}

---A helper function for building shell completion arguments.
---
---This accepts a series of single-argument completion functions, and combines them into a function suitable for use with `shell.setCompletionFunction`.
---@param ... nil|buildFunc|buildTable Every argument to build represents an argument to the program you wish to complete.
---@return fun(shell:table, index: integer, text: string, previous: string[]): fun(shell: table, text: string, previous: string[], ...: any): string[]
function completion.build(...) end

return completion
