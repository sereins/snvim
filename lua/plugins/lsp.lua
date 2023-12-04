-- 补全的语言服务
return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "Neoconf" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        -- 帮助我们安装每个语言的 ls
        "williamboman/mason.nvim",
        -- 用一个list 作为每个语言配置配置
        "williamboman/mason-lspconfig",
        -- 通过json配置lsp
        "folke/neoconf.nvim",
        "folke/neodev.nvim",
        -- 右下角加载提示
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
        },
        -- 美化lsp的插件为了 好看
        "nvimdev/lspsaga.nvim",
    },
    config = function()
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            },
            jsonls = {},
            intelephense = {},
            rust_analyzer = {
                cargo = { allFuture = true }
            },
        }
        local on_attach = function(_, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
            nmap('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
            nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
            nmap('gi', require "telescope.builtin".lsp_implementations, '[G]oto [I]mplementation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[R]e[n]ame')
            nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
            nmap('<leader>da', require "telescope.builtin".diagnostics, '[D]i[A]gnostics')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap("<space>f", function()
                vim.lsp.buf.format { async = true }
            end, "[F]ormat code")
        end
        require("neoconf").setup()
        require("neodev").setup()
        require("fidget").setup()
        require("lspsaga").setup()
        require("mason").setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        for server, config in pairs(servers) do
            require("lspconfig")[server].setup(
                vim.tbl_deep_extend("keep",
                    {
                        on_attach = on_attach,
                        capabilities = capabilities
                    },
                    config
                )
            )
        end
    end
}
