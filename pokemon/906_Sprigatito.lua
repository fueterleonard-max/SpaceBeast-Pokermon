local sprigatito = {
    name = "sprigatito",
    pos = {x = 10, y = 60},
    config = {extra = {h_size = 1, earned = 0, money_mod = 0, money = 4}, evo_rqmt = 16},
    loc_vars = function(self, info_queue, center)
        local money_left = math.max(0, self.config.evo_rqmt - center.ability.extra.earned)
        return {vars = {center.ability.extra.money, money_left, center.ability.extra.h_size}}
    end,
    rarity = 2, 
    cost = 6, 
    stage = "Basic",
    ptype = "Grass",
    gen = 9,
    atlas = "AtlasJokersBasicNatdex",
    starter = true,
    blueprint_compat = false,
    perishable_compat = false,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local remaining = #G.hand.cards
            if remaining >= 5 then
                card.ability.extra.earned = card.ability.extra.earned + card.ability.extra.money
                card.ability.extra.money_mod = card.ability.extra.money
            else
                card.ability.extra.money_mod = 0
            end
        end
        return pokermon.scaling_evo(self, card, context, "j_pokespace_floragato", card.ability.extra.earned, self.config.evo_rqmt)
    end,
    calc_dollar_bonus = function(self, card)
        local n = card.ability.extra.money_mod or 0
        if n > 0 then
            return pokermon.ease_poke_dollars(card, "sprigatito", card.ability.extra.money_mod, true)
        end
        
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,

    attributes = {"hand_size","passive", "starter", "economy", "trigger_evo"}      
}

local floragato = {
    name = "floragato",
    pos = {x = 12, y = 60},
    config = {extra = {h_size = 1, earned = 0, money = 6, money_mod = 6}, evo_rqmt = 24},
    loc_vars = function(self, info_queue, center)
        local money_left = math.max(0, self.config.evo_rqmt - center.ability.extra.earned)
        return {vars = {center.ability.extra.money, money_left, center.ability.extra.h_size}}
    end,
    rarity = "poke_safari", 
    cost = 8, 
    stage = "One",
    ptype = "Grass",
    gen = 9,
    atlas = "AtlasJokersBasicNatdex",
    starter = true,
    blueprint_compat = false,
    perishable_compat = false,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local remaining = #G.hand.cards
            if remaining >= 5 then
                card.ability.extra.earned = card.ability.extra.earned + card.ability.extra.money
                card.ability.extra.money_mod = card.ability.extra.money
            else
                card.ability.extra.money_mod = 0
            end
        end
        return pokermon.scaling_evo(self, card, context, "j_pokespace_meowscarada", card.ability.extra.earned, self.config.evo_rqmt)
    end,
    calc_dollar_bonus = function(self, card)
        local n = card.ability.extra.money_mod or 0
        if n > 0 then
            return pokermon.ease_poke_dollars(card, "floragato", card.ability.extra.money_mod, true)
        end
        
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    attributes = {"hand_size","passive", "starter", "economy", "trigger_evo"}          
}

local meowscarada = {
    name = "meowscarada",
    pos = {x = 14, y = 60},
    config = {extra = {h_size = 1, earned = 0, money_mod = 1, money = 6}},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.money, center.ability.extra.h_size, center.ability.extra.money_mod}}
    end,
    rarity = "poke_safari", 
    cost = 10, 
    stage = "Two",
    ptype = "Grass",
    gen = 9,
    atlas = "AtlasJokersBasicNatdex",
    starter = true,
    blueprint_compat = false,
    perishable_compat = false,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local remaining = #G.hand.cards
            if remaining >= 5 then
                card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
                message = localize("k_upgrade")
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        local n = card.ability.extra.money or 0
        if n > 0 then
            return pokermon.ease_poke_dollars(card, "meowscarada", card.ability.extra.money, true)
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    attributes = {"hand_size","passive", "starter", "economy", "scaling"}  
                
}
return {
    config_key = "Sprigatito_line", 
    list = {sprigatito, floragato, meowscarada},
}