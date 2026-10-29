POKESPACE = {}



pokespace_config = SMODS.current_mod.config
mod_dir = '' .. SMODS.current_mod.path

if (SMODS.Mods["Pokermon"] or {}).can_load then
  pokermon_config = SMODS.Mods["Pokermon"].config
end


assert(SMODS.load_file("src/functions.lua"))()


local load_directory, item_loader = assert(SMODS.load_file("src/loader.lua"))()


load_directory("pokemon", item_loader.load_pokemon, {
  post_load = item_loader.load_pokemon_family,
})