
---The Colours API allows you to manipulate sets of colours.
---@class ColourAPI
colours = {
  ---White: Written as **`0`** in paint files and term.blit, has a default terminal colour of #F0F0F0.
  white = 1,
  ---Orange: Written as **`1`** in paint files and term.blit, has a default terminal colour of #F2B233.
  orange = 2,
  ---Magenta: Written as **`2`** in paint files and term.blit, has a default terminal colour of #E57FD8.
  magenta = 4,
  ---Light blue: Written as **`3`** in paint files and `term.blit`, has a default terminal colour of #99B2F2.
  lightBlue = 8,
  ---Yellow: Written as **`4`** in paint files and `term.blit`, has a default terminal colour of #DEDE6C.
  yellow = 16,
  ---Lime: Written as **`5`** in paint files and `term.blit`, has a default terminal colour of #7FCC19.
  lime = 32,
  ---Pink: Written as **`6`** in paint files and `term.blit`, has a default terminal colour of #F2B2CC.
  pink = 64,
  ---Grey: Written as **`7`** in paint files and `term.blit`, has a default terminal colour of #4C4C4C.
  grey = 128,
  ---Light grey: Written as **`8`** in paint files and `term.blit`, has a default terminal colour of #999999.
  lightGrey = 256,
  ---Cyan: Written as **`9`** in paint files and `term.blit`, has a default terminal colour of #4C99B2.
  cyan = 512,
  ---Purple: Written as **`a`** in paint files and `term.blit`, has a default terminal colour of #B266E5.
  purple = 1024,
  ---Blue: Written as **`b`** in paint files and `term.blit`, has a default terminal colour of #3366CC.
  blue = 2048,
  ---Brown: Written as **`c`** in paint files and `term.blit`, has a default terminal colour of #7F664C.
  brown = 4096,
  ---Green: Written as **`d`** in paint files and `term.blit`, has a default terminal colour of #57A64E.
  green = 8192,
  ---Red: Written as **`e`** in paint files and `term.blit`, has a default terminal colour of #CC4C4C.
  red = 16384,
  ---Black: Written as **`f`** in paint files and `term.blit`, has a default terminal colour of #111111.
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
