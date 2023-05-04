local socket = require('socket')
Udp = socket.udp()
Udp:setsockname('*', 3000)
Udp:settimeout(0)

local redX, redY = 400, 100

function love.draw()
	love.graphics.setColor(1, 0, 0)
	love.graphics.rectangle("fill", redX, redY, 50, 50)
end

function love.update()
	local data, msg_or_ip, port_or_nil = Udp:receivefrom()
	if data then
    print(data)
		local p = Split(data, '-')
		redX, redY = p[1], p[2]
		Udp:sendto(tostring(redX)..'-'..tostring(redY), msg_or_ip, port_or_nil)
	end
end

function Split(s, delimiter)
	local result = {}
	for match in (s..delimiter):gmatch("(.-)"..delimiter) do
		table.insert(result, match)
	end
	return result
end
