
---Provides an API to read help files.
help = {}

---Returns a colon-separated list of directories where help files are searched for. All directories are absolute.
---@return string path The current help search path, separated by colons.
function help.path() end

---Sets the colon-seperated list of directories where help files are searched for to `newPath`.
---
---**Usage:**
---
---- Override the path:
---
---  ```lua
---  help.setPath("/disk/help/")
---  ```
---
---- Add folder to the path:
---
---  ```lua
---  help.setPath(help.path() .. ":/myfolder/help/")
---  ```
---
---@param newPath string The new path to use.
function help.setPath(newPath) end

---Returns the location of the help file for the given topic.
---@param topic string The topic to find.
---@return string|nil path The path to the given topic's help file, or `nil` if it cannot be found.
function help.lookup(topic) end

---Returns a list of topics that can be looked up and/or displayed.
---@return string[] topics A list of topics in alphabetical order.
function help.topics() end

---Returns a list of topic endings that match the prefix. Can be used with `read` to allow input of a help topic.
---@param prefix string The prefix to match.
---@return string[] topics A list of matching topics.
function help.completeTopic(prefix) end
