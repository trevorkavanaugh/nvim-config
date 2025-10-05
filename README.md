# Neovim 0.12.x IDE Config

A modern, IDE‑like Neovim setup targeting **Neovim 0.12.x**. It mirrors a classic Vim workflow (FZF → Telescope, NERDTree → Neo‑tree, Tagbar → Aerial, Airline → Lualine, GitGutter → Gitsigns, CoC → native LSP + nvim‑cmp, ALE → Trouble/linters/formatters) while embracing Neovim’s built‑in LSP and current best practices.

---

## Highlights

- **Plugin manager:** `lazy.nvim`, split into focused modules.
- **Colors:** Modus (dark) — `modus‑vivendi` — loaded eagerly for glitch‑free startup.
- **Explorer & Symbols:** Neo‑tree on the left; Aerial outline on demand (or auto‑open if enabled).
- **Search & Projects:** Telescope with FZF native accelerator, Project.nvim integration, and persistent clipboard history (Neoclip + SQLite).
- **LSP (new API):** Uses `vim.lsp.config()` + `vim.lsp.enable()`; `ts_ls` replaces deprecated `tsserver`, with a Deno coexistence guard.
- **Formatting & Linting:** Conform (formatters), None‑LS (eslint_d diagnostics via extras), and nvim‑lint (Ruff) for fast, lightweight linting.
- **UI polish:** Lualine, Bufferline, Indent guides (`ibl`), Dropbar breadcrumbs, Modicator (mode‑colored line numbers), Toggleterm, Notify.
- **Git:** Gitsigns + Fugitive.
- **Sessions:** Persistence.nvim for frictionless session restore.

---

## Layout

```
~/.config/nvim
├── init.lua
├── lua
│  ├── config
│  │  ├── init-options.lua   # pre‑lazy: leaders, providers, early UI
│  │  ├── options.lua        # post‑lazy: editor behavior & look
│  │  ├── keymaps.lua        # core mappings
│  │  └── autocmds.lua       # yank highlight, checktime, startup hooks
│  └── plugins
│     ├── core.lua           # dashboard, which‑key, plenary
│     ├── ui.lua             # lualine, bufferline, notify, themes, etc.
│     ├── files.lua          # neo‑tree
│     ├── telescope.lua      # telescope + fzf + projects + neoclip
│     ├── treesitter.lua     # treesitter + textobjects
│     ├── editing.lua        # surround, comment, autopairs, motions, csv, dial
│     ├── git.lua            # gitsigns + fugitive
│     ├── lsp.lua            # new‑API LSP, conform, none‑ls, aerial
│     ├── cmp.lua            # nvim‑cmp suite
│     ├── diagnostics.lua    # trouble, todo‑comments, nvim‑lint(ruff)
│     └── sessions.lua       # persistence.nvim
└── lazy-lock.json           # auto‑generated
```

---

## Requirements

- **Neovim** ≥ 0.12.x
- **Build tools** for native plugins (`make`, C toolchain)
- **Node provider** (optional, for some tools):
  ```bash
  npm i -g neovim
  ```
- **Python provider** (recommended): create a tiny venv and point Neovim at it
  ```bash
  python3 -m venv ~/.venvs/nvim-host
  ~/.venvs/nvim-host/bin/python -m pip install -U pip "pynvim>=0.6.0"
  ```
  In `lua/config/init-options.lua`:
  ```lua
  vim.g.python3_host_prog = vim.fn.expand('~/.venvs/nvim-host/bin/python')
  ```
- (Optional) **SQLite** for Neoclip persistence is pulled via `kkharji/sqlite.lua`.

---

## Install & First Run

1. Put this repo at `~/.config/nvim`.
2. Start Neovim once: `nvim` → lazy.nvim bootstraps and installs plugins.
3. Open `:Mason` to confirm tools (LSPs/formatters/linters) are installed:
   - `lua-language-server`, `typescript-language-server`, `pyright`, etc.
   - `prettier`, `stylua`, `black`, `isort`, `shfmt`, `eslint_d`, `ruff`
4. Health check: `:checkhealth` (Python/Node providers should be green).

---

## Colorscheme

- Theme plugin: `ishan9299/modus-theme-vim` (loaded eagerly with high priority).
- Default scheme is **`modus-vivendi`** (dark). It’s applied post‑lazy (in `options.lua`).

Switch on the fly:
```vim
:colorscheme modus-operandi   " light
:colorscheme kanagawa         " alt theme (installed)
```

---

## Plugins (by module)

### Core
- `folke/which-key.nvim`
- `nvimdev/dashboard-nvim`
- `nvim-lua/plenary.nvim`

### UI
- `nvim-lualine/lualine.nvim`
- `lukas-reineke/indent-blankline.nvim` (IBL)
- `nvim-tree/nvim-web-devicons`
- `akinsho/bufferline.nvim` + `moll/vim-bbye`
- `mawkler/modicator.nvim`
- `Bekaboo/dropbar.nvim` + `SmiteshP/nvim-navic`
- `rcarriga/nvim-notify` (wired to `vim.notify`)
- `akinsho/toggleterm.nvim`
- Themes: `ishan9299/modus-theme-vim` (default), `rebelot/kanagawa.nvim`
- Status: `j-hui/fidget.nvim`

### Files
- `nvim-neo-tree/neo-tree.nvim` (+ nui, devicons, plenary)

### Finder & Projects
- `nvim-telescope/telescope.nvim` + `telescope-fzf-native.nvim`
- `ahmedkhalf/project.nvim` (Telescope “Projects” extension)
- `AckslD/nvim-neoclip.lua` + `kkharji/sqlite.lua`

### Treesitter
- `nvim-treesitter/nvim-treesitter` (highlight, indent, textobjects)
  > Note: `vim-polyglot` is intentionally **not** used to avoid overlap.

### Editing
- `kylechui/nvim-surround`, `numToStr/Comment.nvim`, `windwp/nvim-autopairs`
- `dkarter/bullets.vim`, `davidoc/taskpaper.vim`, `NvChad/nvim-colorizer.lua`
- Motions/UX: `rhysd/clever-f.vim`, `ggandor/leap.nvim`, `chrisgrieser/nvim-spider`, `karb94/neoscroll.nvim`
- Tools: `monaqa/dial.nvim`, `hat0uma/csvview.nvim`

### Git
- `lewis6991/gitsigns.nvim`, `tpope/vim-fugitive`

### LSP & Completion
- **LSP core:** `neovim/nvim-lspconfig` (new API usage), `williamboman/mason.nvim`, `williamboman/mason-lspconfig.nvim`, `WhoIsSethDaniel/mason-tool-installer.nvim`
- **Servers enabled:** `lua_ls`, `ts_ls`, `pyright`, `bashls`, `jsonls`, `html`, `cssls` (+ optional `denols` in Deno roots)
- **Completion:** `hrsh7th/nvim-cmp`, `cmp-nvim-lsp`, `cmp-buffer`, `cmp-path`, `saadparwaiz1/cmp_luasnip`, `L3MON4D3/LuaSnip`, `rafamadriz/friendly-snippets`, `lukas-reineke/cmp-under-comparator`, `onsails/lspkind.nvim`
- **Symbols:** `stevearc/aerial.nvim`

### Diagnostics / Format / Lint
- `folke/trouble.nvim`, `folke/todo-comments.nvim`
- **Formatting:** `stevearc/conform.nvim` (Black, isort, Stylua, Prettier, shfmt, etc.)
- **Lint (JS/TS):** `nvimtools/none-ls.nvim` + `nvimtools/none-ls-extras.nvim` (eslint_d diagnostics)
- **Lint (Python):** `mfussenegger/nvim-lint` (Ruff on save/enter)

### Sessions
- `folke/persistence.nvim`

---

## LSP specifics (new API + Deno guard)

- Global caps are applied via:
  ```lua
  vim.lsp.config('*', { capabilities = require('cmp_nvim_lsp').default_capabilities() })
  ```
- TypeScript uses **`ts_ls`** (not deprecated `tsserver`).
- **Deno coexistence:** `ts_ls` is **disabled** in roots containing `deno.json` / `deno.jsonc`; optional `denols` is enabled there.

---

## Keymaps (essentials)

- **Find files:** `<leader>f` or `<C-p>`
- **Live grep:** `<leader>/`
- **Buffers:** `<leader>fb`
- **Explorer:** `<leader>n` (Neo‑tree toggle)
- **Symbols:** `<F8>` (Aerial toggle)
- **Diagnostics:** next/prev = `<C-j>` / `<C-k>`; Trouble UI via `:TroubleToggle`
- **LSP:** `gd` (definition), `gr` (references), `K` (hover), `<leader>rn` (rename), `<leader>ca` (code action)
- **Windows:** `<leader>a` / `<leader>d` (left/right)
- **Buffers:** `<leader>q` / `<leader>e` (prev/next), `:Bdelete` to close without wrecking layout
- **Resize window:** `Alt` + arrows
- **Terminal:** `<C-\>` (toggleterm floating)

(Which‑Key is enabled and will show these under `<leader>`.)

---

## Commands

- **Install/update plugins:** `:Lazy sync` / `:Lazy`
- **Install/update tools:** `:Mason`
- **LSP info:** `:LspInfo`
- **Treesitter:** `:TSUpdate`
- **Format now:** `:lua require('conform').format({async=false})`
- **Toggle diagnostics UI:** `:TroubleToggle`
- **Project picker:** `<leader>fp` (Telescope projects)

---

## Troubleshooting & Health

- **Providers:** set Python host in `init-options.lua` and install `pynvim>=0.6.0`. Optionally install Node provider via `npm i -g neovim`.
- **Health:** `:checkhealth` should show all green for providers and major subsystems.
- **JS/TS diagnostics:** eslint_d sources come from **none‑ls‑extras**; ensure `eslint_d` is installed via Mason.

---

## Notes & Decisions

- `vim-polyglot` is intentionally **not** included to avoid overlap/conflicts with Treesitter.
- `ts_ls` replaces the deprecated `tsserver` in lspconfig.
- None‑LS only provides **eslint_d diagnostics** here (no code_actions). Python linting is handled by **nvim‑lint (Ruff)**; formatting by **Conform**.

---

## License

MIT — see `LICENSE` (or choose your own).
