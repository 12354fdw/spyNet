rednet.open("top")
 
local sx,sy,sz = gps.locate()
 
local targets = {}
 
term.clear()
term.setCursorPos(1,1)
print("-----------[spyNet]-----------")
 
while true do
    local id,tar,x,y,z = rednet.receive()
    targets[tar].x = x
    targets[tar].y = y
    targets[tar].z = z
    local dx,dy,dz = sx-x,sy-y,sz-z
    local d = sqrt(dx^2,dy^2,dz^2)
    targets[tar].d = d
    for i,v in pairs(targets) do
		term.clear()
		term.setCursorPos(1,1)
		print("-----------[spyNet]-----------")
        print(i.." pos: "..v.x..", "..v.y..", "..v.z)
        print(i.." dis: "..v.d)
    end
end
