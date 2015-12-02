local awful = require("awful")

function pingServer(server)
    return string.sub(awful.util.pread("ping -c 1 "..server.." >> /dev/null ; echo $?"), 0, -2)
end

function getServerStatus(server)
    local resp = pingServer(server)
    local res = ""
    if resp:match("0") then
        res = "<span color='#00FF00'>up</span>"
    else
        res = "<span color='red'>down</span>"
    end
    return res
end
