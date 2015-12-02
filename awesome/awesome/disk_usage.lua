local awful = require("awful")

function diskUsageInfo(directory)
    return string.sub(awful.util.pread("df -h | grep "..directory.." | tr -s ' ' | cut -d ' ' -f 4"), 0, -2)
end
