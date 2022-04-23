
---A base class for all objects which interact with a terminal. Namely the term and monitors.
---@class Redirect
local Redirect = {}

---Write text at the current cursor position, moving the cursor to the end of the text.
---
---Unlike functions like write and print, this does not wrap the text - it simply copies the text to the current terminal line.
---@param text string The text to write.
function Redirect.write(text) end

---Move all positions up (or down) by y pixels.
---
---Every pixel in the terminal will be replaced by the line y pixels below it. If y is negative, it will copy pixels from above instead.
---@param y integer The number of lines to move up by. This may be a negative number.
function Redirect.scroll(y) end

---Get the position of the cursor.
---@return integer x The x position of the cursor.
---@return integer y The y position of the cursor.
function Redirect.getCursorPos() end

---Set the position of the cursor. terminal writes will begin from this position.
---@param x integer The new x position of the cursor.
---@param y integer The new y position of the cursor.
function Redirect.setCursorPos(x, y) end

---Checks if the cursor is currently blinking.
---@return boolean #If the cursor is blinking.
function Redirect.getCursorBlink() end

---Sets whether the cursor should be visible (and blinking) at the current cursor position.
---@param blink boolean Whether the cursor should blink.
function Redirect.setCursorBlink(blink) end

---Get the size of the terminal.
---@return integer width
---@return integer height
function Redirect.getSize() end

---Clears the terminal, filling it with the current background colour.
function Redirect.clear() end

---Clears the line the cursor is currently on, filling it with the current background colour.
function Redirect.clearLine() end

---Return the colour that new text will be written as.
---@return integer colour The current text colour.
function Redirect.getTextColour() end

---Return the color that new text will be written as.
---@return integer color The current text color.
function Redirect.getTextColor() end

---Set the colour that new text will be written as.
---@param colour integer The new text colour.
function Redirect.setTextColour(colour) end

---Set the color that new text will be written as.
---@param color integer The new text color.
function Redirect.setTextColor(color) end

---Return the current background colour. This is used when writing text and clearing the terminal.
---@return integer colour The current background colour.
function Redirect.getBackgroundColour() end

---Return the current background color. This is used when writing text and clearing the terminal.
---@return integer color The current background color.
function Redirect.getBackgroundColor() end

---Set the current background colour. This is used when writing text and clearing the terminal.
---@param colour integer The new background colour.
function Redirect.setBackgroundColour(colour) end

---Set the current background color. This is used when writing text and clearing the terminal.
---@param color integer The new background color.
function Redirect.setBackgroundColor(color) end

---Determine if this terminal supports colour.
---
---Terminals which do not support colour will still allow writing coloured text/backgrounds, but it will be displayed in greyscale.
---@return boolean #Whether this terminal supports colours.
function Redirect.isColour() end

---Determine if this terminal supports color.
---
---Terminals which do not support color will still allow writing colored text/backgrounds, but it will be displayed in greyscale.
---@return boolean #Whether this terminal supports colors.
function Redirect.isColor() end

---Writes text to the terminal with the specific foreground and background characters.
---
---As with write, the text will be written at the current cursor location, with the cursor moving to the end of the text.
---
---textColour and backgroundColour must both be strings the same length as text. All characters represent a single hexadecimal digit, which is converted to one of CC's colours. For instance, "a" corresponds to purple.
---@param text string The text to write.
---@param textColour string The corresponding text colours.
---@param backgroundColour string The corresponding background colours.
function Redirect.blit(text, textColour, backgroundColour) end

---Set the palette for a specific colour.
---
---ComputerCraft's palette system allows you to change how a specific colour should be displayed. For instance, you can make colours.red more red by setting its palette to #FF0000. This does now allow you to draw more colours - you are still limited to 16 on the screen at one time - but you can change which colours are used.
---@param index integer The colour whose palette should be changed.
---@param colour number A 24-bit integer representing the RGB value of the colour. For instance the integer 0xFF0000 corresponds to the colour #FF0000.
function Redirect.setPaletteColour(index, colour) end

---@param index integer The colour whose palette should be changed.
---@param r integer The intensity of the red channel, between 0 and 1.
---@param g integer The intensity of the green channel, between 0 and 1.
---@param b integer The intensity of the blue channel, between 0 and 1.
function Redirect.setPaletteColour(index, r, g, b) end

---Set the palette for a specific color.
---
---ComputerCraft's palette system allows you to change how a specific color should be displayed. For instance, you can make colors.red more red by setting its palette to #FF0000. This does now allow you to draw more colors - you are still limited to 16 on the screen at one time - but you can change which colors are used.
---@param index integer The color whose palette should be changed.
---@param color number A 24-bit integer representing the RGB value of the color. For instance the integer 0xFF0000 corresponds to the color #FF0000.
function Redirect.setPaletteColor(index, color) end

---@param index integer The color whose palette should be changed.
---@param r integer The intensity of the red channel, between 0 and 1.
---@param g integer The intensity of the green channel, between 0 and 1.
---@param b integer The intensity of the blue channel, between 0 and 1.
function Redirect.setPaletteColor(index, r, g, b) end

---Get the current palette for a specific colour.
---@param colour integer The colour whose palette should be fetched.
---@return number r The red channel, will be between 0 and 1.
---@return number g The green channel, will be between 0 and 1.
---@return number b The blue channel, will be between 0 and 1.
function Redirect.getPaletteColour(colour) end

---Get the current palette for a specific color.
---@param color integer The color whose palette should be fetched.
---@return number r The red channel, will be between 0 and 1.
---@return number g The green channel, will be between 0 and 1.
---@return number b The blue channel, will be between 0 and 1.
function Redirect.getPaletteColor(color) end

---The Terminal API provides functions for writing text to the terminal and monitors, and drawing ASCII graphics.
---@class term : Redirect
term = {}

---Get the default palette value for a colour.
---@param colour number The colour whose palette should be fetched.
---@return number r The red channel, will be between 0 and 1.
---@return number g The green channel, will be between 0 and 1.
---@return number b The blue channel, will be between 0 and 1.
function term.nativePaletteColour(colour) end

---Get the default palette value for a color.
---@param color number The color whose palette should be fetched.
---@return number r The red channel, will be between 0 and 1.
---@return number g The green channel, will be between 0 and 1.
---@return number b The blue channel, will be between 0 and 1.
function term.nativePaletteColor(color) end

---Redirects terminal output to a monitor, a window, or any other custom terminal object. Once the redirect is performed, any calls to a "term" function - or to a function that makes use of a term function, as print - will instead operate with the new terminal object.
---
---A "terminal object" is simply a table that contains functions with the same names - and general features - as those found in the term table. For example, a wrapped monitor is suitable.
---
---The redirect can be undone by pointing back to the previous terminal object (which this function returns whenever you switch).
---@param target Redirect The terminal redirect the term API will draw to.
---@return Redirect previous The previous redirect object, as returned by term.current.
function term.redirect(target) end

---Returns the current terminal object of the computer.
---@return Redirect current The current terminal redirect.
function term.current() end

---Get the native terminal object of the current computer.
---
---It is recommended you do not use this function unless you absolutely have to. In a multitasked environment, term.native will not be the current terminal object, and so drawing may interfere with other programs.
---@return Redirect native The native terminal redirect.
function term.native() end
