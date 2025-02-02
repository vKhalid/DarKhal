-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ??? (qm2)
-- Note: Spawns NM Cancer
-- !pos -25.238 -12.785 -148.393 174
-----------------------------------
local ID = zones[xi.zone.KUFTAL_TUNNEL]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, xi.items.QUUS) and
        not GetMobByID(ID.mob.CANCER):isSpawned() and
        not GetMobByID(ID.mob.CANCER + 1):isSpawned()
    then
        local mobId = (math.random(1, 100) <= 7) and ID.mob.CANCER or ID.mob.CANCER + 1 -- Cancer has 7% chance to spawn, else Robber Crab.
        npcUtil.popFromQM(player, npc, mobId)
        player:confirmTrade()
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.FISHBONES)
end

return entity
