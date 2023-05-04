local socket = require('socket')
Udp = socket.udp()
Udp:setsockname('*', 3000)
Udp:settimeout(0)

local greenX, greenY = 100, 100
local redX, redY = 400, 100

function love.draw()
	love.graphics.setColor(0, 1, 0)
	love.graphics.rectangle("fill", greenX, greenY, 50, 50)

	love.graphics.setColor(1, 0, 0)
	love.graphics.rectangle("fill", redX, redY, 50, 50)
end

function love.update()
	greenX, greenY = love.mouse.getPosition()
	local data, msg_or_ip, port_or_nil = Udp:receivefrom()
	if data then
    print(data)
		local p = Split(data, '-')
		redX, redY = p[1], p[2]
		Udp:sendto(tostring(greenX)..'-'..tostring(greenY), msg_or_ip, port_or_nil)
	end
end

function Split(s, delimiter)
	local result = {}
	for match in (s..delimiter):gmatch("(.-)"..delimiter) do
		table.insert(result, match)
	end
	return result
end
