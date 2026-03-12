local MeowLogEnums = require("./Enums")

local EnvironmentContext = MeowLogEnums.EnvironmentContext
local MessageContext = MeowLogEnums.MessageContext

return {
	[EnvironmentContext.SERVER] = {
		[MessageContext.Any.TESTING_LOG] = true
	},
	
	[EnvironmentContext.CLIENT] = {
		[MessageContext.Any.TESTING_LOG] = true
	},
	
	[EnvironmentContext.STUDIO] = {
		[MessageContext.Any.TESTING_LOG] = true
	},
	
	[EnvironmentContext.LIVE] = {
		
	},
}