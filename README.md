# RoLogger - simple ROBLOX logger to log debug information.

Example code:
```lua
local RoLogger = require(game:GetService("ServerScriptService").RoLogger)
local logger = RoLogger.new("ScriptName")

logger:Info("Information message")
logger:Warn("Warning message")
logger:Error("Error message")
```

You can also set your own log format.
```lua
logger:SetFormat("(%s) %s: %s")
```

The format:
1. Name of the script
2. Log priority
3. Log message
