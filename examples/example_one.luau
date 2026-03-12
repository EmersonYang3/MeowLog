--!strict 
local Utility = require("@game/ReplicatedStorage/Utility/UtilityLoader")
local MeowLog = Utility.MeowLog

local MessageContext = MeowLog.MessageContext
local thisMeowLog = MeowLog.Create("ExampleOne")

thisMeowLog:LogPlainMessage(MessageContext.HITBOX_SYSTEM_PLAIN, "This message should appear in contexts where the hitbox system is allowed to log in.")
thisMeowLog:LogPlainWarning(MessageContext.HITBOX_SYSTEM_WARN, "This warning should appear in contexts where the hitbox system is allowed to log warnings.")

thisMeowLog:LogPlainMessage(MessageContext.HITBOX_SYSTEM_PLAIN, "You can chain methods!"):LogDebugTraceBack()