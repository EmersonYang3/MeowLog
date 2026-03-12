# MeowLog

MeowLog is a simple logging library for Roblox implemented natively using Luau. It provides a straightfoward API for logging messages with different severity levels. 

MeowLog allows for creators to debug code without exposing the output in live games or across the server-client boundary. 

MeowLog's context allow determines whether a logging message will proceed or not. It checks whether the message context is allowed on the given client-server boundary and the studio-live environment.

All messages are currently required to be attached to a message context and the library is strictly typed. 

## Implementing a new debugging message
1. To create a new message context, use go to `MeowLog/Enums/MessageContext` and add a new entry to the enum. The key and value can be different, just make sure you remember what you are using. The enum must be added into the `Logs`, `Warns`, `Errors`, or `Any` category.
2. Go to `MeowLog/ContextAllow` and add the new message context to the appropriate allow list. If you want the message to be allowed in both studio and live, add it to both lists, similarly, if you want the message to be allowed on both client and server, add it to both lists as well. Otherwise, add it to the specific list that you want.
3. When logging a message plainly (with a single message context, and the message), use the `MeowLog:LogPlainMessage()`, `MeowLog:LogPlainWarning()`, or `MeowLog:LogPlainError()` functions. The first parameter is the message context, and the second parameter is the message itself. For example: `MeowLog:LogPlainMessage(MessageContext.Any.MyStuff, "This is a new message!")`
4. MeowLog will automatically apply context styling to the message using the given identifier.

## Using MeowLog 
1. Now that a new message context has been created, import MeowLog and get the message context enums via:

```lua
local MeowLog = require(path.to.MeowLog)
local MessageContext = MeowLog.MessageContext
```

2. Create a new logging instance using MeowLog.new(). You must provide the identifier. Identifiers will be formatted as a prefix in the style - `[Identifier] Message`. For example:

```lua
local thisMeowLog = MeowLog.new("WEAPON SYSTEM")
```

3. Now log away!

```lua
thisMeowLog:LogPlainMessage(MessageContext.Any.Demonstration, "Hello!") -> [WEAPON SYSTEM] Hello!
```

4. MeowLog automatically handles environment and client-server boundary filtering, so you do not have to implement manual if-else statements! You can simply keep the line of code for debugging purposes and it will only log when the context is allowed in the given environment and client-server boundary. For example - if you want to log a message that is only allowed in studio, you can simply add the message context to the studio allow list and not the live allow list, and then you can keep the logging code in without worrying about it spamming in live games.

## Notes
1. MeowLog checks for BOTH client-server boundary, and studio-live environment. This means that if a message context is only allowed on the server, it will not log on the client even if the message context is allowed in both studio and live. Similarly, if a message context is only allowed in studio, it will not log in live even if the message context is allowed on both client and server. 
2. MAKE SURE YOU INCLUDE THE MESSAGE CONTEXT INSIDE BOTH THE CLIENT-SERVER AND STUDIO-LIVE ALLOW LISTS OR ELSE IT WILL NOT LOG. 
3. THE MESSAGE CONTEXT MUST BE INCLUDED IN AT LEAST ONE OF THE LISTS IN BOTH THE CLIENT-SERVER AND STUDIO-LIVE ALLOW LISTS. Ex. a message context in only the client allow list but not on neither the studio or live allow list will NOT log any messages.
4. MeowLog is my own personal utility library that I use for debugging. It is early in development and does not currently support features that I have planned for it.