-- @ScriptType: Script
local HttpsService = game:GetService("HttpService")

local plugin = plugin

local openTerminalButton = toolbar:CreateButton(
    "OpenTerminal",
    "Ouvre le terminal Git",
    "rbxassetid://4458901886" -- icône placeholder
)

local openSettingsButton = toolbar:CreateButton(
    "OpenSettings",
    "Ouvre les paramètres Git",
    "rbxassetid://4458901886"
)

local info = DockWidgetPluginGuiInfo.new(
    Enum.InitialDockState.Float,
    true,
    true,
    300,
    500
)

local function runCommand(command)
    local url = "https://azzury.wstr.fr/rbxgit"

    local payload = {
        cmd = command
    }

    local response = HttpsService:PostAsync(url, HttpsService:JSONEncode(payload))
    return HttpsService:JSONDecode(response)
end