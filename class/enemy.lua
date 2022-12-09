local Ball = require('class.ball')

local ENEMY_COLOR = { 0.23, 0,33, 0.48 }
local ENEMY_SIZE = 20

function Enemy()
  local _x, _y = 200, 300
  
  return {
    x = _x,
    y = _y,
    draw = function(self)
      local ball = Ball(ENEMY_SIZE, self.x, self.y, ENEMY_COLOR)
      ball:draw()
    end,

    moveTowardsPlayer = function(self, player)
      if self.x < player.x then
        self.x = self.x + 1
      else
        self.x = self.x - 1
      end

      if self.y < player.y then
        self.y = self.y + 1
      else
        self.y = self.y - 1
      end
    end
  }
end

return Enemy
