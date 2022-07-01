local function setFrameToQuarter()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f, 0)
end

local function setFrameToHalfVertical()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f, 0)
end

local function setFrameToHalfHorizontal()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end

local function move(position)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  local table = {}

  table['left-top'] = function()
    f.x = max.x
    f.y = max.y
  end

  table['right-top'] = function()
    f.x = max.x + (max.w - f.w)
    f.y = max.y
  end

  table['left-bottom'] = function()
    f.x = max.x
    f.y = max.y + (max.h - f.h)
  end

  table['right-bottom'] = function()
    f.x = max.x + (max.w - f.w)
    f.y = max.y + (max.h - f.h)
  end

  table['top'] = function()
    f.y = max.y
  end

  table['left'] = function()
    f.x = max.x
  end

  table['bottom'] = function()
    f.y = max.y + (max.h - f.h)
  end

  table['right'] = function()
    f.x = max.x + (max.w - f.w)
  end

  table[position]()
  win:setFrame(f)
end

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "u", function()
   setFrameToQuarter()
   move('left-top')
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "i", function()
   setFrameToQuarter()
   move('right-top')
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "j", function()
   setFrameToQuarter()
   move('left-bottom')
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "k", function()
   setFrameToQuarter()
   move('right-bottom')
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "up", function()
   setFrameToHalfVertical()
   move('top')
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "left", function()
   setFrameToHalfHorizontal()
   move('left')
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "down", function()
   setFrameToHalfVertical()
   move('bottom')
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "right", function()
   setFrameToHalfHorizontal()
   move('right')
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "return", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "-", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = f.x + 20
  f.y = f.y + 20
  f.w = f.w - 40
  f.h = f.h - 40

  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "=", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = f.x - 20
  f.y = f.y - 20
  f.w = f.w + 40
  f.h = f.h + 40

  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "c", function()
  hs.window.focusedWindow():centerOnScreen()
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "n", function()
  local screen = hs.window.focusedWindow():screen():next()
  hs.window.focusedWindow():moveToScreen(screen)
end)

