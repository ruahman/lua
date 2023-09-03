-- luacheck: ignore

-- run when the game starts
function love.load()
	-- number = 0
	target = {}
	target.x = 300
	target.y = 300
	target.radius = 50

	score = 0
	timer = 0

	gameFont = love.graphics.newFont(40)
end

-- run every frame, game loop
function love.update(dt)
	-- number = number + 1
end

-- incharge of drawing to the screen
function love.draw()
	-- love.graphics.print("Hello World")
	-- love.graphics.print(number)
	-- love.graphics.setColor(0, 1, 0)
	-- love.graphics.rectangle("fill", 200, 400, 200, 100)
	--
	-- love.graphics.setColor(1, 0, 0)
	-- love.graphics.circle("fill", 300, 200, 100)

	love.graphics.setColor(1, 0, 0)
	love.graphics.circle("fill", target.x, target.y, target.radius)

	love.graphics.setColor(1, 1, 1)
	love.graphics.setFont(gameFont)
	love.graphics.print(score, 0, 0)
end

function love.mousepressed(x, y, button, istouch, presses)
	if button == 1 then
		local mouseToTarget = distanceBetween(x, y, target.x, target.y)
		if mouseToTarget < target.radius then
			score = score + 1
			target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
			target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
		end
	end
end

function distanceBetween(x1, y1, x2, y2)
	return math.sqrt((y2 - y1) ^ 2 + (x2 - x1) ^ 2)
end
