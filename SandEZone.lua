local SandEZone = {}
SandEZone.data = {}
SandEZone.list = nil
SandEZone.hasInit = false

function SandEZone:Init()
    if not SandEZone.hasInit then
        for i=0, 70000 do
            SandEZone.data[i] = GetZoneNameById(i)
        end

        SandEZone.list = SandEZoneList:New(SandEZoneFrame)
        SandEZone.hasInit = true
    end
end

function SandEZone:Print(i, x)
    if not SandEZone.hasInit then
        SandEZone:Init()
    end

    for v=i, x do
        d(v .. " : " .. SandEZone.data[v])
    end
end

function SandEZone:Print()
    if not SandEZone.hasInit then
        SandEZone:Init()
    end

    d ( SandEZone.data )
end
