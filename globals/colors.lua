
---The Colors API allows you to manipulate sets of colors.
---@class ColorAPI
colors = {
  ---White: Written as **`0`** in paint files and term.blit, has a default terminal color of #F0F0F0.
  white = 1,
  ---Orange: Written as **`1`** in paint files and term.blit, has a default terminal color of #F2B233.
  orange = 2,
  ---Magenta: Written as **`2`** in paint files and term.blit, has a default terminal color of #E57FD8.
  magenta = 4,
  ---Light blue: Written as **`3`** in paint files and `term.blit`, has a default terminal color of #99B2F2.
  lightBlue = 8,
  ---Yellow: Written as **`4`** in paint files and `term.blit`, has a default terminal color of #DEDE6C.
  yellow = 16,
  ---Lime: Written as **`5`** in paint files and `term.blit`, has a default terminal color of #7FCC19.
  lime = 32,
  ---Pink: Written as **`6`** in paint files and `term.blit`, has a default terminal color of #F2B2CC.
  pink = 64,
  ---Gray: Written as **`7`** in paint files and `term.blit`, has a default terminal color of #4C4C4C.
  gray = 128,
  ---Light gray: Written as **`8`** in paint files and `term.blit`, has a default terminal color of #999999.
  lightGray = 256,
  ---Cyan: Written as **`9`** in paint files and `term.blit`, has a default terminal color of #4C99B2.
  cyan = 512,
  ---Purple: Written as **`a`** in paint files and `term.blit`, has a default terminal color of #B266E5.
  purple = 1024,
  ---Blue: Written as **`b`** in paint files and `term.blit`, has a default terminal color of #3366CC.
  blue = 2048,
  ---Brown: Written as **`c`** in paint files and `term.blit`, has a default terminal color of #7F664C.
  brown = 4096,
  ---Green: Written as **`d`** in paint files and `term.blit`, has a default terminal color of #57A64E.
  green = 8192,
  ---Red: Written as **`e`** in paint files and `term.blit`, has a default terminal color of #CC4C4C.
  red = 16384,
  ---Black: Written as **`f`** in paint files and `term.blit`, has a default terminal color of #111111.
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

---> **DEPRECATED**
--->
---> Use packRGB or unpackRGB directly.
---
---Either calls `colors.packRGB` or `colors.unpackRGB,` depending on how many arguments it receives.
---@deprecated
---@param r number The red channel, should be between 0 and 1.
---@param g number The green channel, should be between 0 and 1.
---@param b number The blue channel, should be between 0 and 1.
---@return number color The combined hexadecimal color.
function colors.rgb8(r, g, b) end

---> **DEPRECATED**
--->
---> Use packRGB or unpackRGB directly.
---
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
