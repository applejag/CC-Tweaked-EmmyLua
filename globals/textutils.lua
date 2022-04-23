
---The textutils API provides helpful utilities for formatting and manipulating strings.
---@class textutils
textutils = {
  ---A table representing an empty JSON array, in order to distinguish it from an empty JSON object.
  ---
  ---The contents of this table should not be modified.
  empty_json_array = {},
  ---A table representing the JSON null value.
  ---
  ---The contents of this table should not be modified.
  json_null = {},
}

---Slowly writes string text at current cursor position, character-by-character.
---
---Like _G.write, this does not insert a newline at the end.
---@param sText string The text to write to the screen.
---@param nRate? number The number of characters to write each second. Defaults to 20.
function textutils.slowWrite(sText, nRate) end

---Slowly prints string text at current cursor position, character-by-character.
---
---Like print, this inserts a newline after printing.
---@param sText string The text to write to the screen.
---@param nRate? number The number of characters to write each second. Defaults to 20.
function textutils.slowPrint(sText, nRate) end

---Takes input time and formats it in a more readable format such as 6:30 PM.
---@param nTime number The time to format, as provided by `os.time`.
---@param bTwentyFourHour boolean Whether to format this as a 24-hour clock (18:30) rather than a 12-hour one (6:30 AM).
---@return string formattedTime The formatted time.
function textutils.formatTime(nTime, bTwentyFourHour) end

---Prints a given string to the display.
---
---If the action can be completed without scrolling, it acts much the same as print; otherwise, it will throw up a "Press any key to continue" prompt at the bottom of the display. Each press will cause it to scroll down and write a single line more before prompting again, if need be.
---@param text string The text to print to the screen.
---@param free_lines? number The number of lines which will be automatically scrolled before the first prompt appears (meaning free_lines + 1 lines will be printed). This can be set to the cursor's y position - 2 to always try to fill the screen. Defaults to 0, meaning only one line is displayed before prompting.
---@return number lines The number of lines printed.
function textutils.pagedPrint(text, free_lines) end

---Prints tables in a structured form.
---
---This accepts multiple arguments, either a table or a number. When encountering a table, this will be treated as a table row, with each column width being auto-adjusted.
---
---When encountering a number, this sets the text color of the subsequent rows to it.
---@param ... string[]|number The rows and text colors to display.
function textutils.tabulate(...) end

---Prints tables in a structured form, stopping and prompting for input should the result not fit on the terminal.
---
---This functions identically to textutils.tabulate, but will prompt for user input should the whole output not fit on the display.
---@param ... string[]|number The rows and text colors to display.
function textutils.pagedTabulate(...) end

---@class serializeOpts
---@field compact boolean Do not emit indentation and other whitespace between terms.
---@field allow_repetitions boolean Relax the check for recursive tables, allowing them to appear multiple times (as long as tables do not appear inside themselves).
local _

---Convert a Lua object into a textual representation, suitable for saving in a file or pretty-printing.
---@param t any
---@param opts serializeOpts
---@return string #The serialized representation.
function textutils.serialize(t, opts) end

---Convert a Lua object into a textual representation, suitable for saving in a file or pretty-printing.
---@param t any
---@param opts serializeOpts
---@return string #The serialised representation.
function textutils.serialise(t, opts) end

---Converts a serialised string back into a reassembled Lua object.
---
---This is mainly used together with textutils.serialize.
---@param s string The serialized string to deserialize.
---@return any|nil #The deserialized object, or `nil` if the object could not be deserialized.
function textutils.unserialize(s) end

---Converts a serialised string back into a reassembled Lua object.
---
---This is mainly used together with textutils.serialise.
---@param s string The serialised string to deserialise.
---@return any|nil #The deserialised object, or `nil` if the object could not be deserialised.
function textutils.unserialise(s) end

---Returns a JSON representation of the given data.
---
---This function attempts to guess whether a table is a JSON array or object. However, empty tables are assumed to be empty objects - use textutils.empty_json_array to mark an empty array.
---
---This is largely intended for interacting with various functions from the commands API, though may also be used in making http requests.
---@param t any The value to serialise. Like textutils.serialise, this should not contain recursive tables or functions.
---@param bNBTStyle? boolean Whether to produce NBT-style JSON (non-quoted keys) instead of standard JSON.
---@return string json The JSON representation of the input.
function textutils.serializeJSON(t, bNBTStyle) end

---Returns a JSON representation of the given data.
---
---This function attempts to guess whether a table is a JSON array or object. However, empty tables are assumed to be empty objects - use textutils.empty_json_array to mark an empty array.
---
---This is largely intended for interacting with various functions from the commands API, though may also be used in making http requests.
---@param t any The value to serialise. Like textutils.serialise, this should not contain recursive tables or functions.
---@param bNBTStyle? boolean Whether to produce NBT-style JSON (non-quoted keys) instead of standard JSON.
---@return string json The JSON representation of the input.
function textutils.serialiseJSON(t, bNBTStyle) end

---@class unserializeJSONOptions
---@field nbt_style? boolean When true, this will accept stringified NBT strings, as produced by many commands.
---@field parse_null? boolean When true, `null` will be parsed as `json_null`, rather than `nil`.
local _

---Converts a serialised JSON string back into a reassembled Lua object.
---
---This may be used with textutils.serializeJSON, or when communicating with command blocks or web APIs.
---@param s string The serialised string to deserialise.
---@param options unserializeJSONOptions Options which control how this JSON object is parsed.
---@return any obj The deserialized object. Is `nil` if there was an error.
---@return string error A message describing why the JSON string is invalid.
function textutils.unserializeJSON(s, options) end

---Converts a serialised JSON string back into a reassembled Lua object.
---
---This may be used with textutils.serialiseJSON, or when communicating with command blocks or web APIs.
---@param s string The serialised string to deserialise.
---@param options unserializeJSONOptions Options which control how this JSON object is parsed.
---@return any obj The deserialised object. Is `nil` if there was an error.
---@return string error A message describing why the JSON string is invalid.
function textutils.unserialiseJSON(s, options) end

---Replaces certain characters in a string to make it safe for use in URLs or POST data.
---@param str string The string to encode.
---@return string #The encoded string.
function textutils.urlEncode(str) end

---Provides a list of possible completions for a partial Lua expression.
---
---If the completed element is a table, suggestions will have `.` appended to them. Similarly, functions have `(` appended to them.
---@param sSearchText string The partial expression to complete, such as a variable name or table index.
---@param tSearchTable? table The table to find variables in, defaulting to the global
---@return string[] list The (possibly empty) list of completions.
function textutils.complete(sSearchText, tSearchTable) end
