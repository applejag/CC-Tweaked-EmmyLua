
---The Colours API allows you to manipulate sets of colours.
---@class ColourAPI
colours = {
  white = 1,
  orange = 2,
  magenta = 4,
  lightBlue = 8,
  yellow = 16,
  lime = 32,
  pink = 64,
  grey = 128,
  lightGrey = 256,
  cyan = 512,
  purple = 1024,
  blue = 2048,
  brown = 4096,
  green = 8192,
  red = 16384,
  black = 32768,
}

---Combines a set of colours (or sets of colours) into a larger set. Useful for Bundled Cables.
---@param ... number The colours to combine.
---@return number union The union of the colour sets given in `...`
function colours.combine(...) end

---Removes one or more colours (or sets of colours) from an initial set. Useful for Bundled Cables.
---
---Each parameter beyond the first may be a single colour or may be a set of colours (in the latter case, all colours in the set are removed from the original set).
---@param colours number The colour from which to subtract.
---@param ... number The colours to subtract.
---@return number colour The resulting colour
function colours.subtract(colours, ...) end

---Tests whether `colour` is contained within `colours`. Useful for Bundled Cables.
---@param colours number A colour, or colour set.
---@param colour number A colour or set of colours that `colours` should contain.
---@return boolean #If `colours` contains all colours within `colours`.
function colours.test(colours, colour) end

---Combine a three-colour RGB value into one hexadecimal representation.
---@param r number The red channel, should be between 0 and 1.
---@param g number The green channel, should be between 0 and 1.
---@param b number The blue channel, should be between 0 and 1.
---@return number colour The combined hexadecimal colour.
function colours.packRGB(r, g, b) end

---Separate a hexadecimal RGB colour into its three constituent channels.
---@param rgb number The combined hexadecimal colour.
---@return number r The red channel, will be between 0 and 1.
---@return number g The green channel, will be between 0 and 1.
---@return number b The blue channel, will be between 0 and 1.
function colours.unpackRGB(rgb) end

---> **DEPRECATED**
--->
---> Use packRGB or unpackRGB directly.
---
---Either calls `colours.packRGB` or `colours.unpackRGB,` depending on how many arguments it receives.
---@deprecated
---@param r number The red channel, should be between 0 and 1.
---@param g number The green channel, should be between 0 and 1.
---@param b number The blue channel, should be between 0 and 1.
---@return number colour The combined hexadecimal colour.
function colours.rgb8(r, g, b) end

---> **DEPRECATED**
--->
---> Use packRGB or unpackRGB directly.
---
---Either calls `colours.packRGB` or `colours.unpackRGB,` depending on how many arguments it receives.
---@deprecated
---@param rgb number The combined hexadecimal colour.
---@return number r The red channel, will be between 0 and 1.
---@return number g The green channel, will be between 0 and 1.
---@return number b The blue channel, will be between 0 and 1.
function colours.rgb8(rgb) end

---Converts the given colour to a paint/blit hex character `(0-9a-f)`.
---
---This is equivalent to converting `floor(log_2(colour))` to hexadecimal.
---@param colour number The colour to convert
---@return string #The blit hex code of the colour.
function colours.toBlit(colour) end
