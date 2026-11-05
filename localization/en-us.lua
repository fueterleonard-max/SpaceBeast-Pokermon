return {
    descriptions = {
        Joker = {
            j_pokespace_hatenna = {
                name = "Hatenna",
                text = {
                    "{C:mult}+#1#{} mult",
                    "{C:attention}Tripled{} if a {C:tarot}tarot{} card",
                    "has been used this ante",
                    "{C:inactive,s:0.8}(Evolves after using {C:attention}#2#{C:inactive,s:0.8} unique tarot card)",
                }
            },
            j_pokespace_hattrem = {
                name = "Hattrem",
                text = {
                    "Create a copy of the first {C:tarot}tarot{}", 
                    "card used this ante",
                    "{br:2}ERROR - CONTACT STEAK",
                    "{C:mult}+#1#{} mult per {C:tarot}tarot{} card",
                    "used this run",
                    "{C:inactive,s:0.8}(Evolves at {C:mult,s:0.8}+#2#{C:inactive,s:0.8} / +20 Mult)",
                }
            },
            j_pokespace_hatterene = {
                name = "Hatterene",
                text = {
                    "Create a copy of the first {C:tarot}tarot{}",
                    "card used this round",
                    "{br:2}ERROR - CONTACT STEAK",
                    "{X:mult,C:white}X#1#{} Mult per {C:tarot}tarot{} card",
                    "used this run",
                    "{C:inactive,s:0.8}(Currently {X:mult,C:white}X#2#{C:inactive,s:0.8} Mult)"

                }
            },
            j_pokespace_sprigatito = {
                name = "Sprigatito",
                text = {
                    "{C:attention}+#3#{} hand size",
                    "Get {C:money}$#1#{} at end of round",
                    "if {C:attention}5{} cards remaining in hand",
                    "{C:inactive,s:0.8}(Evolves after earning {C:money,s:0.8}#2#${C:inactive,s:0.8})",
                }
            },
            j_pokespace_floragato = {
                name = "Floragato",
                text = {
                    "{C:attention}+#3#{} hand size",
                    "Get {C:money}$#1#{} at end of round",
                    "if {C:attention}5{} cards remaining in hand",
                    "{C:inactive,s:0.8}(Evolves after earning {C:money,s:0.8}#2#${C:inactive,s:0.8})",
                }
            },
            j_pokespace_meowscarada = {
                name = "Meowscarada",
                text = {
                    "{C:attention}+#2#{} hand size",
                    "Earn {C:money}$#1#{} at end of round",
                    "Increase payout by {C:money}$#3#{} if {C:attention}5{} cards",
                    "remain in hand at end of round",
                    
                }
            },
            j_pokespace_fuecoco = {
                name = "Fuecoco",
                text = {
                    "{C:red}+#1#{} discard",
                    "Gains {C:mult}+#3#{} Mult if",
                    "discard contains {C:attention}5{} card",
                    "{C:inactive,s:0.8}(Evolves at {C:mult,s:0.8}+#2#{C:inactive,s:0.8} / +16 Mult)",
                } 
            },

            j_pokespace_crocalor = {
                name = "Crocalor",
                text = {
                    "{C:red}+#1#{} discard",
                    "Gains {C:mult}+#3#{} Mult if",
                    "discard contains {C:attention}5{} card",
                    "{C:inactive,s:0.8}(Evolves at {C:mult,s:0.8}+#2#{C:inactive,s:0.8} / +40 Mult)",
                }
            },

            j_pokespace_skeledirge = {
                name = "Skeledirge",
                text = {
                    "{C:red}+#1#{} discard",
                    "Gains {C:mult}+#3#{} Mult and {X:mult,C:white}X#5#{}",
                    "Mult if discard contains {C:attention}5{} card",
                    "{C:inactive}(Reset {X:mult,C:white}Xmult{}{C:inactive} at end of {C:inactive}{C:attention}Boss Blind{}{C:inactive})",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult, {X:mult,C:white}X#4#{C:inactive} Mult)",
                }
            },

            j_pokespace_quaxly = {
                name = "Quaxly",
                text = {
                    "{C:blue}+#3#{} hand",
                    "Gains {C:chips}+#2#{} Chips if played hand",
                    "contains {C:attention}5{} cards",
                    "{C:inactive,s:0.8}(Evolves at {C:chips,s:0.8}+#1#{C:inactive,s:0.8} / +32 Chips)",

                }
            },
            j_pokespace_quaxwell = {
                name = "Quaxwell",
                text = {
                    "{C:blue}+#3#{} hand",
                    "Gains {C:chips}+#2#{} Chips if played hand",
                    "contains {C:attention}5{} cards",
                    "{C:inactive,s:0.8}(Evolves at {C:chips,s:0.8}+#1#{C:inactive,s:0.8} / +80 Chips)",

                }
            },
            j_pokespace_quaquaval = {
                name = "Quaquaval",
                text = {
                    "{C:blue}+#3#{} hand",
                    "Gains {C:chips}+#2#{} Chips if played hand",
                    "contains {C:attention}5{} cards",
                    "Gains double if all card are scoring",
                    "{C:inactive,s:0.8}(Currently {C:chips,s:0.8}+#1#{C:inactive,s:0.8} Chips)",

                }
            },

        }
    },
    misc = {
        dictionary = {
            pokespace_torchsong_ex = "Torch Song!"
        }
    }
}
