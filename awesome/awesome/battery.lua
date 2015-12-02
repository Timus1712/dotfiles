-- This function returns a formatted string with the current battery status. It
-- can be used to populate a text widget in the awesome window manager. Based
-- on the "Gigamo Battery Widget" found in the wiki at awesome.naquadah.org

local naughty = require("naughty")
local beautiful = require("beautiful")

function readBatFile(adapter, ...)
  local basepath = "/sys/class/power_supply/"..adapter.."/"
  for i, name in pairs({...}) do
    file = io.open(basepath..name, "r")
    if file then
      local str = file:read()
      file:close()
      return str
    end
  end
end

function batteryInfo(adapter)
  local fh = io.open("/sys/class/power_supply/"..adapter.."/present", "r")
  if fh == nil then
    battery = "A/C"
    battery_color = "green"
    icon = ""
    percent = ""
  else
    local cur = readBatFile(adapter, "charge_now", "energy_now")
    local cap = readBatFile(adapter, "charge_full", "energy_full")
    local sta = readBatFile(adapter, "status")
    battery = math.floor(cur * 100 / cap)
    battery_color = "#00ff00"

    if sta:match("Charging") then
      icon = "⚡"
      percent = "%"
      battery_color = "#00ff00"
      battery = icon .. battery .. percent
    elseif sta:match("Discharging") then
      icon = ""
      percent = "%"
      if tonumber(battery) < 40 then
          battery_color = "yellow"
      end
      if tonumber(battery) <= 15 then
          battery_color = "red"
      end
      if tonumber(battery) == 15 or tonumber(battery) == 10 or tonumber(battery) == 5 then
        naughty.notify({ title    = "Battery Warning"
               , text     = "Battery low!".."  "..battery..percent.."  ".."left!"
               , timeout  = 5
               , position = "top_right"
               , fg       = beautiful.fg_focus
               , bg       = beautiful.bg_focus
        })
      end
      rest = io.popen("acpi -b | egrep -o \"[0-9][0-9]:[0-9][0-9]\""):read("*a")
      battery = battery.."% ("..string.sub(rest, 0, -2)..")"
    else
      -- If we are neither charging nor discharging, assume that we are on A/C
      battery = "A/C"
      icon = ""
      percent = ""
    end
  end
  return "BAT0: ".."<span color='"..battery_color.."'>"..battery.."</span>"
end
