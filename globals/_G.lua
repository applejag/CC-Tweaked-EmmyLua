
---Pauses execution for the specified number of seconds.
---@param time number The number of seconds to sleep for, rounded up to the nearest multiple of 0.05.
function sleep(time) end

---Writes a line of text to the screen without a newline at the end, wrapping text if necessary.
---@param ... any The values to print on the screen.
---@return number lines The number of lines written.
---@see print(text)
function write(...) end

---Prints the specified values to the screen separated by spaces, wrapping if necessary. After printing, the cursor is moved to the next line.
---@param ... any The values to print on the screen.
---@return number lines The number of lines written.
---@see write(text)
function print(...) end

---Prints the specified values to the screen in red, separated by spaces, wrapping if necessary. After printing, the cursor is moved to the next line.
---@param ... any The values to print on the screen.
function printError(...) end

---Reads user input from the terminal, automatically handling arrow keys, pasting, character replacement, history scrollback, auto-completion, and default values.
---@param replaceChar? string A character to replace each typed character with. This can be used for hiding passwords, for example.
---@param history? table A table holding history items that can be scrolled back to with the up/down arrow keys. The oldest item is at index 1, while the newest item is at the highest index.
---@param completeFn? fun(partial:string):string[]|nil A function to be used for completion. This function should take the partial text typed so far, and returns a list of possible completion options.
function read(replaceChar, history, completeFn, default) end

---The ComputerCraft and Minecraft version of the current computer environment.
_HOST = "ComputerCraft 1.100.4 (Minecraft 1.18.2)"

---The default computer settings as defined in the ComputerCraft configuration.
_CC_DEFAULT_SETTINGS = ""
