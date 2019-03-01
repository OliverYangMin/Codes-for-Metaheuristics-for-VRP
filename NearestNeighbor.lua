-- name: Nearest Neiborhood Algorithm
-- purpose: using the greedy purpose of inserting nearest node to current route
-- start date: 2019-03-01
-- authors: YangMin
-- with global variables: nodes, dis, and routes as input
-- the results be inserted into routes


module(..., package.seeall)

local function NearestUnroutedNode(node, nodesSet)
    local n, ndis = 0, math.huge
    for i=1,#nodesSet do
        if dis[node][nodesSet[i]]<math.huge then
            n, ndis = i, dis[node][nodesSet[i]]
        end 
    end 
    return n
end 

function NearestNeighbor(K)
    local unrouted = {}
    for i=2,#nodes do table.insert(unrouted, i) end 
    if K then --parallel
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
    else     --sequential
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
end 
