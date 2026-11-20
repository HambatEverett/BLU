local button = paintutils.loadImage("assets/button.nfp")
local tx, ty = term.getSize()
local screen = "main"
local connected = peripheral.wrap("bottom")

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()

function periphHandler()
  while true do
    local event, side = os.pullEvent()

    if event == "peripheral" or event == "peripheral_detach" then
      connected = peripheral.wrap("bottom")
    end
  end
end

function clickHandler()
  while true do
    local event, button, x, y = os.pullEvent("mouse_click")
    if x == tx and y == 1 then return end
  end
end

function frontend()
  while true do
    sleep(0.05)
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    term.clear()
    term.setCursorPos(1,1)
    term.setBackgroundColor(1024)
    term.write(string.rep(" ", tx))

    term.setCursorPos(1,1)
    term.blit("Plug n' Play","ffffffffffff","aaaaaaaaaaaa")
    term.setCursorPos(tx,1)
    term.blit("X","f","e")
    if screen == "main" then
      if connected then
        term.setCursorPos((tx/2)-(string.len("Connected Peripheral: "..peripheral.getType(connected):gsub("^%l", string.upper):sub(1,24))/2),3)
        term.setBackgroundColor(colors.black)
        term.setTextColor(colors.white)
        term.write("Connected Peripheral: "..peripheral.getType(connected):gsub("^%l", string.upper):sub(1,24))

        paintutils.drawImage(button, tx-(#button[1]+1),5)
        term.setCursorPos(tx-(#button[1]-4),7)
        term.blit("See Methods","fffffffffff","88888888888")
      else
        term.setCursorPos((tx/2)-(string.len("No Peripheral Connected")/2),(ty/2))
        term.setBackgroundColor(colors.black)
        term.setTextColor(colors.white)
        term.write("No Peripheral Connected")
      end
    elseif screen == "methods" then
      print("Sorry not finished")
    end
  end
end

parallel.waitForAny(frontend,clickHandler,periphHandler)