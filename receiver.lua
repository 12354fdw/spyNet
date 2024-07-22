rednet.open("top")

local sx,sy,sz = gps.locate()

local targets = {}

term.clear()
term.setCursorPos(1,1)
local w,h = term.getSize()
print("spyNet Command Center")

while true do
    local id,data = rednet.receive()
    local tar = data[1]
    local x = data[2]
    local y = data[3]
    local z = data[4]

    if not targets[tar] then targets[tar] = {} end

    targets[tar].x = x
    targets[tar].y = y
    targets[tar].z = z

    local dx,dy,dz = sx-x,sy-y,sz-z
    local d = sqrt(dx^2,dy^2,dz^2)
    targets[tar].d = d
    term.clear()
    term.setCursorPos(1,1)
    print("spyNet Command Center")
    for i,v in pairs(targets) do
        print(i.." pos: "..v.x..", "..v.y..", "..v.z)
        print(i.." dis: "..v.d)
    end
end
