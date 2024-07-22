local target = "NIL"

rednet.wrap("back")

function main()
    while true do
        local x,y,z = gps.locate()
        rednet.broadcast(target,x,y,z)
        sleep(0.1)
    end
end

while true do
    local s,e = pcall(main)

    if not s then
        if e == "Terminated" then
            os.reboot()
        end
    end
end
