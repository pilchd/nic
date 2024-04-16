local function lsp_setkeys(buffer)
  local options = {
    noremap = true,
    silent = true,
    buffer = buffer,
  }

  vim.keymap.set('n', "<leader>d", vim.diagnostic.open_float, options)
  vim.keymap.set('n', "gCi", vim.lsp.buf.incoming_calls, options)
  vim.keymap.set('n', "gCo", vim.lsp.buf.outgoing_calls, options)
  vim.keymap.set('n', "gd", vim.lsp.buf.definition, options)
  vim.keymap.set('n', "gD", vim.lsp.buf.declaration, options)
  vim.keymap.set('n', "gh", vim.lsp.buf.type_definition, options)
  vim.keymap.set('n', "gi", vim.lsp.buf.implementation, options)
  vim.keymap.set('n', "gr", vim.lsp.buf.references, options)
  vim.keymap.set('n', "<F1>", vim.lsp.buf.signature_help, options)
  vim.keymap.set('n', "<F2>", vim.lsp.buf.rename, options)
  vim.keymap.set('n', "<C-.>", vim.lsp.buf.code_action, options)
end

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"}
    }
  })
}

return {
  {
    "neovim/nvim-lspconfig",

    config = function(lazyPlugin, opts)
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      lspconfig.cssls.setup {
        capabilities = capabilities,
        handlers = handlers,
        init_options = {
          -- Use Prettier via conform.nvim
          provideFormatter = false
        },

        on_attach = function (client, buffer)
          lsp_setkeys(buffer)
        end
      }

      lspconfig.gopls.setup {
        capabilities = capabilities,
        handlers = handlers
      }

      lspconfig.html.setup {
        capabilities = capabilities,
        handlers = handlers,
        init_options = {
          -- Use Prettier via conform.nvim
          provideFormatter = false
        },

        on_attach = function (client, buffer)
          lsp_setkeys(buffer)
        end
      }

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        handlers = handlers,

        on_init = function (client)
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
            return
          end

          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              version = "LuaJIT"
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
              }
            }
          })
        end,
        on_attach = function (client, buffer)
            lsp_setkeys(buffer)
        end,

        settings = {
            Lua = {}
        }
      }

      lspconfig.yamlls.setup {
        capabilities = capabilities,
        handlers = handlers,

        on_attach = function (client, buffer)
          lsp_setkeys(buffer)
        end,

        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"]
                = "./github/workflows/*"
            }
          }
        }
      }
    end
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim"
    },

    opts = {
      handlers = handlers,

      on_attach = function (client, buffer)
        lsp_setkeys(buffer)
      end
    }
  }
}
