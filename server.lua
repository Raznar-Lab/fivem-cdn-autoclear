local cleanUrl = Config.url:gsub("/$", "")
local function clearCache()
  print("clearing cache!")
  local url = string.format("%s/client/cdn/clear?uuid=%s&key=%s", cleanUrl, Config.uuid, Config.key)
  PerformHttpRequest(url, function(status, data) 
    print("result status: " .. status)
    print("result data: " .. data)
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
