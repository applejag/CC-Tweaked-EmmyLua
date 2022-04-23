
---The os API allows interacting with the current computer.
---@class os
os = {}

---> **Deprecated**
---> When possible it's best to avoid using this function. It pollutes the global table and can mask errors.
--->
---> `require` should be used to load libraries instead.
---
---Loads the given API into the global environment.
---
---This function loads and executes the file at the given path, and all global variables and functions exported by it will by available through the use of `myAPI.<function name>`, where `myAPI` is the base name of the API file.
---@deprecated
---@param path string The path of the API to load.
---@return boolean success Whether or not the API was successfully loaded.
function os.loadAPI(path) end

---> **Deprecated**
---> See `os.loadAPI` for why.
---Unloads an API which was loaded by os.loadAPI.
---
---This effectively removes the specified table from `_G`.
---@param name string The name of the API to unload.
function os.unloadAPI(name) end

---Pause execution of the current thread and waits for any events matching `filter`.
---
---This function yields the current process and waits for it to be resumed with a vararg list where the first element matches `filter`. If no `filter` is supplied, this will match all events.
---
---Unlike `os.pullEventRaw`, it will stop the application upon a "terminate" event, printing the error "Terminated".
---@param filter? string Event to filter for.
---@return string event The name of the event that fired.
---@return any param1 Optional additional parameters of the event.
---@return any param2 Optional additional parameters of the event.
---@return any param3 Optional additional parameters of the event.
---@return any param4 Optional additional parameters of the event.
function os.pullEvent(filter) end

---Pause execution of the current thread and waits for events, including the `terminate` event.
---
---This behaves almost the same as `os.pullEvent`, except it allows you to handle the `terminate` event yourself - the program will not stop execution when <kbd>Ctrl+T</kbd> is pressed.
---@param filter? string Event to filter for.
---@return string event The name of the event that fired.
---@return any param1 Optional additional parameters of the event.
---@return any param2 Optional additional parameters of the event.
---@return any param3 Optional additional parameters of the event.
---@return any param4 Optional additional parameters of the event.
function os.pullEventRaw(filter) end

---Pauses execution for the specified number of seconds, alias of `_G.sleep`.
---@param time number The number of seconds to sleep for, rounded up to the nearest multiple of 0.05.
function os.sleep(time) end

---Get the current CraftOS version (for example, `CraftOS 1.8`).
---
---This is defined by `bios.lua`. For the current version of CC:Tweaked, this should return `CraftOS 1.8`.
---@return string|'"CraftOS 1.8"' version The current CraftOS version.
function os.version() end

---Run the program at the given path with the specified environment and arguments.
---
---This function does not resolve program names like the shell does. This means that, for example, `os.run("edit")` will not work. As well as this, it does not provide access to the shell API in the environment. For this behaviour, use `shell.run` instead.
---
---If the program cannot be found, or failed to run, it will print the error and return `false`. If you want to handle this more gracefully, use an alternative such as `loadfile`.
---@param env table The environment to run the program with.
---@param path string The exact path of the program to run.
---@param ... any The arguments to pass to the program.
---@return boolean success Whether or not the program ran successfully.
function os.run(env, path, ...) end

---Adds an event to the event queue. This event can later be pulled with `os.pullEvent`.
---@param name string The name of the event to queue.
---@param ... any The parameters of the event.
function os.queueEvent(name, ...) end

---Starts a timer that will run for the specified number of seconds. Once the `timer` fires, a timer event will be added to the queue with the ID returned from this function as the first parameter.
---
---As with sleep, `timer` will automatically be rounded up to the nearest multiple of 0.05 seconds, as it waits for a fixed amount of world ticks.
---@param timer number The number of seconds until the timer fires.
---@return integer token The ID of the new timer. This can be used to filter the `timer` event, or cancel the timer.
function os.startTimer(timer) end

---Cancels a timer previously started with startTimer. This will stop the timer from firing.
---@param token integer The ID of the timer to cancel.
function os.cancelTimer(token) end

---Sets an alarm that will fire at the specified in-game time. When it fires, * an `alarm` event will be added to the event queue with the ID * returned from this function as the first parameter.
---@param time number The time at which to fire the alarm, in the range `[0.0, 24.0)`.
---@return integer token The ID of the new alarm. This can be used to filter the `alarm` event, or cancel the alarm.
function os.setAlarm(time) end

---Cancels an alarm previously started with setAlarm. This will stop the alarm from firing.
---@param token integer The ID of the alarm to cancel.
function os.cancelAlarm(token) end

---Shuts down the computer immediately.
function os.shutdown() end

---Reboots the computer immediately.
function os.reboot() end

---Returns the ID of the computer.
---@return integer id The ID of the computer.
function os.getComputerID() end

---Returns the ID of the computer.
---@return integer id The ID of the computer.
function os.computerID() end

---Returns the label of the computer, or `nil` if none is set.
---@return string|nil label The label of the computer.
function os.getComputerLabel() end

---Returns the label of the computer, or `nil` if none is set.
---@return string|nil label The label of the computer.
function os.computerLabel() end

---Set the label of this computer.
---@param label? string The new label. May be `nil` in order to clear it.
function os.setComputerLabel(label) end

---Returns the number of seconds that the computer has been running.
---@return number uptime The computer's uptime.
function os.clock() end

---Returns the current time depending on the string passed in. This will always be in the range [0.0, 24.0).
---
--- - If called with `ingame`, the current world time will be returned. This is the default if nothing is passed.
--- - If called with `utc`, returns the hour of the day in UTC time.
--- - If called with `local`, returns the hour of the day in the timezone the server is located in.
---
---This function can also be called with a table returned from date, which will convert the date fields into a UNIX timestamp (number of seconds since 1 January 1970).
---@param locale? '"ingame"'|'"utc"'|'"local"' The locale of the time. Defaults to `ingame` locale if not specified.
---@return number hour The hour of the selected locale.
function os.time(locale) end

---Returns the UNIX timestamp.
---
---@param locale table The table filled by `os.date("*t")` to decode.
---@return integer timestamp The UNIX timestamp from the table.
function os.time(locale) end

---Returns the day depending on the locale specified.
---
--- - If called with `ingame`, returns the number of days since the world was created. This is the default.
--- - If called with `utc`, returns the number of days since 1 January 1970 in the UTC timezone.
--- - If called with `local`, returns the number of days since 1 January 1970 in the server's local timezone.
---@param args? '"ingame"'|'"utc"'|'"local"' The locale to get the day for. Defaults to `ingame` if not set.
---@return integer day The day depending on the selected locale.
function os.day(args) end

---Returns the number of milliseconds since an epoch depending on the locale.
---
--- - If called with `ingame`, returns the number of days since the world was created. This is the default.
--- - If called with `utc`, returns the number of days since 1 January 1970 in the UTC timezone.
--- - If called with `local`, returns the number of days since 1 January 1970 in the server's local timezone.
---@param args? '"ingame"'|'"utc"'|'"local"' The locale to get the day for. Defaults to `ingame` if not set.
---@return integer ms The milliseconds since the epoch depending on the selected locale.
function os.epoch(args) end

---@class date
---@field isdst boolean If is daylight saving
---@field hour integer Hour (0-23)
---@field min integer Minute (0-59)
---@field sec integer Second (0-59, or 0-60 on leap seconds)
---@field day integer Day of month (1-31)
---@field month integer Month (1-12)
---@field year integer Year (4 digits, e.g 2022)
---@field wday integer Weekday (1-7, monday=1, sunday=7)
---@field yday integer Day of year (1-365, or 1-366 on leap years)
local _

---Returns a date string (or table) using a specified format string and optional time to format.
---
---The format string takes the same formats as C's `strftime` function (http://www.cplusplus.com/reference/ctime/strftime/). In extension, it can be prefixed with an exclamation mark (`!`) to use UTC time instead of the server's local timezone.
---
---If the format is exactly `*t` (optionally prefixed with `!`), a table will be returned instead. This table has fields for the year, month, day, hour, minute, second, day of the week, day of the year, and whether Daylight Savings Time is in effect. This table can be converted to a UNIX timestamp (days since 1 January 1970) with date.
---@param format? string The format of the string to return. This defaults to `%c`, which expands to a string similar to "Sat Dec 24 16:58:00 2011".
---@param time? number The time to convert to a string. This defaults to the current time.
---@return string date The resulting format string.
---@overload fun(format: '"*t"', time?: number): date
function os.date(format, time) end
