local function load_file(file, load_item)
  if file.init then file.init() end
  if file.list then
    for _, item in ipairs(file.list) do
      if file.config_key then
        item.pokespace_config_key = file.config_key
        if pokespace_config[file.config_key] == false then
          item.no_collection = true
        end
      end
      load_item(item)
    end
  end
end

local function load_directory(path, load_item, options)
  options = options or {}
  local files = NFS.getDirectoryItems(SMODS.current_mod.path .. path)

  for _, file_name in ipairs(files) do
    local full = SMODS.current_mod.path .. path .. '/' .. file_name
    local file_type = NFS.getInfo(full).type

    if file_type == "directory" then
      load_directory(path .. '/' .. file_name, load_item, options)
    elseif file_type ~= "symlink" then
      local file = assert(SMODS.load_file(path .. '/' .. file_name))()

      if type(file) == 'table' and file.can_load ~= false then
        if options.pre_load then options.pre_load(file) end
        load_file(file, load_item)
        if options.post_load then options.post_load(file) end
      end
    end
  end
end

local function load_pokemon(item)
  local custom_prefix = "pokespace"
  local custom_atlas = item.atlas and string.find(item.atlas, "pokespace")
  if not item.atlas then
    pokermon.sprites.load_atlas(item)
    pokermon.sprites.load_sprites(item)
  end
  pokermon.Pokemon(item, custom_prefix, custom_atlas)
end


local function load_pokemon_family(file)
  if not file.list then return end
  local names = POKESPACE.utils.map_list(file.list, function(a) return a.name end)
  if file.family and #file.family > 1 then
    pokermon.add_family(file.family)
  elseif file.no_family then

  elseif #names > 1 then
    pokermon.add_family(names)
  end
end

return load_directory, {
  load_pokemon = load_pokemon,
  load_pokemon_family = load_pokemon_family,
}