--!strict
local MeowLog = {}
MeowLog.__index = MeowLog

local RunService = game:GetService("RunService")
local MeowLogEnums = require("@self/Enums")
local ContextAllow = require("@self/ContextAllow")
local Definitions = require("@self/Definitions")

local EnvironmentContext = MeowLogEnums.EnvironmentContext

function MeowLog.Create(identifier: string)
	local self = setmetatable({}, MeowLog)
	
	self.identifier = identifier	
	
	return self
end

function MeowLog:_GetServerClientContext(): string
	local isOnClient = RunService:IsClient()
	
	return (isOnClient and EnvironmentContext.CLIENT) or EnvironmentContext.SERVER
end

function MeowLog:_GetStudioLiveContext(): string
	local isOnStudio = RunService:IsStudio()
	
	return (isOnStudio and EnvironmentContext.STUDIO) or EnvironmentContext.LIVE
end

function MeowLog:_GetContextAllowed(messageContext: string): boolean
	local serverClientContext = self:_GetServerClientContext()
	local studioLiveContext = self:_GetStudioLiveContext()
	
	local isAllowedPerServerClient = ContextAllow[serverClientContext][messageContext] == true
	local isAllowedPerStudioLive = ContextAllow[studioLiveContext][messageContext] == true
	
	return isAllowedPerServerClient and isAllowedPerStudioLive
end

function MeowLog:_GetPrefix(): string
	return `[{self.identifier}]`
end

function MeowLog:_CreateLogMessage(message: string): string
	local prefix = self:_GetPrefix()
	local message = `{prefix} {message}`
	
	return message
end

function MeowLog:_OutputPlainWithMethod(outputMethod: (string) -> (), messageContext: string, message: string)
	local isContextAllowed = self:_GetContextAllowed(messageContext)
	if not isContextAllowed then return end
	
	local logMessage = self:_CreateLogMessage(message)
	outputMethod(logMessage)
end

function MeowLog:LogPlainMessage(messageContext: string, message: string)
	self:_OutputPlainWithMethod(print, messageContext, message)
	return self
end

function MeowLog:LogPlainWarning(messageContext: string, message: string)
	self:_OutputPlainWithMethod(warn, messageContext, message)
	return self
end

function MeowLog:LogPlainError(messageContext: string, message: string)
	self:_OutputPlainWithMethod(error, messageContext, message)
	return self
end

function MeowLog:LogDebugTraceBack()
	local traceback = debug.traceback()
	print(traceback)
	return self
end

function MeowLog:SetEnabledMessageContext(messageContext: string, enabled: boolean)
	local serverClientContext = self:_GetServerClientContext()
	local studioLiveContext = self:_GetStudioLiveContext()

	local settingKey = if enabled then true else nil
	
	ContextAllow[serverClientContext][messageContext] = settingKey
	ContextAllow[studioLiveContext][messageContext] = settingKey
end

MeowLog.MessageContext = MeowLogEnums.MessageContext
MeowLog.EnvironmentContext = MeowLogEnums.EnvironmentContext

return MeowLog