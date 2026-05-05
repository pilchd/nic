vim.api.nvim_create_user_command("Zen", function (args)
    local mode = args.fargs[1]

    if "on" == mode or nil == mode and vim.g.pilchd_zen == false then
        print "Namaste..."
        vim.g.pilchd_zen = true
        return
    end
    if "off" == mode or nil == mode and vim.g.pilchd_zen == true then
        print "...and good luck."
        vim.g.pilchd_zen = false
        return
    end

    print "on|off"
end, { nargs = "?" })
