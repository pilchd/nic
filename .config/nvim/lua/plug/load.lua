local function get_specs (metaspecs)
    return vim.iter(metaspecs)
        :map(function (metaspec)
            return metaspec[1]
        end)
        :totable()
end
local function get_meta (metaspecs, plug)
    for _, metaspec in ipairs(metaspecs) do
        local src
        if ("table" == type(metaspec[1]))
            then src = metaspec[1].src
            else src = metaspec[1]
        end

        if plug.spec.src == src then return metaspec end
    end

    return nil
end

return function(...)
    local metaspecs = {...}

    vim.pack.add(get_specs(metaspecs))

    vim.iter(vim.pack.get()):each(function (plug)
        local module_name = plug.spec.data and plug.spec.data.module_name or plug.spec.name
        local meta = get_meta(metaspecs, plug)

        local opts = meta and meta.opts
        local keys = meta and meta.keys
        local init = meta and meta.init

        if type(opts) == "function" then
            opts = opts(require(module_name), plug)
        end
        if type(keys) == "function" then
            keys = keys(require(module_name), plug)
        end

        if opts then
            require(module_name).setup(opts)
        end

        if keys then
            for _, val in ipairs(keys) do
                if type(val) == "string" then
                    vim.cmd(val)
                end
                if type(val) == "table" then
                    vim.keymap.set(unpack(val))
                end
            end
        end

        if init then
            init(require(module_name), plug)
        end
    end)
end
