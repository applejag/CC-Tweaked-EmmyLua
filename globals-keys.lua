
---The Keys API provides a table of numerical codes corresponding to keyboard keys, suitable for decoding key events.
---
---These values are not guaranteed to remain the same between versions. It is recommended that you use the constants provided by this file, rather than the underlying numerical values.
---@class keys
keys = {
  a = 65, b = 66, c = 67, d = 68, e = 69,
  f = 70, g = 71, h = 72, i = 73, j = 74,
  k = 75, l = 76, m = 77, n = 78, o = 79,
  p = 80, q = 81, r = 82, s = 83, t = 84,
  u = 85, v = 86, w = 87, x = 88, y = 89,
  z = 90,

  f1 = 290, f2 = 291, f3 = 292, f4 = 293, f5 = 294,
  f6 = 295, f7 = 296, f8 = 297, f9 = 298, f10 = 299,
  f11 = 300, f12 = 301, f13 = 302, f14 = 303, f15 = 304,
  f16 = 305, f17 = 306, f18 = 307, f19 = 308, f20 = 309,
  f21 = 310, f22 = 311, f23 = 312, f24 = 313, f25 = 314,

  left = 263, leftAlt = 342, leftBracket = 91,
  leftCtrl = 341, leftShift = 340, leftSuper = 343,
  right = 262, rightAlt = 346, rightBracket = 93,
  rightCtrl = 345, rightShift = 344,
  up = 265, down = 264,
  pageUp = 266, pageDown = 267,
  home = 268, ["end"] = 269,

  apostrophe = 39, backslash = 92, comma = 44,
  equals = 61, grave = 96, minus = 45,
  period = 46, semicolon = 59, slash = 47,
  space = 32, tab = 258,

  numPad0 = 320, numPad1 = 321, numPad2 = 322,
  numPad3 = 323, numPad4 = 324, numPad5 = 325,
  numPad6 = 326, numPad7 = 327, numPad8 = 328,
  numPad9 = 329, numLock = 282, numPadAdd = 334,
  numPadDecimal = 330, numPadDivide = 331,
  numPadEnter = 335, numPadEqual = 336,
  numPadMultiply = 332, numPadSubtract = 333,

  backspace = 259, delete = 261,
  capsLock = 280, scollLock = 281, scrollLock = 281,
  enter = 257, ["return"] = 257,
  insert = 260, menu = 348, pause = 284, printScreen = 283,

  zero = 48, one = 49, two = 50,
  three = 51, four = 52, five = 53,
  six = 54, seven = 55, eight = 56,
  nine = 57,
}

---Translates a numerical key code to a human-readable name. The human-readable name is one of the constants in the keys API.
---@param code number The key code to look up.
---@return string|nil key The name of the key, or `nil` if not a valid key code.
function keys.getName(code) end
