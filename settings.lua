-- WIP
-- Note to self, making an update button summons satan.

local button = paintutils.loadImage("assets/button.nfp")
local tx, ty = term.getSize()
local screen = "main"

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1,1)

function organs()
  while true do
    sleep(0.05)
    local event, button, x, y = os.pullEvent("mouse_click")
    if screen == "main" then
      if x == tx and y == 1 then return end
      if x >= 2 and x <= 24 and y >= 3 and y <= 8 then screen = "changeUsername" end
    end
  end
end

function frontend()
  while true do
    sleep(0.05)
    term.setCursorPos(1,1)
    term.setBackgroundColor(256)
    term.write(string.rep(" ", tx))

    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.white)
    term.setCursorPos(1,1)
    term.blit("Settings","ffffffff","88888888")
    term.setCursorPos(tx,1)
    term.blit("X","f","e")

    if screen == "main" then
      paintutils.drawImage(button,2,3)
      term.setCursorPos(5,5)
      term.blit("Change Username","fffffffffffffff","888888888888888")
    elseif screen == "changeUsername" then
      term.setTextColor(colors.white)
      term.setBackgroundColor(colors.black)
      term.clear()
      term.setCursorPos(((tx/2)-(string.len("New Username:")/2))-0.5,2)
      term.write("New username:")
      term.setCursorPos((tx/2)-5,5)
      local newName = io.read()
      settings.set("username",newName)
      settings.save()
      term.clear()
      screen = "main"
    end
  end
end

parallel.waitForAny(organs, frontend)