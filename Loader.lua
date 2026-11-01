local currentPlaceId = game.PlaceId

local gamesTable = {
    [108679402300081] = "Garden.lua",
}

if gamesTable[currentPlaceId] then
    local scriptFile = gamesTable[currentPlaceId]
    local targetURL = "https://raw.githubusercontent.com/AidanNabila/NoobHub-ForestMarket/main/" .. scriptFile
    loadstring(game:HttpGet(targetURL))()
else
    warn("Noob-Hub: ID Game tidak terdaftar di Hub Anda!")
end
