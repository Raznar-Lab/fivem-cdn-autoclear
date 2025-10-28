
local function clearCache()
  print("clearing cache!")
  local url = string.format("%s/api/client/cdn/clear/%s?key=%s", Config.api_url, Config.id, Config.key)
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
