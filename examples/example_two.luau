-- In Message Context
return { 
    "WEAPONS_SERVER" = "WEAPONS_SERVER",
}

-- In Context Allow
return {
	[EnvironmentContext.SERVER] = { [MessageContext.WEAPONS_SERVER] = true },
	[EnvironmentContext.CLIENT] = { },
	[EnvironmentContext.STUDIO] = { [MessageContext.WEAPONS_SERVER] = true },
	[EnvironmentContext.LIVE] = { },
}

-- It will now log the server weapon message in the server and studio enviroments, but not in the client or live environments.