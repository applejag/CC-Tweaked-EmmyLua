
---Disk drives are a peripheral which allow you to read and write to floppy disks and other "mountable media" (such as computers or turtles). They also allow you to play records.
---
---When a disk drive attaches some mount (such as a floppy disk or computer), it attaches a folder called `disk`, `disk2`, etc... to the root directory of the computer. This folder can be used to interact with the files on that disk.
---
---When a disk is inserted, a `disk` event is fired, with the side peripheral is on. Likewise, when the disk is detached, a `disk_eject` event is fired.
---@class drive
local drive = {}

---Returns whether a disk is currently inserted in the drive.
---@return boolean #Whether a disk is currently inserted in the drive.
function drive.isDiskPresent() end

---Returns the label of the disk in the drive if available.
---@return string|nil label The label of the disk, or `nil` if either no disk is inserted or the disk doesn't have a label.
function drive.getDiskLabel() end

---Sets or clears the label for a disk.
---
---If no label or `nil` is passed, the label will be cleared.
---
---If the inserted disk's label can't be changed (for example, a record), an error will be thrown.
---@param label? string The new label of the disk, or `nil` to clear.
function drive.setDiskLabel(label) end

---Returns whether a disk with data is inserted.
---@return boolean #Whether a disk with data is inserted.
function drive.hasData() end

---Returns the mount path for the inserted disk.
---@return string|nil path The mount path for the disk, or `nil` if no data disk is inserted.
function drive.getMountPath() end

---Returns whether a disk with audio is inserted.
---@return boolean #Wether a disk with audio is inserted.
function drive.hasAudio() end

---Returns the title of the inserted audio disk.
---@return string|nil|'false' title The title of the audio, `false` if no disk is inserted, or `nil` if the disk has no audio.
function drive.getAudioTitle() end

---Plays the audio in the inserted disk, if available.
function drive.playAudio() end

---Stops any audio that may be playing.
function drive.stopAudio() end

---Ejects any disk that may be in the drive.
function drive.ejectDisk() end

---Returns the ID of the disk inserted in the drive.
---@return integer|nil id The ID of the disk in the drive, or `nil` if no disk with an ID is inserted.
function drive.getDiskID() end
