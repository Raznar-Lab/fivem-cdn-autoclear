local function urlencode(str)
    if str then
        str = str:gsub("\n", "\r\n")
        str = str:gsub("([^%w%-_%.~])", function(c)
            return string.format("%%%02X", string.byte(c))
        end)
    end
    return str
end

local function clearCache()
    print("clearing cache!")

    local id  = urlencode(Config.id)
    local key = urlencode(Config.key)

    local url = string.format("%s/api/client/cdn/clear/%s?key=%s", Config.api_url, id, key)

    PerformHttpRequest(url, function(status, _data)
        print("result status: " .. status)
    end, "DELETE")
end


AddEventHandler('onResourceStop', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end

  clearCache()

end)
