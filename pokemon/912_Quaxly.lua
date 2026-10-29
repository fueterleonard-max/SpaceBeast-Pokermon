local quaxly = {
    name = "quaxly",
    pos = {x = 22, y = 60},
    config = {extra = {chips = 0, chip_mod = 4, hands = 1}, evo_rqmt = 32},
    loc_vars = function(self, info_queue, center)
        return{vars = {center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.hands}}
    end,
    rarity = 2,
    cost = 6,
    stage = "Basic",
    ptype = "Water",
    atlas = "AtlasJokersBasicNatdex",
    gen = 9,
    starter = true,
    perishable_compat = false,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.before and not context.blueprint and #context.full_hand == 5 then
            SMODS.scale_card(card, {
                ref_value = "chips",
                scalar_value = "chip_mod",
                message_colour = G.C.CHIPS,
            })
        end
        if context.joker_main then
            return{
                chips = card.ability.extra.chips
            }
        end
        return pokermon.scaling_evo(self, card, context, "j_pokespace_quaxwell", card.ability.extra.chips, self.config.evo_rqmt)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        if not from_debuff then
        ease_hands_played(card.ability.extra.hands)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        pokermon.ease_hands_played(-card.ability.extra.hands)
    end,
    attributes = {"starter", "hands", "passive", "chips", "scaling", "scaling_evo"},
}

local quaxwell = {
    name = "quaxwell",
    pos = {x = 24, y = 60},
    config = {extra = {chips = 0, chip_mod = 8, hands = 1}, evo_rqmt = 80},
    loc_vars = function(self, info_queue, center)
        return{vars = {center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.hands}}
    end,
    rarity = "poke_safari",
    cost = 8,
    stage = "One",
    ptype = "Water",
    atlas = "AtlasJokersBasicNatdex",
    gen = 9,
    starter = true,
    perishable_compat = false,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.before and not context.blueprint and #context.full_hand == 5 then
            SMODS.scale_card(card, {
                ref_value = "chips",
                scalar_value = "chip_mod",
                message_colour = G.C.CHIPS,
            })
        end
        if context.joker_main then
            return{
                chips = card.ability.extra.chips
            }
        end
        return pokermon.scaling_evo(self, card, context, "j_pokespace_quaquaval", card.ability.extra.chips, self.config.evo_rqmt)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        if not from_debuff then
        ease_hands_played(card.ability.extra.hands)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        pokermon.ease_hands_played(-card.ability.extra.hands)
    end,
    attributes = {"starter", "hands", "passive", "chips", "scaling", "scaling_evo"},
}

local quaquaval = {
    name = "quaquaval",
    pos = {x = 26, y = 60},
    config = {extra = {chips = 0, chip_mod = 10, hands = 1}},
    loc_vars = function(self, info_queue, center)
        return{vars = {center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.hands}}
    end,
    rarity = "poke_safari",
    cost = 8,
    stage = "One",
    ptype = "Water",
    atlas = "AtlasJokersBasicNatdex",
    gen = 9,
    starter = true,
    perishable_compat = false,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.before and not context.blueprint and #context.full_hand == 5 then
            if #context.scoring_hand >= 5 then
                SMODS.scale_card(card, {
                    ref_value = "chips",
                    scalar_value = "chip_mod",
                    no_message = true,
                })
            end
            SMODS.scale_card(card, {
                ref_value = "chips",
                scalar_value = "chip_mod",
                message_colour = G.C.CHIPS,
            })

        end
        if context.joker_main then
            return{
                chips = card.ability.extra.chips
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        if not from_debuff then
        ease_hands_played(card.ability.extra.hands)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hands
        pokermon.ease_hands_played(-card.ability.extra.hands)
    end,
    attributes = {"starter", "hands", "passive", "chips", "scaling"},
}

return {
    config_key = "Quaxly_line",
    list = {quaxly, quaxwell, quaquaval},
}