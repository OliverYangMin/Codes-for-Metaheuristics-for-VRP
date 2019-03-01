-- name: Constructions
-- purpose: provide constructive algorithms: ad_hoc, nearest neighbor, Clark Wright, Sweep 
-- start date: 2019-03-01
-- authors: YangMin

module(..., package.seeall)


function ad_hoc()
    routes = {cost=0}
    for i=2,#nodes do
        local route = {1,i,1}
        route.cost = dis[1][i] + dis[i][1]
        route.d = nodes[i].d
        table.insert(routes, route)
    end 
end 

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
    routes = {cost=0}
    local unrouted = {}
    for i=2,#nodes do table.insert(unrouted, i) end 
    if K then --parallel
        for i=1,K do routes[i] = {1; d=0, cost=0} end
        while #unrouted>0 do
            for r, route in ipairs(routes) do
                if #unrouted==0 then break end 
                if route.d<instance.cap then
                    local nxt = NearestUnroutedNode(route[#route], unrouted)
                    if route.d+nodes[unrouted[nxt]].d<=instance.cap then
                        route.cost = route.cost + dis[route[#route]][unrouted[nxt]]
                        route.d = route.d + nodes[unrouted[nxt]].d
                        table.insert(route, unrouted[nxt])
                        table.remove(unrouted, nxt)
                    end 
                else 
                    route.cost = route.cost + dis[route[#route]][1]
                    table.insert(route, 1)
                end 
            end  
        end 
        for i=1,#routes do
            routes.cost = routes.cost + routes[i].cost
        end 
    else     --sequential
        while #unrouted>0 do 
            local route = {1; d=0, cost=0}
            while #unrouted>0 do
                local nxt = NearestUnroutedNode(route[#route], unrouted)
                if route.d+nodes[unrouted[nxt]].d<=instance.cap then 
                    route.cost = route.cost + dis[route[#route]][unrouted[nxt]]
                    route.d = route.d + nodes[unrouted[nxt]].d
                    table.insert(route, unrouted[nxt])
                    table.remove(unrouted, nxt)
                else
                    route.cost = route.cost + dis[route[#route]][1]
                    table.insert(route, 1)
                    break
                end
            end 
            table.insert(routes, route)
            routes.cost = routes.cost + route.cost
        end 
    end 
end 
