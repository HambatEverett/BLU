local tx, ty = term.getSize()
local tblookup = {[1] = 32768, [2] = 32768, [4] = 32768, [8] = 32768, [16] = 32768, [32] = 32768, [64] = 32768, [128] = 1, [256] = 32768, [512] = 32768, [1024] = 32768, [2048] = 32768, [4096] = 1, [8192] = 1, [16384] = 32768, [32768] = 1}
local topColor = 8
local pauseFront = false

local settingsIcon = paintutils.loadImage("assets/appicons/settings.nfp")
local pnpIcon = paintutils.loadImage("assets/appicons/plugnplay.nfp")
local trackerIcon = paintutils.loadImage("assets/appicons/tracker.nfp")

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1,1)

function backend()
  while true do
    sleep(0.05)
    local event, button, x, y = os.pullEvent("mouse_click")
    if x >= 3 and x <= 8 and y >= 3 and y <= 6 then
      pauseFront = true
      shell.run("settings.lua")
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()
      pauseFront = false
    elseif x >= 10 and x <= 15 and y >= 3 and y <= 6 then
      pauseFront = true
      shell.run("plugnplay.lua")
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()
      pauseFront = false
    elseif x >= 17 and x <= 23 and y >= 3 and y <= 6 then
      pauseFront = true
      shell.run("tracker.lua")
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()
      pauseFront = false
    end
  end
end

function frontend()
  while true do
    sleep(0.1)
    if pauseFront == false then
      term.setCursorPos(1,1)
      term.setBackgroundColor(topColor)
      term.write(string.rep(" ", tx))

      term.setTextColor(tblookup[topColor])
      term.setCursorPos(1, 1)
      term.write(settings.get("username"))
      term.setCursorPos((tx-#textutils.formatTime(os.time()))+1, 1)
      term.write(textutils.formatTime(os.time()))

      term.setCursorPos(3,3)
      paintutils.drawImage(settingsIcon, term.getCursorPos())
      term.setCursorPos(3,6)
      term.blit("Setng","00000","fffff")

      term.setCursorPos(10,3)
      paintutils.drawImage(pnpIcon, term.getCursorPos())
      term.setCursorPos(10,6)
      term.blit("PnP","000","fff")

      term.setCursorPos(17,3)
      paintutils.drawImage(trackerIcon, term.getCursorPos())
      term.setCursorPos(17,6)
      term.blit("Track","00000","fffff")
    end
  end
end

parallel.waitForAny(frontend,backend)
