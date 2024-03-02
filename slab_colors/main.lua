local Slab = require "Slab"

local background = nil

function draw_list_box()
  local Selected = nil
  Slab.BeginWindow('ListBox', {Title = "List Box", AutoSizeWindow = false})
  Slab.BeginListBox('ListBoxExample')
  for I = 1, 10, 1 do
    Slab.BeginListBoxItem('ListBoxExample_Item_' .. I, {Selected = Selected == I})
    Slab.Text("Item " .. I)

    if Slab.IsListBoxItemClicked() then
      Selected = I
    end

    Slab.EndListBoxItem()
  end
  Slab.EndListBox()
  Slab.EndWindow()
end

function love.load(args)
  background = love.graphics.newImage("/res/background.jpg")
  Slab.Initialize(args)
end

function love.update(dt)
  Slab.Update(dt)
  draw_list_box()
end

function love.draw()
  love.graphics.draw(background, 0, 0, 0, 1, 1, 0, 0, 0, 0)
  Slab.Draw()
end