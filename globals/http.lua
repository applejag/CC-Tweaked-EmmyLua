
---The http library allows communicating with web servers, sending and receiving data from them.
http = {}

---@class Request
---@field url string The url to request.
---@field body? string An optional string containing the body of the request. If specified, a POST request will be made instead.
---@field headers? table<string,string> Additional headers to send as part of this request.
---@field binary? boolean Whether to make a binary HTTP request. If true, the body will not be UTF-8 encoded, and the received response will not be decoded.
---@field method? string Which HTTP method to use, for instance `"PATCH"` or `"DELETE"`.
---@field redirect? boolean Whether to follow HTTP redirects. Defaults to true.
local _

---Asynchronously make a HTTP request to the given url.
---
---This returns immediately, a `http_success` or `http_failure` will be queued once the request has completed.
---@param url string The url to request.
---@param body? string An optional string containing the body of the request. If specified, a POST request will be made instead.
---@param headers? table<string,string> Additional headers to send as part of this request.
---@param binary? boolean Whether to make a binary HTTP request. If true, the body will not be UTF-8 encoded, and the received response will not be decoded.
---@return boolean success Whether the request was successfully created.
---@return string|nil error Reason why the request failed to be created.
---@overload fun(request: Request): boolean, string|nil
function http.request(url, body, headers, binary) end

---A http response. This provides the same methods as a file (or binary file if the request used binary mode), though provides several request specific methods.
---@class Response : ReadHandle, BinaryReadHandle
local Response = {}

---@class GetRequest
---@field url string The url to request.
---@field headers? table<string,string> Additional headers to send as part of this request.
---@field binary? boolean Whether to make a binary HTTP request. If true, the body will not be UTF-8 encoded, and the received response will not be decoded.
---@field method? string Which HTTP method to use, for instance `"PATCH"` or `"DELETE"`.
---@field redirect? boolean Whether to follow HTTP redirects. Defaults to true.
local _

---Make a HTTP GET request to the given url.
---@param url string The url to request.
---@param headers? table<string,string> Additional headers to send as part of this request.
---@param binary? boolean Whether to make a binary HTTP request. If true, the body will not be UTF-8 encoded, and the received response will not be decoded.
---@return Response|nil response The resulting http response, which can be read from, or `nil` when the http request failed, such as in the event of a 404 error or connection timeout..
---@return string|nil error A message detailing why the request failed.
---@return Response? response The failing http response, if available.
---@overload fun(request: GetRequest): Response|nil, string|nil, Response|nil
function http.get(url, headers, binary) end

---Make a HTTP POST request to the given url.
---@param url string The url to request.
---@param body string The body of the POST request.
---@param headers? table<string,string> Additional headers to send as part of this request.
---@param binary? boolean Whether to make a binary HTTP request. If true, the body will not be UTF-8 encoded, and the received response will not be decoded.
---@return Response|nil response The resulting http response, which can be read from, or `nil` when the http request failed, such as in the event of a 404 error or connection timeout..
---@return string? error A message detailing why the request failed.
---@return Response? response The failing http response, if available.
---@overload fun(request: Request): Response|nil, string|nil, Response|nil
function http.post(url, body, headers, binary) end

---Asynchronously determine whether a URL can be requested.
---
---If this returns `true`, one should also listen for `http_check` events which will container further information about whether the URL is allowed or not.
---@param url string The URL to check.
---@return boolean valid `true` When this url is valid. This does not imply that it is allowed - see the comment above.
---@return string? error A reason why this URL is not valid (for instance, if it is malformed, or blocked).
function http.checkURLAsync(url) end

---Determine whether a URL can be requested.
---
---If this returns `true`, one should also listen for `http_check` events which will container further information about whether the URL is allowed or not.
---@param url string The URL to check.
---@return boolean valid `true` When this url is valid. This does not imply that it is allowed - see the comment above.
---@return string? error A reason why this URL is not valid (for instance, if it is malformed, or blocked).
function http.checkURL(url) end

---A websocket, which can be used to send an receive messages with a web server.
---@class Websocket
local Websocket = {}

---Open a websocket.
---@param url string The websocket url to connect to. This should have the `ws://` or `wss://` protocol.
---@param headers? table<string,string> Additional headers to send as part of the initial websocket connection.
---@return Websocket|'false' websocket The websocket connection, or `false` if the websocket connection failed.
---@return string? error An error message describing why the connection failed.
function http.websocket(url, headers) end

---Asynchronously open a websocket.
---
---This returns immediately, a `websocket_success` or `websocket_failure` will be queued once the request has completed.
---@param url string The websocket url to connect to. This should have the `ws://` or `wss://` protocol.
---@param headers? table<string,string> Additional headers to send as part of the initial websocket connection.
---@return 'true'
function http.websocketAsync(url, headers) end

---Wait for a message from the server.
---@param timeout? number The number of seconds to wait if no message is received.
---@return string|nil message The received message, or `nil` if the websocket was closed while waiting, or if we timed out.
---@return boolean? binary If this was a binary message.
function Websocket.receive(timeout) end

---Send a websocket message to the connected server.
---@param message any The message to send.
---@param binary? boolean Whether this message should be treated as a binary message.
function Websocket.send(message, binary) end

---Close this websocket. This will terminate the connection, meaning messages can no longer be sent or received along it.
function Websocket.close() end

---Returns the response code and response message returned by the server.
---@return integer code The response code (i.e. 200)
---@return string status The response message (i.e. `"OK"`)
function Response.getResponseCode() end

---Get a table containing the response's headers, in a format similar to that required by `http.request`. If multiple headers are sent with the same name, they will be combined with a comma.
---
---**Usage:**
---
---- Make a request to [example.tweaked.cc](https://example.tweaked.cc), and print the returned headers.
---
---  ```lua
---  local request = http.get("https://example.tweaked.cc")
---  print(textutils.serialize(request.getResponseHeaders()))
---  -- => {
---  --  [ "Content-Type" ] = "text/plain; charset=utf8",
---  --  [ "content-length" ] = 17,
---  --  ...
---  -- }
---  request.close()
---  ```
---
---@return table<string,string> headers The response's headers.
function Response.getResponseHeaders() end

