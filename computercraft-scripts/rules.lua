local repo = "https://raw.githubusercontent.com/j-shelfwood/bitcraft/main/computercraft-scripts/rules.json"

-- Get the monitors
local monitors = { peripheral.find("monitor") }

for _,monitor in pairs(monitors) do
    monitor.setTextScale(1)
    monitor.clear()

    local width, height = monitor.getSize()

    -- Get the rules from the json file in the Github repo
    local rulesData = http.get(repo).readAll()
    local rules = textutils.unserializeJSON(rulesData)

    -- Write title to monitor
    local title = "-= BitCraft =-"
    local cursorX = math.ceil((width - #title) / 2)

    monitor.setTextColor(colors.orange)
    monitor.setCursorPos(cursorX, 2)
    monitor.write(title)

    monitor.setTextColor(colors.white)

    -- Write rules to monitor
    for k,v in pairs(rules) do
        local cursorX = math.ceil((width - #v) / 2)

        monitor.setCursorPos(cursorX, k * 2 + 3)
        monitor.write(v)
    end
end
