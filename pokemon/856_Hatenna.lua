local hatenna = {
    name = "hatenna",
    pos = {x = 0, y = 57},
    config = {extra = {mult = 3, tarot_used = 0, unique_tarot_used = {}}, evo_rqmt = 4},
    loc_vars = function(self, info_queue, center)
        return{vars = {center.ability.extra.mult, math.max(self.config.evo_rqmt - ((center.ability.extra.unique_tarot_used and #center.ability.extra.unique_tarot_used) or 0), 0)}}
    end,
    rarity = 2,
    cost = 5,
    stage = "Basic",
    ptype = "Psychic",
    atlas = "AtlasJokersBasicNatdex",
    gen = 8,
    perishable_compat = true,
    blueprint_compat = true,
    poke_custom_values_to_keep = {"unique_tarot_used"},
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Tarot" then
            card.ability.extra.tarot_used = 1
            local unique = true
			local usedCard = context.consumeable
			for i, v in pairs(card.ability.extra.unique_tarot_used) do
				if v == usedCard.config.center_key then
					unique = false
					break
				end
			end
            if unique == true then
                table.insert(card.ability.extra.unique_tarot_used, context.consumeable.config.center.key)
            end
        end
        if context.joker_main then
            if card.ability.extra.tarot_used == 1 then
                return{
                    mult = card.ability.extra.mult *3
                }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            card.ability.extra.tarot_used = 0
            
        end
        return pokermon.scaling_evo(self, card, context, "j_pokespace_hattrem", ((card.ability.extra.unique_tarot_used and #card.ability.extra.unique_tarot_used) or 0), self.config.evo_rqmt)
    end,
    attributes = {"mult","tarot"},
}

local hattrem = {
    name = "hattrem",
    pos = {x = 2, y = 57},
    config = {extra = {mult_mod = 1, tarot_used = 0}, evo_rqmt = 20},
    loc_vars = function(self, info_queue, card)
        local mult = (card.ability.extra.mult_mod*(G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0))
        return{vars = {card.ability.extra.mult_mod, mult}}
    end,
    rarity = "poke_safari",
    cost = 7,
    stage = "One",
    ptype = "Psychic",
    atlas = "AtlasJokersBasicNatdex",
    gen = 8,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        
        if context.using_consumeable and context.consumeable.ability.set == "Tarot" then
            if card.ability.extra.tarot_used == 0 then
                SMODS.add_card({set = 'Tarot', area = G.consumeables, key = context.consumeable.config.center.key})
            end
            card.ability.extra.tarot_used = 1
        end
        if context.joker_main then
            if G.GAME.consumeable_usage_total then
                if G.GAME.consumeable_usage_total.tarot and G.GAME.consumeable_usage_total.tarot > 0 then
                    local mult = G.GAME.consumeable_usage_total.tarot * card.ability.extra.mult_mod
                    return {
                        mult = mult
                    }
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            card.ability.extra.tarot_used = 0
        end
        return pokermon.scaling_evo(self, card, context, "j_pokespace_hatterene",  (card.ability.extra.mult_mod*(G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)), self.config.evo_rqmt)
    end,
    attributes = {"mult","tarot"},
}

local hatterene = {
    name = "hatterene",
    pos = {x = 4, y = 57},
    config = {extra = {Xmult_mod = 0.05, tarot_used = 0}},
    loc_vars = function(self, info_queue, card)
        local Xmult = (card.ability.extra.Xmult_mod*(G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)) + 1
        return{vars = {card.ability.extra.Xmult_mod, Xmult}}
    end,
    rarity = "poke_safari",
    cost = 9,
    stage = "Two",
    ptype = "Psychic",
    atlas = "AtlasJokersBasicNatdex",
    gen = 8,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        
        if context.using_consumeable and context.consumeable.ability.set == "Tarot" then
            if card.ability.extra.tarot_used == 0 then
                SMODS.add_card({set = 'Tarot', area = G.consumeables, key = context.consumeable.config.center.key})
            end
            card.ability.extra.tarot_used = 1
        end
        if context.joker_main then
            if G.GAME.consumeable_usage_total then
                if G.GAME.consumeable_usage_total.tarot and G.GAME.consumeable_usage_total.tarot > 0 then
                    local Xmult = (G.GAME.consumeable_usage_total.tarot * card.ability.extra.Xmult_mod) + 1
                    return {
                        Xmult = Xmult
                    }
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            card.ability.extra.tarot_used = 0
        end
    end,
    attributes = {"Xmult","tarot"},
}

return {
    config_key = "Hatenna_line",
    list = {hatenna, hattrem, hatterene},
}