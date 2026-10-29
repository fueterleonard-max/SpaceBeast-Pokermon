local fuecoco={
    name = "fuecoco",
    pos = { x = 16, y = 60 },
    config = {extra = {d_size = 1, mult = 0, mult_mod = 1}, evo_rqmt = 16},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.d_size, center.ability.extra.mult, center.ability.extra.mult_mod}}
    end,
    rarity = 2,
    cost = 6,
    stage = "Basic",
    ptype = "Fire",
    gen = 9,
    atlas = "AtlasJokersBasicNatdex",
    starter = true,
    blueprint_compat = true,
    perishable_compat = false,
    eternal_compat = true,
    calculate = function(self, card, context)
        if context.pre_discard and not context.blueprint then
            if #context.full_hand == 5 then
                SMODS.scale_card(card, {
                    ref_value = "mult",
                    scalar_value = "mult_mod",
                    message_colour = G.C.MULT,
                    })
                
                
            end
        end
    if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
        return pokermon.scaling_evo(self, card, context, "j_pokespace_crocalor", card.ability.extra.mult, self.config.evo_rqmt)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
        ease_discard(card.ability.extra.d_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
        ease_discard(-card.ability.extra.d_size)
    end,
    attributes = {"discard", "starter", "passive", "mult", "scaling", "scaling_evo"},
}

local crocalor={
    name = "crocalor",
    pos = { x = 18, y = 60 },
    config = {extra = {d_size = 1, mult = 0, mult_mod = 2}, evo_rqmt = 40},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.d_size, center.ability.extra.mult, center.ability.extra.mult_mod}}
    end,
    rarity = "poke_safari",
    cost = 8,
    stage = "One",
    ptype = "Fire",
    gen = 9,
    atlas = "AtlasJokersBasicNatdex",
    starter = true,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.pre_discard and not context.blueprint then
            if #context.full_hand == 5 then
                SMODS.scale_card(card, {
                    ref_value = "mult",
                    scalar_value = "mult_mod",
                    message_colour = G.C.MULT,
                    })
                
                
            end
        end
    if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
        return pokermon.scaling_evo(self, card, context, "j_pokespace_skeledirge", card.ability.extra.mult, self.config.evo_rqmt)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
        ease_discard(card.ability.extra.d_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
        ease_discard(-card.ability.extra.d_size)
    end,
    attributes = {"discard", "starter", "passive", "mult", "scaling", "scaling_evo"},
}

local skeledirge={
    name = "skeledirge",
    pos = { x = 20, y = 60 },
    config = {extra = {d_size = 1, mult = 0, mult_mod = 2, Xmult = 1, Xmult_mod = 0.15, Xmult_reset = 1}},
    loc_vars = function(self, info_queue, center)
        return {vars = {center.ability.extra.d_size, center.ability.extra.mult, center.ability.extra.mult_mod, center.ability.extra.Xmult, center.ability.extra.Xmult_mod, center.ability.extra.Xmult_reset}}
    end,
    rarity = "poke_safari",
    cost = 10,
    stage = "Two",
    ptype = "Fire",
    gen = 9,
    atlas = "AtlasJokersBasicNatdex",
    starter = true,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function(self, card, context)
        if (context.pre_discard and not context.blueprint) and not context.hook then
            if #context.full_hand >= 5 then

                SMODS.scale_card(card, {
                    ref_value = "mult",
                    scalar_value = "mult_mod",
                    message_colour = G.C.MULT,
                    })
                SMODS.scale_card(card, {
                    ref_value = "Xmult",
                    scalar_value = "Xmult_mod",
                    message_colour = G.C.MULT,
                })

               
                
            end
            
        end
        if context.end_of_round and context.game_over == false and context.main_eval and G.GAME.blind.boss then
            card.ability.extra.Xmult = card.ability.extra.Xmult_reset
            return {
                message = localize('k_reset'),
                colour = G.C.CHIPS
            }
            
        end
    if context.joker_main then
            return {
                
                mult_mod = card.ability.extra.mult,
                Xmult_mod = card.ability.extra.Xmult,
                message = localize("pokespace_torchsong_ex"),
            }
        end
        
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
        ease_discard(card.ability.extra.d_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
        ease_discard(-card.ability.extra.d_size)
    end,
    attributes = {"discard", "starter", "passive", "mult", "scaling","xmult","reset"},
}



return {
    config_key = "Fuecoco_line", 
    list = {fuecoco, crocalor, skeledirge },
}
