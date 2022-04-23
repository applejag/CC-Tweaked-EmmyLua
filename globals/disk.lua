
---The Disk API allows you to interact with disk drives.
---
---These functions can operate on locally attached or remote disk drives. To use a locally attached drive, specify “side” as one of the six sides (e.g. `left`); to use a remote disk drive, specify its name as printed when enabling its modem (e.g. `drive_0`).
---@class disk
disk = {}

---Checks whether any item at all is in the disk drive
---@param name string The name of the disk drive.
---@return boolean #If something is in the disk drive.
function disk.isPresent(name) end

---Get the label of the floppy disk, record, or other media within the given disk drive.
---
---If there is a computer or turtle within the drive, this will set the label as read by `os.getComputerLabel`.
---@param name The name of the disk drive.
---@return string|nil label The name of the current media, or `nil` if the drive is not present or empty.
function disk.getLabel(name) end

---Set the label of the floppy disk or other media
---@param name string The name of the disk drive.
---@param label string|nil The new label of the disk.
function disk.setLabel(name, label) end

---Check whether the current disk provides a mount.
---
---This will return true for disks and computers, but not records.
---@param name string The name of the disk drive.
---@return boolean #If the disk is present and provides a mount.
function disk.hasData(name) end

---Find the directory name on the local computer where the contents of the current floppy disk (or other mount) can be found.
---@param name string The name of the disk drive.
---@return string|nil path The mount's directory, or `nil` if the drive does not contain a floppy or computer.
function disk.getMountPath(name) end

---Whether the current disk is a music disk as opposed to a floppy disk or other item.
---
---If this returns true, you will can play the record.
---@param name string The name of the disk drive.
---@return boolean #If the disk is present and has audio saved on it.
function disk.hasAudio(name) end

---Get the title of the audio track from the music record in the drive.
---
---This generally returns the same as `disk.getLabel` for records.
---@param name string The name of the disk drive.
---@return string|'false'|nil title The track title, `false` if there is not a music record in the drive or `nil` if no drive is present.
function disk.getAudioTitle(name) end

---Starts playing the music record in the drive.
---
---If any record is already playing on any disk drive, it stops before the target drive starts playing. The record stops when it reaches the end of the track, when it is removed from the drive, when `disk.stopAudio` is called, or when another record is started.
---@param name string The name of the disk drive.
function disk.playAudio(name) end

---Stops the music record in the drive from playing, if it was started with disk.playAudio.
---@param name string The name of the disk drive.
function disk.stopAudio(name) end

---Ejects any item currently in the drive, spilling it into the world as a loose item.
---@param name string The name of the disk drive.
function disk.eject(name) end

---Returns a number which uniquely identifies the disk in the drive.
---
---Note, unlike `disk.getLabel`, this does not return anything for other media, such as computers or turtles.
---@param name string The name of the disk drive.
---@return string|nil id The disk ID, or `nil` if the drive does not contain a floppy disk.
function disk.getID(name) end

