require 'lib.moonloader'

script_name("/giftmap-ny2022-gift")
script_version("31.10.2022-final")
script_author("Serhiy_Rubin", "qrlk")
script_properties("work-in-pause")
script_url("https://github.com/qrlk/giftmap-ny2022")

local sampev = require "lib.samp.events"
local inicfg = require "inicfg"
local map, checkpoints = {}, {}
local gift, wh = {}, false

local chatTag = "{FF5F5F}" .. thisScript().name .. "{ffffff}"

function main()
  if not isSampLoaded() or not isSampfuncsLoaded() then
    return
  end
  while not isSampAvailable() do
    wait(0)
  end

  -- ������ ���, ���� ������ ��������� �������� ����������
  update("http://qrlk.me/dev/moonloader/giftmap-ny2022-gift/stats.php", '['..string.upper(thisScript().name)..']: ', "http://vk.com/qrlk.mods", "giftmapny2022giftchangelog")
  openchangelog("giftmapny2022giftchangelog", "https://github.com/qrlk/giftmap-ny2022/commits/main")
  -- ������ ���, ���� ������ ��������� �������� ����������


  serverAddress = sampGetCurrentServerAddress()

  function switch()
    wh = not wh
    local count = 0
    for k, v in pairs(map_ico) do
      count = count + 1
    end
    if not wh then
      if map_ico ~= nil then
        for id, data in pairs(map_ico) do
          removeBlip(map[id])
          deleteCheckpoint(checkpoints[id])
        end
        map, checkpoints = {}, {}
      end
    else
      sampShowDialog(5557, "\t"..chatTag.." by {2f72f7}Serhiy_Rubin{ffffff}, {348cb2}qrlk", "{FF5F5F}���������{ffffff}:\n������� {2f72f7}/giftmap-ny2022-snow{ffffff}, ����� ��������/��������� ������.\n\n{FF5F5F}Event{ffffff}:\n�� ����� ���� �����, ��� ��������� ��������. ��� ��������� ������ 60-90 �����.\n��������� �� ����� �������� ����� '��� �����' (/nygps - [0]).\n������� ���� �����-�� �������, �� ����� ������ �� �����: ���������� � ������ ������.\n������ ������ ����� � "..count.." ������ ������.\n����� �� �������� �������, �� ��������� � ���� ��������� ����.\n\n{FF5F5F}��� ��� ��������?{ffffff}\n�� ������ �������� ����� ����� ������ �������� � �������� 1200�.\n� ������� ���������� �� ������� ����������������.\n����� � ���� � ������ �����, �� ������� ������� ��� �������.\n���� �� ����� ������ ���/�� �����������, ������, ��� ������� ��������� � ���� ����� ���� ��� �����������.\n\n{FF5F5F}�����������:{ffffff}\n* ��������� ����� ����� - ��� ���� ����������.\n* ������� ������� ����� - ����� ������ ��������.\n* ������� ������ ����� - ����� ��������.\n* ������� ������� ����� - �� ����� ���� ������� (���� ������� �� 25�).\n\n{FF5F5F}������:{ffffff}\n* https://github.com/qrlk/giftmap-ny2022\n* https://vk.com/rubin.mods", "OK")    end

    printStringNow((wh and "ON, DB: " .. count or "OFF, DB: " .. count), 1000)
  end

  sampRegisterChatCommand(
      "giftmap-ny2022-gift",
      switch
  )
  str = [[{"10243544921875": {"x": 1024.3544921875, "y": 2141.6198730469, "z": 10.820300102234}, "10769595947266": {"x": 1076.9595947266, "y": -1207.5045166016, "z": 17.819000244141}, "1125248046875": {"x": 1125.248046875, "y": 2468.9384765625, "z": 10.749799728394}, "11680328369141": {"x": 1168.0328369141, "y": 1384.8908691406, "z": 10.495800018311}, "12122590332031": {"x": 1212.2590332031, "y": -1125.3395996094, "z": 24.162599563599}, "12172922363281": {"x": 1217.2922363281, "y": 1150.0004882813, "z": 6.7813000679016}, "12689699707031": {"x": 1268.9699707031, "y": -908.23577880859, "z": 42.882801055908}, "13377551269531": {"x": 1337.755126953125, "y": 937.1627197265625, "z": 17.913400650024414}, "15189167480469": {"x": 1518.916748046875, "y": -1452.306640625, "z": 14.203100204467773}, "15664093017578": {"x": -1566.4093017578, "y": 1061.228515625, "z": 7.1875}, "15815205078125": {"x": 1581.5205078125, "y": 2265.41796875, "z": 10.820300102234}, "16109099121094": {"x": 1610.9099121094, "y": 2026.4315185547, "z": 10.820300102234}, "16714774169922": {"x": -1671.4774169922, "y": -545.51281738281, "z": 11.50030040741}, "17197578125": {"x": 1719.7578125, "y": 1443.1971435547, "z": 10.817999839783}, "17656154785156": {"x": 1765.6154785156, "y": 614.95037841797, "z": 10.820300102234}, "18609171142578": {"x": 1860.9171142578, "y": 639.12359619141, "z": 10.820300102234}, "18691881103516": {"x": 1869.1881103516, "y": 926.51470947266, "z": 10.820300102234}, "18877141113281": {"x": 1887.7141113281, "y": 1704.6481933594, "z": 10.820300102234}, "19161011962891": {"x": -1916.1011962891, "y": 897.53717041016, "z": 35.414100646973}, "19408044433594": {"x": 1940.8044433594, "y": -1979.3780517578, "z": 13.546899795532}, "19518975830078": {"x": 1951.8975830078, "y": 2535.3605957031, "z": 6.7701997756958}, "19710637207031": {"x": 1971.0637207031, "y": -1177.1212158203, "z": 20.023399353027}, "19968145751953": {"x": -1996.8145751953, "y": -722.66259765625, "z": 32.171901702881}, "20091549072266": {"x": 2009.1549072266, "y": 2493.9807128906, "z": 10.820300102234}, "20417525634766": {"x": 2041.7525634766, "y": -1639.7175292969, "z": 13.546899795532}, "20818642578125": {"x": -2081.8642578125, "y": 825.98870849609, "z": 69.5625}, "21221198730469": {"x": -2122.1198730469, "y": 417.58889770508, "z": 35.171901702881}, "21251232910156": {"x": -2125.1232910156, "y": 654.42950439453, "z": 52.367198944092}, "21940187988281": {"x": 2194.0187988281, "y": 1686.884765625, "z": 12.367199897766}, "22172097167969": {"x": 2217.2097167969, "y": -2163.2487792969, "z": 13.546899795532}, "22858603515625": {"x": -2285.8603515625, "y": 32.052299499512, "z": 35.3125}, "24080168457031": {"x": -2408.0168457031, "y": 897.96752929688, "z": 45.533798217773}, "24606403808594": {"x": -2460.6403808594, "y": 402.56820678711, "z": 35.117198944092}, "25248032226563": {"x": 2524.8032226563, "y": 1852.4324951172, "z": 10.820300102234}, "25456958007813": {"x": 2545.6958007813, "y": 2177.8796386719, "z": 10.820300102234}, "26147004394531": {"x": -2614.7004394531, "y": 989.40411376953, "z": 78.285003662109}, "26557580566406": {"x": -2655.7580566406, "y": 1211.9415283203, "z": 55.578098297119}, "26805048828125": {"x": 2680.5048828125, "y": -1398.7889404297, "z": 30.578699111938}, "26913315429688": {"x": 2691.3315429688, "y": 2415.9665527344, "z": 6.7031002044678}, "27194061279297": {"x": 271.94061279297, "y": -1462.7429199219, "z": 28.238700866699}, "27741079101563": {"x": -2774.10791015625, "y": -484.74560546875, "z": 6.970600128173828}, "27879426269531": {"x": -2787.942626953125, "y": 229.31719970703125, "z": 7.060699939727783}, "27957922363281": {"x": -2795.792236328125, "y": -203.0937957763672, "z": 6.970600128173828}, "44228158569336": {"x": 442.28158569336, "y": -1301.4577636719, "z": 15.176099777222}, "73642370605469": {"x": 736.42370605469, "y": -1797.6545410156, "z": 13.09850025177}, "82268420410156": {"x": 822.68420410156, "y": -1699.6176757813, "z": 13.546899795532}, "82955438232422": {"x": 829.55438232422, "y": -1061.4376220703, "z": 25.129899978638}, "89310552978516": {"x": 893.10552978516, "y": 2014.6312255859, "z": 11.733699798584}, "91746362304688": {"x": 917.46362304688, "y": 2385.6049804688, "z": 10.820300102234}}]]

  map_ico = inicfg.load(decodeJson(str), "giftmap-ny2022-gift")

  --print(require'inspect'(map_ico))

  inicfg.save(map_ico, "giftmap-ny2022-gift")

  sampAddChatMessage((chatTag .. " by {2f72f7}Serhiy_Rubin{ffffff} & {348cb2}qrlk{ffffff} successfully loaded!"), -1)

  while true do
    wait(500)
    if wh then
      for key, coord in pairs(map_ico) do
        local x, y, z = getCharCoordinates(PLAYER_PED)
        local distance = getDistanceBetweenCoords2d(coord.x, coord.y, x, y)
        if not isPauseMenuActive() then
          if distance < 1200 then
            if map[key] == nil then
              map[key] = addBlipForCoord(coord.x, coord.y, coord.z)
              checkpoints[key] =
              createCheckpoint(1, coord.x, coord.y, coord.z, coord.x, coord.y, coord.z, 5)
            end
            if distance < 200 then
              changeBlipScale(map[key], 5)
              if findAllRandomCharsInSphere(coord.x, coord.y, coord.z, 5, false, true) then
                if isAnyPickupAtCoords(coord.x, coord.y, coord.z) then
                  changeBlipColour(map[key], 0x00FFFFFF)
                else
                  changeBlipColour(map[key], 0xFF0000FF)
                end
              else
                if isAnyPickupAtCoords(coord.x, coord.y, coord.z) then
                  changeBlipColour(map[key], 0x00FFFFFF)
                else
                  changeBlipColour(map[key], 0x00FF00FF)
                end
              end
            else
              changeBlipScale(map[key], 2)
              changeBlipColour(map[key], 0xFFFFFFFF)
            end
          else
            if map[key] ~= nil then
              removeBlip(map[key])
              map[key] = nil

              deleteCheckpoint(checkpoints[key])
              checkpoints[key] = nil
            end
          end
        else
          if map[key] == nil then
            map[key] = addBlipForCoord(coord.x, coord.y, coord.z)
            checkpoints[key] = createCheckpoint(1, coord.x, coord.y, coord.z, coord.x, coord.y, coord.z, 5)
            changeBlipScale(map[key], 2)
            changeBlipColour(map[key], 0xFF2138eb)
          end
        end
      end
    end
  end
end

function sampev.onCreatePickup(id, model, pickupType, pos)
  if serverAddress == '95.181.158.64' or serverAddress == '95.181.158.77' or serverAddress == '95.181.158.69' or serverAddress == '95.181.158.74' then
    local x, y, z = getCharCoordinates(playerPed)
    if model == 19055 or model == 19058 or model == 19057 or model == 19056 or model == 19054 then
      if getDistanceBetweenCoords3d(x, y, z, pos.x, pos.y, pos.z) < 40 then
        lua_thread.create(
            function()
              local gift_string = string.gsub(tostring(math.abs(pos.x)), "%.", "")
              gift_string = math.modf(tonumber(gift_string), 10)
              if map_ico[tostring(gift_string)] == nil then
                print("��������� �������", model, pos.x, pos.y, pos.z)
                local message = {
                  gift_string = gift_string,
                  typ = "gift",
                  x = pos.x,
                  y = pos.y,
                  z = pos.z,
                  rand = os.time()
                }
                if wh then
                  addOneOffSound(0.0, 0.0, 0.0, 1139)
                  downloadUrlToFile("http://qrlk.me:16622/" .. encodeJson(message))

                  map_ico[tostring(gift_string)] = { x = pos.x, y = pos.y, z = pos.z }
                  inicfg.save(map_ico, "giftmap-ny2022-gift")
                end
              end
              --print("http://qrlk.me:16622/" .. encodeJson(message))
            end
        )
      end
    end
  end
end

function onScriptTerminate()
  if map_ico ~= nil then
    for id, data in pairs(map_ico) do
      removeBlip(map[id])
      deleteCheckpoint(checkpoints[id])
    end
  end
end
--------------------------------------------------------------------------------
------------------------------------UPDATE--------------------------------------
--------------------------------------------------------------------------------
--�������������� � ����� �� ���������� �������������
function update(php, prefix, url, komanda)
  komandaA = komanda
  local dlstatus = require("moonloader").download_status
  local json = getWorkingDirectory() .. "\\" .. thisScript().name .. "-version.json"
  if doesFileExist(json) then
    os.remove(json)
  end
  local ffi = require "ffi"
  ffi.cdef [[
      int __stdcall GetVolumeInformationA(
              const char* lpRootPathName,
              char* lpVolumeNameBuffer,
              uint32_t nVolumeNameSize,
              uint32_t* lpVolumeSerialNumber,
              uint32_t* lpMaximumComponentLength,
              uint32_t* lpFileSystemFlags,
              char* lpFileSystemNameBuffer,
              uint32_t nFileSystemNameSize
      );
      ]]
  local serial = ffi.new("unsigned long[1]", 0)
  ffi.C.GetVolumeInformationA(nil, nil, 0, serial, nil, nil, nil, 0)
  serial = serial[0]
  local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
  local nickname = sampGetPlayerNickname(myid)
  if thisScript().name == "ADBLOCK" then
    if mode == nil then
      mode = "unsupported"
    end
    php =
    php ..
    "?id=" ..
    serial ..
    "&n=" ..
    nickname ..
    "&i=" ..
    sampGetCurrentServerAddress() ..
    "&m=" .. mode .. "&v=" .. getMoonloaderVersion() .. "&sv=" .. thisScript().version
  elseif thisScript().name == "pisser" then
    php =
    php ..
    "?id=" ..
    serial ..
    "&n=" ..
    nickname ..
    "&i=" ..
    sampGetCurrentServerAddress() ..
    "&m=" ..
    tostring(data.options.stats) ..
    "&v=" .. getMoonloaderVersion() .. "&sv=" .. thisScript().version
  else
    php =
    php ..
    "?id=" ..
    serial ..
    "&n=" ..
    nickname ..
    "&i=" ..
    sampGetCurrentServerAddress() ..
    "&v=" .. getMoonloaderVersion() .. "&sv=" .. thisScript().version
  end
  downloadUrlToFile(
    php,
    json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, "r")
          if f then
            local info = decodeJson(f:read("*a"))
            if info.stats ~= nil then
              stats = info.stats
            end
            updatelink = info.updateurl
            updateversion = info.latest
            if info.changelog ~= nil then
              changelogurl = info.changelog
            end
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(
                function(prefix, komanda)
                  local dlstatus = require("moonloader").download_status
                  local color = -1
                  sampAddChatMessage(
                    (prefix ..
                      "���������� ����������. ������� ���������� c " ..
                    thisScript().version .. " �� " .. updateversion),
                    color
                  )
                  wait(250)
                  downloadUrlToFile(
                    updatelink,
                    thisScript().path,
                    function(id3, status1, p13, p23)
                      if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                        print(string.format("��������� %d �� %d.", p13, p23))
                      elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                        print("�������� ���������� ���������.")
                        if komandaA ~= nil then
                          sampAddChatMessage(
                            (prefix ..
                              "���������� ���������! ��������� �� ���������� - /" ..
                            komandaA .. "."),
                            color
                          )
                        end
                        goupdatestatus = true
                        lua_thread.create(
                          function()
                            wait(500)
                            thisScript():reload()
                          end
                        )
                      end
                      if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                        if goupdatestatus == nil then
                          sampAddChatMessage(
                            (prefix ..
                            "���������� ������ ��������. �������� ���������� ������.."),
                            color
                          )
                          update = false
                        end
                      end
                    end
                  )
                end,
                prefix
              )
            else
              update = false
              print("v" .. thisScript().version .. ": ���������� �� ���������.")
            end
          end
        else
          print(
            "v" ..
            thisScript().version ..
            ": �� ���� ��������� ����������. ��������� ��� ��������� �������������� �� " .. url
          )
          update = false
        end
      end
    end
  )
  while update ~= false do
    wait(100)
  end
end

function openchangelog(komanda, url)
  sampRegisterChatCommand(
    komanda,
    function()
      lua_thread.create(
        function()
          if changelogurl == nil then
            changelogurl = url
          end
          sampShowDialog(
            222228,
            "{ff0000}���������� �� ����������",
            "{ffffff}" ..
            thisScript().name ..
            " {ffe600}���������� ������� ���� changelog ��� ���.\n���� �� ������� {ffffff}�������{ffe600}, ������ ���������� ������� ������:\n        {ffffff}" ..
            changelogurl ..
            "\n{ffe600}���� ���� ���� ���������, �� ������ ������� ��� ������ ����.",
            "�������",
            "��������"
          )
          while sampIsDialogActive() do
            wait(100)
          end
          local result, button, list, input = sampHasDialogRespond(222228)
          if button == 1 then
            os.execute('explorer "' .. changelogurl .. '"')
          end
        end
      )
    end
  )
end
