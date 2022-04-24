
---Provides utilities for converting between streams of DFPWM audio data and a list of amplitudes.
---
---DFPWM (Dynamic Filter Pulse Width Modulation) is an audio codec designed by GreaseMonkey. It's a relatively compact format compared to raw PCM data, only using 1 bit per sample, but is simple enough to simple enough to encode and decode in real time.
---
---Typically DFPWM audio is read from the filesystem or a a web request as a string, and converted a format suitable for `speaker.playAudio`.
local dfpwm = {}

---Create a new encoder for converting PCM audio data into DFPWM.
---
---The returned encoder is itself a function. This function accepts a table of amplitude data between -128 and 127 and returns the encoded DFPWM data.
---
---> **REUSING ENCODERS**
--->
---> Encoders have lots of internal state which tracks the state of the current stream. If you reuse an encoder for multiple streams, or use different encoders for the same stream, the resulting audio may not sound correct.
---
---@return fun(pcm: number[]): string encoder The encoder function.
function dfpwm.make_encoder() end

---A convenience function for encoding a complete file of audio at once.
---
---This should only be used for complete pieces of audio. If you are writing writing multiple chunks to the same place, you should use an encoder returned by `make_encoder` instead.
---@param input number[] The table of amplitude data.
---@return string data The encoded DFPWM data.
function dfpwm.encode(input) end

---Create a new decoder for converting DFPWM into PCM audio data.
---
---The returned decoder is itself a function. This function accepts a string and returns a table of amplitudes, each value between -128 and 127.
---
---> **REUSING DECODERS**
--->
---> Decoders have lots of internal state which tracks the state of the current stream. If you reuse an decoder for multiple streams, or use different decoders for the same stream, the resulting audio may not sound correct.
---
---**Usage:**
---
---- Reads "data/example.dfpwm" in blocks of 16KiB (the speaker can accept a maximum of 128×1024 samples), decodes them and then plays them through the speaker.
---
---  ```lua
---  local dfpwm = require "cc.audio.dfpwm"
---  local speaker = peripheral.find("speaker")
---
---  local decoder = dfpwm.make_decoder()
---  for input in io.lines("data/example.dfpwm", 16 * 1024) do
---    local decoded = decoder(input)
---    while not speaker.playAudio(decoded) do
---      os.pullEvent("speaker_audio_empty")
---    end
---  end
---  ```
---
---@return fun(dfpwm: string): number[] decoder The decoder function.
function dfpwm.make_decoder() end

---A convenience function for decoding a complete file of audio at once.
---
---This should only be used for short files. For larger files, one should read the file in chunks and process it using `make_decoder`.
---@param input string The DFPWM data to convert.
---@return number[] data The produced amplitude data.
function dfpwm.decode(input) end

return dfpwm
