local webURL = "https://cdn-fivem-api.raznar.net"
local function clearCache()
  print("clearing cache!")
  local url = string.format("%s/api/client/cdn/clear/%s?key=%s", webURL, Config.id, Config.key)
  PerformHttpRequest(url, function(status, _data) 
    print("result status: " .. status)
  end, "DELETE")
end

AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end

  clearCache()
end)


AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end

  clearCache()

end)
