---Provides utilities for working with "nft" images.
---
---nft ("Nitrogen Fingers Text") is a file format for drawing basic images. Unlike the images that `paintutils.parseImage` uses, nft supports coloured text.
---
---**Usage:**
---
---- Load an image from `example.nft` and draw it.
---
---  ```lua
---  local nft = require "cc.image.nft"
---  local image = assert(nft.load("data/example.nft"))
---  nft.draw(image, term.getCursorPos())
---  ```
---
local nft = {}

---Parse an nft image from a string.
---@param image string The image contents.
---@return table image The parsed image.
function nft.parse(image) end

---Load an nft image from a file.
---@param path string The file to load.
---@return table|nil image The parsed image.
---@return string? error An error message explaining why the file could not be loaded.
function nft.load(path) end

---Draw an nft image to the screen.
---@param image table An image, as returned from `load` or `draw`.
---@param xPos integer The x position to start drawing at.
---@param yPos integer The y position to start drawing at.
---@param target? Redirect The terminal redirect to draw to. Defaults to the current terminal.
function nft.draw(image, xPos, yPos, target) end

return nft
