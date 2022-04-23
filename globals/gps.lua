
---The GPS API provides a method for turtles and computers to retrieve their own locations.
---
---It broadcasts a PING message over rednet and wait for responses. In order for this system to work, there must be at least 4 computers used as gps hosts which will respond and allow trilateration. Three of these hosts should be in a plane, and the fourth should be either above or below the other three. The three in a plane should not be in a line with each other. You can set up hosts using the gps program.
gps = {
  ---The channel which GPS requests and responses are broadcast on.
  CHANNEL_GPS = 65534,
}

---Tries to retrieve the computer or turtles own location.
---@param timeout? number The maximum time in seconds taken to establish our position. Defaults to 2.
---@param debug? boolean Print debugging messages.
---@return number|nil x This computer's `x` position, or nil if the location could not be established.
---@return number? y This computer's `y` position.
---@return number? z This computer's `z` position.
function gps.locate(timeout, debug) end
