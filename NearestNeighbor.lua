--input：nodes, distance matrix, vehicle infomation
--output: a set of feasible routes with as lower as possible cost

nodes = {{d=10,x=1,y=2,a=,b=,s=}}
dis = {}
veh = {Q=100}
routes = {}
function NearestUnroutedNode(node, nodesSet)
    local n, ndis = 0, math.huge
    for i=1,#nodesSet do
        if dis[node][nodesSet[i]]<math.huge then
            n, ndis = i, dis[node][nodesSet[i]]
        end 
    end 
    return n
end 


local Construction = {}
function Construction.NearestNeighbor_seq()
    local unrouted = {}
    for i=2,#nodes do table.insert(unrouted, i) end 
    while #unrouted>0 do 
        local route = {1; d=0}
        while true do
            local nxt = NearestUnroutedNode(route[#route])
            if route.d+nodes[unrouted[nxt]].d<=veh.Q then 
                table.insert(route, unrouted[nxt])
                table.remove(unrouted, nxt)
            else
                table.insert(route, 1)
                break
            end
        end 
        table.insert(routes, route)
    end 
end 

function Construction.NearestNeighbor_pal(K)
    local unrouted = {}
    for i=2,#nodes do table.insert(unrouted, i) end 
    for i=1,K do routes[i] = {1} end
    for r, route in ipairs(routes) do
        if #unrouted<=0 then break end 
        if route.d<veh.Q then
            local nxt = NearestUnroutedNode(routes[#routes])
            if route.d+nodes[unrouted[nxt]].d<=veh.Q then 
                table.insert(route, unrouted[nxt])
                table.remove(unrouted, nxt)
            end 
        end 
    end 
end 