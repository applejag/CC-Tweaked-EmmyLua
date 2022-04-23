
---The speaker peirpheral allow your computer to play notes and other sounds.
---
---The speaker can play three kinds of sound, in increasing orders of complexity:
---
---- `playNote` allows you to play noteblock note.
---- `playSound` plays any built-in Minecraft sound, such as block sounds or mob noises.
---- `playAudio` can play arbitrary audio.
---@class speaker
local speaker = {}

---@alias instrument '"harp"'|'"basedrum"'|'"snare"'|'"hat"'|'"bass"'|'"flute"'|'"bell"'|'"guitar"'|'"chime"'|'"xylophone"'|'"iron_xylophone"'|'"cow_bell"'|'"didgeridoo"'|'"bit"'|'"banjo"'|'"pling"'

---Plays a note block note through the speaker.
---
---This takes the name of a note to play, as well as optionally the volume and pitch to play the note at.
---
---The pitch argument uses semitones as the unit. This directly maps to the number of clicks on a note block. For reference, 0, 12, and 24 map to F#, and 6 and 18 map to C.
---
---A maximum of 8 notes can be played in a single tick. If this limit is hit, this function will return `false`.
---
---**Valid instruments**
---
---The speaker supports all of Minecraft's noteblock instruments. These are:
---
---"harp", "basedrum", "snare", "hat", "bass", "flute", "bell", "guitar", "chime", "xylophone", "iron_xylophone", "cow_bell", "didgeridoo", "bit", "banjo" and "pling".
---@param instrument instrument The instrument to use to play this note.
---@param volume? number The volume to play the note ad, from 0.0 to 3.0. Defaults to 1.0.
---@param pitch? integer The pitch to play the note at in semitones, from 0 to 24. Defaults to 12.
---@return boolean success Whether the note could be played as the limit was reached.
function speaker.playNote(instrument, volume, pitch) end

---Plays a Minecraft sound through the speaker.
---
---This takes the name of a Minecraft sound, such as `"minecraft:block.note_block.harp"`, as well as an optional volume and pitch.
---
---Only one sound can be played at once. This function will return `false` if another sound was started this tick, or if some audio is still playing.
---@param name string The name of the sound to play.
---@param volume? number The volume to play the note ad, from 0.0 to 3.0. Defaults to 1.0.
---@param pitch? integer The pitch to play the note at in semitones, from 0 to 24. Defaults to 12.
---@return boolean success Whether the sound could be played.
function speaker.playSound(name, volume, pitch) end

---Attempt to stream some audio data to the speaker.
---
---This accepts a list of audio samples as amplitudes between -128 and 127. These are stored in an internal buffer and played back at 48kHz. If this buffer is full, this function will return `false`. You should wait for a `speaker_audio_empty` event before trying again.
---
---> **NOTE**
--->
---> The speaker only buffers a single call to `playAudio` at once. This means if you try to play a small number of samples, you'll have a lot of stutter. You should try to play as many samples in one call as possible (up to 128×1024), as this reduces the chances of audio stuttering or halting, especially when the server or computer is lagging.
---
---[Playing audio with speakers](https://tweaked.cc/guide/speaker_audio.html) provides a more complete guide in to using speakers
---@param audio number[] A list of amplitudes.
---@param volume? number The volume to play this audio at. If not given, defaults to the previous volume given to `playAudio`.
---@return boolean success If there was room to accept this audio data.
function speaker.playAudio(audio, volume) end

---Stop all audio being played by this speaker.
---
---This clears any audio that `playAudio` had queued and stops the latest sound played by `playSound`.
function speaker.stop() end

