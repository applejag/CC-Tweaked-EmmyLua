
---An API for advanced systems which can draw pixels and lines, load and draw image files. You can use the `colors` API for easier color manipulation.
paintutils = {}

---@alias Image integer[][]

---Parses an image from a multi-line string
---@param image string The string containing the raw-image data.
---@return Image image The parsed image data, suitable for use with `paintutils.drawImage`.
function paintutils.parseImage(image) end

---Loads an image from a file.
---
---You can create a file suitable for being loaded using the `paint` program.
---
---**Usage:**
---
---- Load an image and draw it.
---
---  ```lua
---  local image = paintutils.loadImage("data/example.nfp")
---  paintutils.drawImage(image, term.getCursorPos())
---  ```
---
---@param path string The file to load.
---@return Image|nil image The parsed image data, suitable for use with `paintutils.drawImage`, or `nil` if the file does not exist.
function paintutils.loadImage(path) end

---Draws a single pixel to the current term at the specified position.
---
---Be warned, this may change the position of the cursor and the current background colour. You should not expect either to be preserved.
---@param xPos integer The x position to draw at, where 1 is the far left.
---@param yPos integer The y position to draw at, where 1 is the very top.
---@param colour? integer The color of this pixel. This will be the current background colour if not specified.
function paintutils.drawPixel(xPos, yPos, colour) end

---Draws a straight line from the start to end position.
---
---Be warned, this may change the position of the cursor and the current background colour. You should not expect either to be preserved.
---
---**Usage:**
---
---- Draw a red line.
---
---  ```lua
---  paintutils.drawLine(2, 3, 30, 7, colors.red)
---  ```
---
---@param startX integer The starting x position of the line.
---@param startY integer The starting y position of the line.
---@param endX integer The end x position of the line.
---@param endY integer The end y position of the line.
---@param colour? integer The color of this pixel. This will be the current background colour if not specified.
function paintutils.drawLine(startX, startY, endX, endY, colour) end

---Draws the outline of a box on the current term from the specified start position to the specified end position.
---
---Be warned, this may change the position of the cursor and the current background colour. You should not expect either to be preserved.
---
---**Usage:**
---
---- Draw a red border.
---
---  ```lua
---  paintutils.drawBox(2, 3, 30, 7, colors.red)
---  ```
---
---@param startX integer The starting x position of the line.
---@param startY integer The starting y position of the line.
---@param endX integer The end x position of the line.
---@param endY integer The end y position of the line.
---@param colour? integer The color of this pixel. This will be the current background colour if not specified.
function paintutils.drawBox(startX, startY, endX, endY, colour) end

---Draws a filled box on the current term from the specified start position to the specified end position.
---
---Be warned, this may change the position of the cursor and the current background colour. You should not expect either to be preserved.
---
---**Usage:**
---
---- Draw a red filled box.
---
---  ```lua
---  paintutils.drawBox(2, 3, 30, 7, colors.red)
---  ```
---
---@param startX integer The starting x position of the line.
---@param startY integer The starting y position of the line.
---@param endX integer The end x position of the line.
---@param endY integer The end y position of the line.
---@param colour? integer The color of this pixel. This will be the current background colour if not specified.
function paintutils.drawFilledBox(startX, startY, endX, endY, colour) end

---Draw an image loaded by `paintutils.parseImage` or `paintutils.loadImage`.
---@param image Image The parsed image data.
---@param xPos integer The x position to start drawing at.
---@param yPos integer The y position to start drawing at.
function paintutils.drawImage(image, xPos, yPos) end
