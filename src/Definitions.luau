local MeowLogEnums = require("./Enums")

export type MeowLog = {
	Create: (string) -> MeowLogInstance,
	MessageContext: typeof(MeowLogEnums.MessageContext),
	EnvironmentContext: typeof(MeowLogEnums.EnvironmentContext)
}

export type MeowLogInstance = {
    _GetServerClientContext: (MeowLogInstance) -> string,
    _GetStudioLiveContext: (MeowLogInstance) -> string,

    _GetContextAllowed: (MeowLogInstance, string) -> boolean,
    _GetPrefix: (MeowLogInstance) -> string,
    _CreateLogMessage: (MeowLogInstance, string) -> string,
    _OutputPlainWithMethod: (MeowLogInstance, (string) -> (), string, string) -> nil,

    LogPlainMessage: (MeowLogInstance, string, string) -> MeowLogInstance,
    LogPlainWarning: (MeowLogInstance, string, string) -> MeowLogInstance,
    LogPlainError: (MeowLogInstance, string, string) -> MeowLogInstance,
    LogDebugTraceBack: (MeowLogInstance) -> MeowLogInstance,

    SetEnabledMessageContext: (MeowLogInstance, string, boolean) -> ()
}

return {}