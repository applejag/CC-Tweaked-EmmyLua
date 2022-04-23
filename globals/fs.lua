
---The FS API allows you to manipulate files and the filesystem.
---@class fs
fs = {}

---Returns true if a path is mounted to the parent filesystem.
---
---The root filesystem "/" is considered a mount, along with disk folders and the rom folder. Other programs (such as network shares) can exstend this to make other mount types by correctly assigning their return value for getDrive.
---@param path string The path to check.
---@return boolean #If the path is mounted, rather than a normal file/folder.
function fs.isDriveRoot(path) end

---Provides completion for a file or directory name, suitable for use with `_G.read`.
---
---When a directory is a possible candidate for completion, two entries are included - one with a trailing slash (indicating that entries within this directory exist) and one without it (meaning this entry is an immediate completion candidate). `include_dirs` can be set to false to only include those with a trailing slash.
---@param path string The path to complete.
---@param location string The location where paths are resolved from.
---@param include_files? boolean When `false`, only directories will be included in the returned list.
---@param include_dirs? boolean When `false`, "raw" directories will not be included in the returned list.
---@return string[] list A list of possible completion candidates.
function fs.complete(path, location, include_files, include_dirs) end

---Returns a list of files in a directory.
---@param path string The path to list.
---@return string[] files A table with a list of files in the directory.
function fs.list(path) end

---Combines several parts of a path into one full path, adding separators as needed.
---@param path string The first part of the path. For example, a parent directory path.
---@param ... string Additional parts of the path to combine.
---@return string path The new path, with separators added between as needed.
function fs.combine(path, ...) end

---Returns the file name portion of a path.
---@param path string The path to get the name from.
---@return string name The final part of the path (the file name).
function fs.getName(path) end

---Returns the parent directory portion of a path.
---@param path string The path to get the directory from.
---@return string dir The path with the final part removed (the parent directory).
function fs.getDir(path) end

---Returns the size of the specified file.
---@param path string The file to get the file size of.
---@return integer size The size of the file, in bytes.
function fs.getSize(path) end

---Returns whether the specified path exists.
---@param path string The path to check the existence of.
---@return boolean #Whether the path exists.
function fs.exists(path) end

---Returns whether the specified path is a directory.
---@param path string The path to check.
---@return boolean #Whether the path is a directory.
function fs.isDir(path) end

---Returns whether the specified path is read-only.
---@param path string The path to check.
---@return boolean #Whether the path cannot be written to.
function fs.isReadOnly(path) end

---Creates a directory, and any missing parents, at the specified path.
---@param path string The path to the directory to create.
function fs.makeDir(path) end

---Moves a file or directory from one path to another.
---
---Any parent directories are created as needed.
---@param path string The current file or directory to move from.
---@param dest string The destination path for the file or directory.
function fs.move(path, dest) end

---Copies a file or directory to a new path.
---
---Any parent directories are created as needed.
---@param path string The current file or directory to copy.
---@param dest string The destination path for the file or directory.
function fs.copy(path, dest) end

---Deletes a file or directory.
---
---If the path points to a directory, all of the enclosed files and subdirectories are also deleted.
---@param path string The path to the file or directory to delete.
function fs.delete(path) end

---@class FileHandle
local FileHandle = {}

---Close this file, freeing any resources it uses.
---
---Once a file is closed it may no longer be read or written to.
function FileHandle.close() end

---A file handle opened with `fs.open` with the `"r"` mode.
---@class ReadHandle : FileHandle
local ReadHandle = {}

---Read a line from the file.
---@param withTrailing? boolean Whether to include the newline characters with the returned string. Defaults to `false`.
---@return string|nil line The read line or `nil` if at the end of the file.
function ReadHandle.readLine(withTrailing) end

---Read the remainder of the file.
---@return string|nil content The remaining contents of the file, or `nil` if we are at the end.
function ReadHandle.readAll() end

---Read a number of characters from this file.
---@param count? integer The number of characters to read, defaulting to 1.
---@return string|nil chars The read characters, or `nil` if at the end of the file.
function ReadHandle.read(count) end

---@class BinaryReadHandle : FileHandle
local BinaryReadHandle = {}

---Read a number of bytes from this file.
---@param count integer The number of bytes to read. When absent, a single bytes will be read *as a number*. This may be 0 to determine we are at the end of the file.
---@return string bytes The bytes read as a string.
function BinaryReadHandle.read(count) end

---Read a byte from this file.
---@return integer byte The value of the byte read.
function BinaryReadHandle.read() end

---Read a line from the file.
---@param withTrailing? boolean Whether to include the newline characters with the returned string. Defaults to `false`.
---@return string|nil line The read line or `nil` if at the end of the file.
function BinaryReadHandle.readLine(withTrailing) end

---Read the remainder of the file.
---@return string|nil content The remaining contents of the file, or `nil` if we are at the end.
function BinaryReadHandle.readAll() end

---Seek to a new position within the file, changing where bytes are written to. The new position is an offset given by `offset`, relative to a start position determined by `whence`:
---
--- - `"set"`: `offset` is relative to the beginning of the file.
--- - `"cur"`: Relative to the current position. This is the default.
--- - `"end"`: Relative to the end of the file.
---
---In case of success, `seek` returns the new file position from the beginning of the file.
---@param whence? '"set"'|'"cur"'|'"end"' Where the offset is relative to.
---@param offset? integer The offset to seek to.
---@return number|nil pos The new position.
---@return string|nil error The reason seeking failed.
function BinaryReadHandle.seek(whence, offset) end

---A file handle opened by fs.open using the "w" or "a" modes.
---@class WriteHandle : FileHandle
local WriteHandle = {}

---Write a string of characters to the file.
---@param value string The value to write to the file.
function WriteHandle.write(value) end

---Write a string of characters to the file, following them with a new line character.
---@param value string The value to write to the file.
function WriteHandle.writeLine(value) end

---Save the current file without closing it.
function WriteHandle.flush() end

---@class BinaryWriteHandle : FileHandle
local BinaryWriteHandle = {}

---Write a string or byte to the file.
---@param value string|integer The value to write to the file.
function BinaryWriteHandle.write(value) end

---Save the current file without closing it.
function BinaryWriteHandle.flush() end

---Seek to a new position within the file, changing where bytes are written to. The new position is an offset given by `offset`, relative to a start position determined by `whence`:
---
--- - `"set"`: `offset` is relative to the beginning of the file.
--- - `"cur"`: Relative to the current position. This is the default.
--- - `"end"`: Relative to the end of the file.
---
---In case of success, `seek` returns the new file position from the beginning of the file.
---@param whence? '"set"'|'"cur"'|'"end"' Where the offset is relative to.
---@param offset? integer The offset to seek to.
---@return number|nil pos The new position.
---@return string|nil error The reason seeking failed.
function BinaryWriteHandle.seek(whence, offset) end

---Opens a file for reading or writing at a path.
---
---The `mode` string can be any of the following:
---
--- - "r": Read mode
--- - "w": Write mode
--- - "a": Append mode
---
---The mode may also have a "b" at the end, which opens the file in "binary mode". This allows you to read binary files, as well as seek within a file.
---@param path string The path to the file to open.
---@param mode '"r"' The mode to open the file with.
---@return ReadHandle file A file handle object for the file; or nil if the file does not exist, or cannot be opened.
---@return string|nil error A message explaining why the file cannot be opened.
---@overload fun(path: string, mode: '"rb"'): BinaryReadHandle
---@overload fun(path: string, mode: '"w"'|'"a"'): WriteHandle
---@overload fun(path: string, mode: '"wb"'|'"ab"'): BinaryWriteHandle
function fs.open(path, mode) end

---Returns the name of the mount that the specified path is located on.
---@param path string The path to get the drive of.
---@return string name The name of the drive that the file is on; e.g. `hdd` for local files, or `rom` for ROM files.
function fs.getDrive(path) end

---Returns the amount of free space available on the drive the path is located on.
---@param path string The path to check the free space for.
---@return number|'"unlimited"' space The amount of free space available, in bytes, or "unlimited".
function fs.getFreeSpace(path) end

---Searches for files matching a string with wildcards.
---
---This string is formatted like a normal path string, but can include any number of wildcards (`*`) to look for files matching anything. For example, `rom/*/command*` will look for any path starting with `command` inside any subdirectory of `/rom`.
---@param path string The wildcard-qualified path to search for.
---@return string[] paths A list of paths that match the search string.
function fs.find(path) end

---Returns the capacity of the drive the path is located on.
---@param path string The path of the drive to get.
---@return number|nil capacity The drive's capacity. This will be nil for "read-only" drives, such as the ROM or treasure disks.
function fs.getCapacity(path) end

---@class Attributes
---@field size integer
---@field isDir boolean
---@field isReadOnly boolean
---@field created number
---@field modified number
local _

---Get attributes about a specific file or folder.
---
---The returned attributes table contains information about the size of the file, whether it is a directory, when it was created and last modified, and whether it is read only.
---
---The creation and modification times are given as the number of milliseconds since the UNIX epoch. This may be given to os.date in order to convert it to more usable form.
---@param path string The path to get attributes for.
---@return Attributes attrs The resulting attributes.
function fs.attributes(path) end
