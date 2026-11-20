local pd = peripheral.find("player_detector")
local cb = peripheral.find("chat_box")
local tx, ty = term.getSize()
local trackedName = ""
local tracked
local paused = false
local x, y, z

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setBackgroundColor(colors.red)
term.setTextColor(colors.white)
term.setCursorPos(1,1)
term.write(string.rep(" ", tx))
term.setCursorPos(1,1)
term.write("Tracker")
term.setCursorPos(tx,1)
term.blit("X","0","e")

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.setCursorPos(1,2)
term.write("Track who?\n")
trackedName = tostring(io.read())
tracked = pd.getPlayer(trackedName)
if tracked == nil then
  term.setBackgroundColor(colors.black)
  term.setTextColor(colors.white)
  term.clear()
  term.setBackgroundColor(colors.black)
  term.setTextColor(colors.red)
  term.setCursorPos((tx/2)-((string.len("player is not online, or doesnt exist"))/2),2)
  term.write("player is not online, or doesnt exist")
  sleep(1)
  error("err code 1: player not detected")
end

function clickHandler()
  while true do
    local event, button, x, y = os.pullEvent()
    if event == "mouse_click" and x == tx and y == 1 then
      paused = true
      term.setCursorPos(tx,1)
      term.blit("X","0","7")
      event, button, x, y = os.pullEvent("mouse_up")
      if event == "mouse_up" then
        return
      end
    end
  end
end

function trackingHandler()
  while true do
    sleep(0.05)
    tracked = pd.getPlayer(trackedName)
    x, y, z = tracked.x, tracked.y, tracked.z
  end
end

function displayHandler()
  while true do
    sleep(0.05)
    if paused == false then
      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.clear()

      term.setBackgroundColor(colors.red)
      term.setTextColor(colors.white)
      term.setCursorPos(1,1)
      term.write(string.rep(" ", tx))
      term.setCursorPos(1,1)
      term.write("Tracker")
      term.setCursorPos(tx,1)
      term.blit("X","0","e")

      term.setBackgroundColor(colors.black)
      term.setTextColor(colors.white)
      term.setCursorPos((tx/2)-((string.len(string.sub(trackedName,1,10))+10)/2),3)
      term.write("Tracking: "..string.sub(trackedName,1,10))

      term.setCursorPos(7,5)
      term.blit("Coordinates","44444444444","fffffffffff")
      term.setCursorPos(6,6)
      term.write("X: "..math.modf(tracked.x))
      term.setCursorPos(6,7)
      term.write("Y: "..math.modf(tracked.y))
      term.setCursorPos(6,8)
      term.write("Z: "..math.modf(tracked.z))

      term.setCursorPos(7,10)
      term.blit("Looking At","4444444444","ffffffffff")
      term.setCursorPos(6,11)
      term.write("Yaw: "..math.modf(tracked.yaw))
      term.setCursorPos(6,12)
      term.write("Pitch: "..math.modf(tracked.pitch))
    end
  end
end

parallel.waitForAny(trackingHandler, displayHandler, clickHandler)