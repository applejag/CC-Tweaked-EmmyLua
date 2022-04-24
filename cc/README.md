# CC module

The intellisense is automatically loaded when you `require` one of these
modules.

In the code blocks below, `<TAB>` represents you pressing <kbd>Tab</kbd> on your
keyboard to expand the intellisense suggestions.

Example:

```lua
strings.<TAB>
       --nothing

-- need to require("") the module
```

```lua
local strings = require 'cc.strings'

strings.<TAB>
       .wrap(text, width?)
       .ensure_width(line, width?)
```

You can use the `---@module` comment to load in the intellisense without calling `require`:

```lua
---@module 'cc.strings'
local strings

strings.<TAB>
       .wrap(text, width?)
       .ensure_width(line, width?)
```
