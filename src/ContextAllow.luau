local MeowLogEnums = require("./Enums")

local EnvironmentContext = MeowLogEnums.EnvironmentContext
local MessageContext = MeowLogEnums.MessageContext

return {
	[EnvironmentContext.SERVER] = { },
	[EnvironmentContext.CLIENT] = { },
	[EnvironmentContext.STUDIO] = { },
	[EnvironmentContext.LIVE] = { },
}