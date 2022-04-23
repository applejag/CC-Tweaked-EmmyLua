
---The Colors API allows you to manipulate sets of colors.
---@class ColorAPI
colors = {
  white = 1,
  orange = 2,
  magenta = 4,
  lightBlue = 8,
  yellow = 16,
  lime = 32,
  pink = 64,
  gray = 128,
  lightGray = 256,
  cyan = 512,
  purple = 1024,
  blue = 2048,
  brown = 4096,
  green = 8192,
  red = 16384,
  black = 32768,
}

---Combines a set of colors (or sets of colors) into a larger set. Useful for Bundled Cables.
---@param ... number The colors to combine.
---@return number union The union of the color sets given in `...`
function colors.combine(...) end

---Removes one or more colors (or sets of colors) from an initial set. Useful for Bundled Cables.
---
---Each parameter beyond the first may be a single color or may be a set of colors (in the latter case, all colors in the set are removed from the original set).
---@param colors number The color from which to subtract.
---@param ... number The colors to subtract.
---@return number color The resulting color
function colors.subtract(colors, ...) end

---Tests whether `color` is contained within `colors`. Useful for Bundled Cables.
---@param colors number A color, or color set.
---@param color number A color or set of colors that `colors` should contain.
---@return boolean #If `colors` contains all colors within `colors`.
function colors.test(colors, color) end

---Combine a three-color RGB value into one hexadecimal representation.
---@param r number The red channel, should be between 0 and 1.
---@param g number The green channel, should be between 0 and 1.
---@param b number The blue channel, should be between 0 and 1.
---@return number color The combined hexadecimal color.
function colors.packRGB(r, g, b) end

---Separate a hexadecimal RGB color into its three constituent channels.
---@param rgb number The combined hexadecimal color.
---@return number r The red channel, will be between 0 and 1.
---@return number g The green channel, will be between 0 and 1.
---@return number b The blue channel, will be between 0 and 1.
function colors.unpackRGB(rgb) end

---Either calls `colors.packRGB` or `colors.unpackRGB,` depending on how many arguments it receives.
---@deprecated
---@param r number The red channel, should be between 0 and 1.
---@param g number The green channel, should be between 0 and 1.
---@param b number The blue channel, should be between 0 and 1.
---@return number color The combined hexadecimal color.
function colors.rgb8(r, g, b) end

---Either calls `colors.packRGB` or `colors.unpackRGB,` depending on how many arguments it receives.
---@deprecated
---@param rgb number The combined hexadecimal color.
---@return number r The red channel, will be between 0 and 1.
---@return number g The green channel, will be between 0 and 1.
---@return number b The blue channel, will be between 0 and 1.
function colors.rgb8(rgb) end

---Converts the given color to a paint/blit hex character `(0-9a-f)`.
---
---This is equivalent to converting `floor(log_2(color))` to hexadecimal.
---@param color number The color to convert
---@return string #The blit hex code of the color.
function colors.toBlit(color) end
