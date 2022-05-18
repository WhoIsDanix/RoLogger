# RoLogger - simple ROBLOX logger to log debug information.

Example code:
```lua
local RoLogger = require(game:GetService("ServerScriptService").RoLogger)
local logger = RoLogger.new("ScriptName")

logger:Info("Information message")
logger:Warn("Warning message")
logger:Error("Error message")
```

![RoLogger_Example](https://user-images.githubusercontent.com/67073659/168980698-7bcbe94e-e4f2-405a-9b34-923ce55bd3d4.png)

You can also set your own log format.
```lua
logger:SetFormat("(%s) %s: %s")
```

The format:
1. Name of the script
2. Log priority
3. Log message
