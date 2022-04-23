---The printer peripheral allows pages and books to be printed.
---@class printer
local printer = {}

---Writes text to the current page.
---@param ... string|number The values to write to the page.
function printer.write(...) end

---Returns the current position of the cursor on the page.
---@return integer x The X position of the cursor.
---@return integer y The Y position of the cursor.
function printer.getCursorPos() end

---Sets the position of the cursor on the page.
---@param x integer The X coordinate to set the cursor at.
---@param y integer The Y coordinate to set the cursor at.
function printer.setCursorPos(x, y) end

---Returns the size of the current page.
---@return integer width The width of the page.
---@return integer height The height of the page.
function printer.getPageSize() end

---Starts printing a new page.
function printer.newPage() end

---Finalizes printing of the current page and outputs it to the tray.
---@return boolean success Whether the page could be successfully finished.
function printer.endPage() end

---Sets the title of the current page.
---@param title? string The title to set for the page.
function printer.setPageTitle(title) end

---Returns the amount of ink left in the printer.
---@return integer level The amount of ink available to print with.
function printer.getInkLevel() end

---Returns the amount of paper left in the printer.
---@return integer level The amount of paper available to print with.
function printer.getPaperLevel() end
