
--- A document containing formatted text, with multiple possible layouts.
--
---Documents effectively represent a sequence of strings in alternative layouts,
---which we will try to print in the most compact form necessary.
--
---@class Doc
local Doc = {}

---An empty document.
---@type Doc
local empty = { tag = "nil" }

---A document with a single space in it.
---@type Doc
local space = { tag = "text", text = " " }

---A line break. When collapsed with `group`, this will be replaced with `empty`.
---@type Doc
local line = { tag = "line", flat = empty }

---A line break. When collapsed with `group`, this will be replaced with `space`.
---@type Doc
local space_line = { tag = "line", flat = space }

---Provides a "pretty printer", for rendering data structures in an aesthetically pleasing manner.
---
---In order to display something using `cc.pretty`, you build up a series of documents. These behave a little bit like strings; you can concatenate them together and then print them to the screen.
---
---However, documents also allow you to control how they should be printed. There are several functions (such as nest and group) which allow you to control the "layout" of the document. When you come to display the document, the 'best' (most compact) layout is used.
---
---The structure of this module is based on A Prettier Printer.
---
---**Usage:**
---
---- Print a table to the terminal
---
---  ```lua
---  local pretty = require "cc.pretty"
---  pretty.pretty_print({ 1, 2, 3 })
---  ```
---
---- Build a custom document and display it
---
---  ```lua
---  local pretty = require "cc.pretty"
---  pretty.print(pretty.group(pretty.text("hello") .. pretty.space_line .. pretty.text("world")))
---  ```
---
local pretty = {
	empty = empty,
	space = space,
	line = line,
	space_line = space_line,
}

---Create a new document from a string.
---
---If your string contains multiple lines, `group` will flatten the string into a single line, with spaces between each line.
---
---**Usage:**
---
---- Write some blue text.
---
---  ```lua
---  local pretty = require "cc.pretty"
---  pretty.print(pretty.text("Hello!", colours.blue))
---  ```
---
---@param text string The string to construct a new document with.
---@param colour? integer The colour this text should be printed with. If not given, we default to the current colour.
---@return Doc doc The document with the provided text.
function pretty.text(text, colour) end

---Concatenate several documents together. This behaves very similar to string concatenation.
---
---**Usage:**
---
---- Concatenate texts.
---
---  ```lua
---  local pretty = require "cc.pretty"
---  local doc1, doc2 = pretty.text("doc1"), pretty.text("doc2")
---  print(pretty.concat(doc1, " - ", doc2))
---  print(doc1 .. " - " .. doc2) -- Also supports ..
---  ```
---
---@param ... Doc|string The documents to concatenate.
---@return Doc doc The concatenated documents.
function pretty.concat(...) end

---Indent later lines of the given document with the given number of spaces.
---
---For instance, nesting the document
---
---```
---foo
---bar
---```
---
---by two spaces will produce
---
---```
---foo
---  bar
---```
---
---**Usage:**
---
---- Indents document.
---
---  ```lua
---  local pretty = require "cc.pretty"
---  print(pretty.nest(2, pretty.text("foo\nbar")))
---  ```
---
---@param depth integer The number of spaces with which the document should be indented.
---@param doc Doc The document to indent.
---@return Doc doc The nested document.
function pretty.nest(depth, doc) end

---Builds a document which is displayed on a single line if there is enough room, or as normal if not.
---
---**Usage:**
---
---- Uses group to show things being displayed on one or multiple lines.
---
---  ```lua
---  local pretty = require "cc.pretty"
---  local doc = pretty.group("Hello" .. pretty.space_line .. "World")
---  print(pretty.render(doc, 5)) -- On multiple lines
---  print(pretty.render(doc, 20)) -- Collapsed onto one.
---  ```
---
---@param doc Doc The document to group.
---@return Doc doc The grouped document.
function pretty.group(doc) end

---Display a document on the terminal.
---@param doc Doc The document to render.
---@param ribbon_frac? number The maximum fraction of the width that we should write in. Defaults to `0.6`.
function pretty.write(doc, ribbon_frac) end

---Display a document on the terminal with a trailing new line.
---@param doc Doc The document to render.
---@param ribbon_frac? number The maximum fraction of the width that we should write in. Defaults to `0.6`.
function pretty.print(doc, ribbon_frac) end

---Render a document, converting it into a string.
---@param doc Doc The document to render.
---@param width? integer The maximum width of this document. Note that long strings will not be wrapped to fit this width - it is only used for finding the best layout.
---@param ribbon_frac? number The maximum fraction of the width that we should write in. Defaults to `0.6`.
---@return string #The rendered document as a string.
function pretty.render(doc, width, ribbon_frac) end

---@class prettyOptions
---@field function_arg boolean Show the arguments to a function if known (`false` by default).
---@field function_source boolean Show where the function was defined, instead of `function: xxxxxxxx` (`false` by default).
local _

---Pretty-print an arbitrary object, converting it into a document.
---
---This can then be rendered with `write` or `print`.
---
---**Usage:**
---
---- Display a table on the screen
---
---  ```lua
---  local pretty = require "cc.pretty"
---  pretty.print(pretty.pretty({ 1, 2, 3 }))
---  ```
---
---@param obj any The object to pretty-print.
---@param options? prettyOptions Controls how various properties are displayed.
---@return Doc doc The object formatted as a document.
function pretty.pretty(obj, options) end

---A shortcut for calling pretty and print together.
---
---**Usage:**
---
---- Display a table on the screen
---
---  ```lua
---  local pretty = require "cc.pretty"
---  pretty.pretty_print({ 1, 2, 3 })
---  ```
---
---@param obj any The object to pretty-print.
---@param options? prettyOptions Controls how various properties are displayed.
---@param ribbon_frac? number The maximum fraction of the width that we should write in. Defaults to `0.6`.
function pretty.pretty_print(obj, options, ribbon_frac) end

return pretty
