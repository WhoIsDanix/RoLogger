local RoLogger = {}
RoLogger.__index = RoLogger

export type RoLogger = {
    scriptname: string,
    logformat: string,
    
    Info: (self: RoLogger, message: string) -> (),
    Warn: (self: RoLogger, message: string) -> (),
    Error: (self: RoLogger, message: string) -> (),
    
    SetLogFormat: (self: RoLogger, format: string) -> ()
}

local function assertType(value: any, typeExpected: string): ()
    assert(typeof(value) == typeExpected, string.format("Expected %s, got %s", typeExpected, typeof(value)))
end

function RoLogger.new(scriptname: string)
    assertType(scriptname, "string")
    return setmetatable({
        scriptname = scriptname,
        logformat = "[%s] %s: %s"
    }, RoLogger)
end

function RoLogger:SetLogFormat(format: string): ()
    assertType(format, "string")
    self.logformat = format
end

function RoLogger:_Log(logfunc: (...any) -> (), logPriority: string, message: string)
    -- Validate types
    assertType(logfunc, "function")
    assertType(logPriority, "string")
    assertType(message, "string")
    
    -- Validate log priority
    assert(table.find({"INFO", "WARN", "ERROR"}, logPriority) ~= nil, string.format("Invalid log priority %s", logPriority))
    
    -- Log the message using logging function
    logfunc(string.format(self.logformat, self.scriptname, logPriority, message))
end

function RoLogger:Info(message: string): ()
    self:_Log(print, "INFO", message)
end

function RoLogger:Warn(message: string): ()
    self:_Log(warn, "WARN", message)
end

function RoLogger:Error(message: string): ()
    self:_Log(error, "ERROR", message)
end

return RoLogger