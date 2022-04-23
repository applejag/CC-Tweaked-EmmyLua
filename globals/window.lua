
---@class Window : Redirect
local Window = {}

---Get the buffered contents of a line in this window
---@param y integer The y position of the line to get.
---@return string text The textual content of this line.
---@return string fg The text colors of this line, suitable for use with term.blit.
---@return string bg The background colors of this line, suitable for use with term.blit.
function Window.getLine(y) end

---Set whether this window is visible. Invisible windows will not be drawn to the screen until they are made visible again. Making an invisible window visible will immediately draw it.
---@param visible boolean
function Window.setVisible(visible) end

---Get whether this window is visible. Invisible windows will not be drawn to the screen until they are made visible again.
---@return boolean
function Window.isVisible() end

---Draw this window. This does nothing if the window is not visible.
function Window.redraw() end

---Set the current terminal's cursor to where this window's cursor is. This does nothing if the window is not visible.
function Window.restoreCursor() end

---Get the position of the top left corner of this window.
---@return integer x The x position of this window.
---@return integer y The y position of this window.
function Window.getPosition() end

---Reposition or resize the given window.
---
---This function also accepts arguments to change the size of this window. It is recommended that you fire a term_resize event after changing a window's, to allow programs to adjust their sizing.
---@param new_x integer The new x position of this window.
---@param new_y integer The new y position of this window.
---@param new_width? integer The new width of this window.
---@param new_height? integer The new height of this window.
---@param new_parent? Redirect The new redirect object this window should draw to.
function Window.reposition(new_x, new_y, new_width, new_height, new_parent) end

---The Window API allows easy definition of spaces within the display that can be written/drawn to, then later redrawn/repositioned/etc as need be. The API itself contains only one function, window.create, which returns the windows themselves.
window = {}

---Returns a terminal object that is a space within the specified parent terminal object.
---@param parent Redirect
---@param x number The x coordinate this window is drawn at in the parent terminal
---@param y number The y coordinate this window is drawn at in the parent terminal
---@param width number The width of this window.
---@param height number The height of this window.
---@param startVisible? boolean Whether this window is visible by default. Defaults to `true`.
---@return Window #The constructed window.
function window.create(parent, x, y, width, height, startVisible) end
