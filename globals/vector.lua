
---The vector API provides methods to create and manipulate vectors.
---
---An introduction to vectors can be found on Wikipedia.
---@class vector
vector = {}

---A 3-dimensional vector, with `x`, `y`, and `z` values.
---
---This is suitable for representing both position and directional vectors.
---@class Vector
local Vector = {}

---Construct a new `Vector` with the given coordinates.
---@param x number The X coordinate or direction of the vector.
---@param y number The Y coordinate or direction of the vector.
---@param z number The Z coordinate or direction of the vector.
---@return Vector vector The constructed vector.
function vector.new(x, y, z) end

---Adds two vectors together.
---
---The addition operator can be used as well:
---
---```lua
---local v1 = vector.new(21, 9, 3)
---local v2 = vector.new(5, 2, 1)
---v1:add(v2) --> (26, 11, 4)
---v1 + v2    --> (26, 11, 4)
---```
---@param o Vector The second vector to add.
---@return Vector vector The resulting vector.
function Vector:add(o) end

---Subtracts one vector from another.
---
---The subtraction operator can be used as well:
---
---```lua
---local v1 = vector.new(21, 9, 3)
---local v2 = vector.new(5, 2, 1)
---v1:sub(v2) --> (16, 7, 2)
---v1 - v2    --> (16, 7, 2)
---```
---@param o Vector The second vector to subtract.
---@return Vector vector The resulting vector.
function Vector:sub(o) end

---Multiplies a vector by a scalar value.
---
---The multiplication operator can be used as well:
---
---```lua
---local v1 = vector.new(21, 9, 3)
---v1:mul(3) --> (189, 21, 9)
---v1 * 3    --> (189, 21, 9)
---```
---@param m number The scalar value to multiply with.
---@return Vector vector A vector with value `(x * m, y * m, z * m)`.
function Vector:mul(m) end

---Divides a vector by a scalar value.
---
---The division operator can be used as well:
---
---```lua
---local v1 = vector.new(21, 9, 3)
---v1:div(3) --> (9, 3, 1)
---v1 / 3    --> (9, 3, 1)
---```
---@param m number The scalar value to divide by.
---@return Vector vector A vector with value `(x / m, y / m, z / m)`.
function Vector:div(m) end

---Negate a vector.
---
---The unary negation operator can be used as well:
---
---```lua
---local v1 = vector.new(21, 9, 3)
---v1:unm() --> (-21, -9, -3)
----v1      --> (-21, -9, -3)
---```
---@return Vector vector The negated vector.
function Vector:unm() end

---Compute the dot product of two vectors.
---@param o Vector The second vector to compute the dot product of.
---@return Vector vector The dot product of `self` and `o`.
function Vector:dot(o) end

---Compute the cross product of two vectors.
---@param o Vector The second vector to compute the cross product of.
---@return Vector vector The cross product of `self` and `o`.
function Vector:cross(o) end

---Get the length (also referred to as magnitude) of this vector.
---@return number length The length of this vector.
function Vector:length() end

---Divide this vector by its length, producing with the same direction, but of length 1.
---@return Vector vector The normalized vector.
function Vector:normalize() end

---Construct a vector with each dimension rounded to the nearest value.
---@param tolerance? number The tolerance that we should round to, defaulting to 1. For instance, a tolerance of 0.5 will round to the nearest 0.5.
---@return Vector vector The rounded vector.
function Vector:round(tolerance) end

---Convert this vector into a string, for pretty printing.
---
---The built-in `tostring` can also be used:
---
---```lua
---local v1 = vector.new(21, 9, 3)
---v1:tostring() --> "21,9,3"
---tostring(v1)  --> "21,9,3"
---```
---@return string #This vector's string representation.
function Vector:tostring() end

---Check for equality between two vectors.
---
---The equality operator can also be used:
---
---```lua
---local v1 = vector.new(21, 9, 3)
---local v2 = vector.new(21, 9, 3)
---v1:equals(v2) --> true
---v1 == v2      --> true
---
---local v3 = vector.new(9, 3, 21)
---v1:equals(v3) --> false
---v1 == v3      --> false
---```
---@param other Vector The second vector to compare to.
---@return boolean #Whether or not the vectors are equal
function Vector:equals(other) end
