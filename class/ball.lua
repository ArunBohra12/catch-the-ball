local function Ball(radius, x, y, color)
  color = color or { 1, 1, 1, 1 }

  return {
    draw = function()
      love.graphics.setColor(color)
      love.graphics.circle('fill', x, y, radius)
      love.graphics.setColor(1, 1, 1)
    end
  }
end

return Ball
