==============================================================================
conform: ✅

conform.nvim report ~

- Log file: /home/owentheoracle/.local/state/nvim/conform.log

==============================================================================
fidget: ✅

fidget.setup ~

- ✅ OK All user-specified options are known and accounted for

fidget.integration ~

fidget.progress ~

- ✅ OK Using LspProgress handler implementation
- ✅ OK Option 'progress.lsp.progress_ringbuf_size' is 0, using default size

fidget.notification ~

- ℹ️ INFO vim.notify() is not set to fidget.notify()
- ℹ️ INFO Rendering notifications for regular UI (e.g., nvim TUI)

==============================================================================
lazy: ✅

lazy.nvim ~

- {lazy.nvim} version `11.17.1`
- ✅ OK {git} `version 2.43.0`
- ✅ OK no existing packages found by other package managers
- ✅ OK packer_compiled.lua not found

luarocks ~

- checking `luarocks` installation
- ✅ OK no plugins require `luarocks`, so you can ignore any warnings below
- ✅ OK {luarocks} `/usr/bin/luarocks 3.8.0`
- ✅ OK {lua5.1} `Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio`

==============================================================================
lspconfig: ✅

- Skipped. This healthcheck is redundant with `:checkhealth vim.lsp`.

==============================================================================
luasnip: ✅

luasnip ~

- ✅ OK jsregexp is installed

==============================================================================
mason: 8 ⚠️

mason.nvim ~

- ✅ OK mason.nvim version v2.1.0
- ✅ OK PATH: prepend
- ✅ OK Providers:
  mason.providers.registry-api
  mason.providers.client
- ✅ OK neovim version >= 0.10.0

mason.nvim [Registries] ~

- ✅ OK Registry `github.com/mason-org/mason-registry version: 2025-10-05-elated-result` is installed.

mason.nvim [Core utils] ~

- ✅ OK unzip: `UnZip 6.00 of 20 April 2009, by Debian. Original by Info-ZIP.`
- ✅ OK wget: `GNU Wget 1.21.4, a non-interactive network retriever.`
- ✅ OK curl: `curl 8.5.0 (x86_64-pc-linux-gnu) libcurl/8.5.0 OpenSSL/3.0.13 zlib/1.3 brotli/1.1.0 zstd/1.5.5 libidn2/2.3.7 libpsl/0.21.2 (+libidn2/2.3.7) libssh/0.10.6/openssl/zlib nghttp2/1.59.0 librtmp/2.3 OpenLDAP/2.6.7`
- ✅ OK gzip: `gzip 1.12`
- ✅ OK tar: `tar (GNU tar) 1.35`
- ✅ OK bash: `GNU bash, version 5.2.21(1)-release (x86_64-pc-linux-gnu)`
- ✅ OK sh: `Ok`

mason.nvim [Languages] ~

- ⚠️ WARNING Go: not available
  - ADVICE:
    - spawn: go failed with exit code - and signal -. Could not find executable "go" in PATH.

- ⚠️ WARNING cargo: not available
  - ADVICE:
    - spawn: cargo failed with exit code - and signal -. Could not find executable "cargo" in PATH.

- ⚠️ WARNING Composer: not available
  - ADVICE:
    - spawn: composer failed with exit code - and signal -. Could not find executable "composer" in PATH.

- ⚠️ WARNING PHP: not available
  - ADVICE:
    - spawn: php failed with exit code - and signal -. Could not find executable "php" in PATH.

- ✅ OK RubyGem: `3.4.20`
- ⚠️ WARNING javac: not available
  - ADVICE:
    - spawn: javac failed with exit code - and signal -. Could not find executable "javac" in PATH.

- ⚠️ WARNING java: not available
  - ADVICE:
    - spawn: java failed with exit code - and signal -. Could not find executable "java" in PATH.

- ⚠️ WARNING julia: not available
  - ADVICE:
    - spawn: julia failed with exit code - and signal -. Could not find executable "julia" in PATH.

- ✅ OK Ruby: `ruby 3.2.3 (2024-01-18 revision 52bb2ac0a6) [x86_64-linux-gnu]`
- ✅ OK luarocks: `/usr/bin/luarocks 3.8.0`
- ✅ OK node: `v18.19.1`
- ✅ OK python: `Python 3.12.3`
- ⚠️ WARNING pip: not available
  - ADVICE:
    - spawn: python3 failed with exit code 1 and signal 0. /usr/bin/python3: No module named pip

- ✅ OK python venv: `Ok`
- ✅ OK npm: `9.2.0`

==============================================================================
mason-lspconfig: ✅

mason-lspconfig.nvim ~

- ✅ OK Neovim v0.11
- ✅ OK mason.nvim v2

==============================================================================
null-ls: ✅

- ✅ OK stylua: the command "stylua" is executable.
- ✅ OK prettier: the command "prettier" is executable.
- ✅ OK black: the command "black" is executable.
- ✅ OK isort: the command "isort" is executable.
- ✅ OK shfmt: the command "shfmt" is executable.
- ✅ OK eslint_d: the command "eslint_d" is executable.

==============================================================================
nvim-treesitter: 1 ⚠️

Installation ~

- ⚠️ WARNING `tree-sitter` executable not found (parser generator, only needed for :TSInstallFromGrammar, not required for :TSInstall)
- ✅ OK `node` found v18.19.1 (only needed for :TSInstallFromGrammar)
- ✅ OK `git` executable found.
- ✅ OK `cc` executable found. Selected from { vim.NIL, "cc", "gcc", "clang", "cl", "zig" }
  Version: cc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
- ✅ OK Neovim was compiled with tree-sitter runtime ABI version 15 (required >=13). Parsers must be compatible with runtime ABI.

OS Info:
{
machine = "x86_64",
release = "6.6.87.2-microsoft-standard-WSL2",
sysname = "Linux",
version = "#1 SMP PREEMPT_DYNAMIC Thu Jun 5 18:30:46 UTC 2025"
} ~

Parser/Features H L F I J

- bash ✓ ✓ ✓ . ✓
- css ✓ . ✓ ✓ ✓
- html ✓ ✓ ✓ ✓ ✓
- javascript ✓ ✓ ✓ ✓ ✓
- json ✓ ✓ ✓ ✓ .
- lua ✓ ✓ ✓ ✓ ✓
- markdown ✓ . ✓ ✓ ✓
- markdown_inline ✓ . . . ✓
- python ✓ ✓ ✓ ✓ ✓
- regex ✓ . . . .
- toml ✓ ✓ ✓ ✓ ✓
- typescript ✓ ✓ ✓ ✓ ✓
- vim ✓ ✓ ✓ . ✓
- vimdoc ✓ . . . ✓
- yaml ✓ ✓ ✓ ✓ ✓

Legend: H[ighlight], L[ocals], F[olds], I[ndents], In[j]ections
+) multiple parsers found, only one will be used
x) errors found in the query, try to run :TSUpdate {lang} ~

==============================================================================
vim.deprecated: ✅

- ✅ OK No deprecated functions detected

==============================================================================
vim.health: ✅

Configuration ~

- ✅ OK no issues found

Runtime ~

- ✅ OK $VIMRUNTIME: /usr/share/nvim/runtime

Performance ~

- ✅ OK Build type: RelWithDebInfo

Remote Plugins ~

- ✅ OK Up to date

terminal ~

- key_backspace (kbs) terminfo entry: `key_backspace=\177`
- key_dc (kdch1) terminfo entry: `key_dc=\E[3~`

External Tools ~

- ✅ OK ripgrep 14.1.0 (/usr/bin/rg)
- ✅ OK git version 2.43.0 (/usr/bin/git)
- ✅ OK curl 8.5.0 (/usr/bin/curl)
  Release-Date: 2023-12-06, security patched: 8.5.0-2ubuntu10.6
  Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp
  Features: alt-svc AsynchDNS brotli GSS-API HSTS HTTP2 HTTPS-proxy IDN IPv6 Kerberos Largefile libz NTLM PSL SPNEGO SSL threadsafe TLS-SRP UnixSockets zstd

==============================================================================
vim.lsp: ✅

- LSP log level : WARN
- Log path: /home/owentheoracle/.local/state/nvim/lsp.log
- Log size: 17 KB

vim.lsp: Active Features ~

vim.lsp: Active Clients ~

- No active clients

vim.lsp: Enabled Configurations ~

- bashls:
  - capabilities: {
    textDocument = {
    completion = {
    completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    insertReplaceSupport = true,
    insertTextModeSupport = {
    valueSet = { 1, 2 }
    },
    labelDetailsSupport = true,
    preselectSupport = true,
    resolveSupport = {
    properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
    },
    snippetSupport = true,
    tagSupport = {
    valueSet = { 1 }
    }
    },
    completionList = {
    itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
    },
    contextSupport = true,
    dynamicRegistration = false,
    insertTextMode = 1
    }
    }
    }
  - cmd: { "bash-language-server", "start" }
  - filetypes: bash, sh
  - root_markers: { ".git" }
  - settings: {
    bashIde = {
    globPattern = "\*@(.sh|.inc|.bash|.command)"
    }
    }

- cssls:
  - capabilities: {
    textDocument = {
    completion = {
    completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    insertReplaceSupport = true,
    insertTextModeSupport = {
    valueSet = { 1, 2 }
    },
    labelDetailsSupport = true,
    preselectSupport = true,
    resolveSupport = {
    properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
    },
    snippetSupport = true,
    tagSupport = {
    valueSet = { 1 }
    }
    },
    completionList = {
    itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
    },
    contextSupport = true,
    dynamicRegistration = false,
    insertTextMode = 1
    }
    }
    }
  - cmd: { "vscode-css-language-server", "--stdio" }
  - filetypes: css, scss, less
  - init_options: {
    provideFormatter = true
    }
  - root_markers: { "package.json", ".git" }
  - settings: {
    css = {
    validate = true
    },
    less = {
    validate = true
    },
    scss = {
    validate = true
    }
    }

- denols:
  - capabilities: {
    textDocument = {
    completion = {
    completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    insertReplaceSupport = true,
    insertTextModeSupport = {
    valueSet = { 1, 2 }
    },
    labelDetailsSupport = true,
    preselectSupport = true,
    resolveSupport = {
    properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
    },
    snippetSupport = true,
    tagSupport = {
    valueSet = { 1 }
    }
    },
    completionList = {
    itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
    },
    contextSupport = true,
    dynamicRegistration = false,
    insertTextMode = 1
    }
    }
    }
  - cmd: { "deno", "lsp" }
  - cmd_env: {
    NO_COLOR = true
    }
  - filetypes: javascript, javascriptreact, javascript.jsx, typescript, typescriptreact, typescript.tsx
  - handlers: {
    ["textDocument/definition"] = <function 1>,
    ["textDocument/references"] = <function 1>,
    ["textDocument/typeDefinition"] = <function 1>
    }
  - init_options: {
    lint = true,
    unstable = true
    }
  - on_attach: <function @/home/owentheoracle/.local/share/nvim/lazy/nvim-lspconfig/lsp/denols.lua:96>
  - root_dir: <function @/home/owentheoracle/.local/share/nvim/lazy/nvim-lspconfig/lua/lspconfig/util.lua:32>
  - root_markers: { "deno.json", "deno.jsonc", ".git" }
  - settings: {
    deno = {
    enable = true,
    suggest = {
    imports = {
    hosts = {
    ["https://deno.land"] = true
    }
    }
    }
    }
    }

- html:
  - capabilities: {
    textDocument = {
    completion = {
    completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    insertReplaceSupport = true,
    insertTextModeSupport = {
    valueSet = { 1, 2 }
    },
    labelDetailsSupport = true,
    preselectSupport = true,
    resolveSupport = {
    properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
    },
    snippetSupport = true,
    tagSupport = {
    valueSet = { 1 }
    }
    },
    completionList = {
    itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
    },
    contextSupport = true,
    dynamicRegistration = false,
    insertTextMode = 1
    }
    }
    }
  - cmd: { "vscode-html-language-server", "--stdio" }
  - filetypes: html, templ
  - init_options: {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
    css = true,
    javascript = true
    },
    provideFormatter = true
    }
  - root_markers: { "package.json", ".git" }
  - settings: {}

- jsonls:
  - capabilities: {
    textDocument = {
    completion = {
    completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    insertReplaceSupport = true,
    insertTextModeSupport = {
    valueSet = { 1, 2 }
    },
    labelDetailsSupport = true,
    preselectSupport = true,
    resolveSupport = {
    properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
    },
    snippetSupport = true,
    tagSupport = {
    valueSet = { 1 }
    }
    },
    completionList = {
    itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
    },
    contextSupport = true,
    dynamicRegistration = false,
    insertTextMode = 1
    }
    }
    }
  - cmd: { "vscode-json-language-server", "--stdio" }
  - filetypes: json, jsonc
  - init_options: {
    provideFormatter = true
    }
  - root_markers: { ".git" }

- lua_ls:
  - capabilities: {
    textDocument = {
    completion = {
    completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    insertReplaceSupport = true,
    insertTextModeSupport = {
    valueSet = { 1, 2 }
    },
    labelDetailsSupport = true,
    preselectSupport = true,
    resolveSupport = {
    properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
    },
    snippetSupport = true,
    tagSupport = {
    valueSet = { 1 }
    }
    },
    completionList = {
    itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
    },
    contextSupport = true,
    dynamicRegistration = false,
    insertTextMode = 1
    }
    }
    }
  - cmd: { "lua-language-server" }
  - filetypes: lua
  - root_markers: { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" }
  - settings: {
    Lua = {
    diagnostics = {
    globals = { "vim" }
    },
    workspace = {
    checkThirdParty = false
    }
    }
    }

- pyright:
  - capabilities: {
    textDocument = {
    completion = {
    completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    insertReplaceSupport = true,
    insertTextModeSupport = {
    valueSet = { 1, 2 }
    },
    labelDetailsSupport = true,
    preselectSupport = true,
    resolveSupport = {
    properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
    },
    snippetSupport = true,
    tagSupport = {
    valueSet = { 1 }
    }
    },
    completionList = {
    itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
    },
    contextSupport = true,
    dynamicRegistration = false,
    insertTextMode = 1
    }
    }
    }
  - cmd: { "pyright-langserver", "--stdio" }
  - filetypes: python
  - on_attach: <function @/home/owentheoracle/.local/share/nvim/lazy/nvim-lspconfig/lsp/pyright.lua:45>
  - root_markers: { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" }
  - settings: {
    python = {
    analysis = {
    autoSearchPaths = true,
    diagnosticMode = "openFilesOnly",
    useLibraryCodeForTypes = true
    }
    }
    }

- ts_ls:
  - capabilities: {
    textDocument = {
    completion = {
    completionItem = {
    commitCharactersSupport = true,
    deprecatedSupport = true,
    insertReplaceSupport = true,
    insertTextModeSupport = {
    valueSet = { 1, 2 }
    },
    labelDetailsSupport = true,
    preselectSupport = true,
    resolveSupport = {
    properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
    },
    snippetSupport = true,
    tagSupport = {
    valueSet = { 1 }
    }
    },
    completionList = {
    itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
    },
    contextSupport = true,
    dynamicRegistration = false,
    insertTextMode = 1
    }
    }
    }
  - cmd: { "typescript-language-server", "--stdio" }
  - commands: {
    ["editor.action.showReferences"] = <function 1>
    }
  - filetypes: javascript, javascriptreact, javascript.jsx, typescript, typescriptreact, typescript.tsx
  - handlers: {
    ["_typescript.rename"] = <function 1>
    }
  - init_options: {
    hostInfo = "neovim"
    }
  - on_attach: <function @/home/owentheoracle/.local/share/nvim/lazy/nvim-lspconfig/lsp/ts_ls.lua:111>
  - root_dir: <function @/home/owentheoracle/.config/nvim/lua/plugins/lsp.lua:84>
  - single_file_support: false

vim.lsp: File Watcher ~

- file watching "(workspace/didChangeWatchedFiles)" disabled on all clients

vim.lsp: Position Encodings ~

- No active clients

==============================================================================
vim.provider: 6 ⚠️

Clipboard (optional) ~

- ✅ OK Clipboard tool found: xsel

Node.js provider (optional) ~

- Node.js: 18.19.1
- ⚠️ WARNING Missing "neovim" npm (or yarn, pnpm) package.
  - ADVICE:
    - Run in shell: npm install -g neovim
    - Run in shell (if you use yarn): yarn global add neovim
    - Run in shell (if you use pnpm): pnpm install -g neovim
    - You may disable this provider (and warning) by adding `let g:loaded_node_provider = 0` to your init.vim

Perl provider (optional) ~

- ⚠️ WARNING "Neovim::Ext" cpan module is not installed
  - ADVICE:
    - See :help |provider-perl| for more information.
    - You can disable this provider (and warning) by adding `let g:loaded_perl_provider = 0` to your init.vim
- ⚠️ WARNING No usable perl executable found

Python 3 provider (optional) ~

- ⚠️ WARNING No Python executable found that can `import neovim`. Using the first available executable for diagnostics.
- ⚠️ WARNING Could not load Python :
  /usr/bin/python3 does not have the "neovim" module.
  python3.13 not found in search path or not executable.
  /usr/bin/python3.12 does not have the "neovim" module.
  python3.11 not found in search path or not executable.
  python3.10 not found in search path or not executable.
  python3.9 not found in search path or not executable.
  python not found in search path or not executable.
  - ADVICE:
    - See :help |provider-python| for more information.
    - You can disable this provider (and warning) by adding `let g:loaded_python3_provider = 0` to your init.vim
- Executable: Not found

Python virtualenv ~

- ✅ OK no $VIRTUAL_ENV

Ruby provider (optional) ~

- Ruby: 3.2.3
- ⚠️ WARNING `neovim-ruby-host` not found.
  - ADVICE:
    - Run `gem install neovim` to ensure the neovim RubyGem is installed.
    - Run `gem environment` to ensure the gem bin directory is in $PATH.
    - If you are using rvm/rbenv/chruby, try "rehashing".
    - See :help |g:ruby_host_prog| for non-standard gem installations.
    - You can disable this provider (and warning) by adding `let g:loaded_ruby_provider = 0` to your init.vim

==============================================================================
vim.treesitter: ✅

Treesitter features ~

- Treesitter ABI support: min 13, max 15
- WASM parser support: false

Treesitter parsers ~

- ✅ OK Parser: bash ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/bash.so
- ✅ OK Parser: css ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/css.so
- ✅ OK Parser: html ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/html.so
- ✅ OK Parser: javascript ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/javascript.so
- ✅ OK Parser: json ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/json.so
- ✅ OK Parser: lua ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/lua.so
- ✅ OK Parser: markdown ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/markdown.so
- ✅ OK Parser: markdown_inline ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/markdown_inline.so
- ✅ OK Parser: python ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/python.so
- ✅ OK Parser: regex ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/regex.so
- ✅ OK Parser: toml ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/toml.so
- ✅ OK Parser: typescript ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/typescript.so
- ✅ OK Parser: vim ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/vim.so
- ✅ OK Parser: vimdoc ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/vimdoc.so
- ✅ OK Parser: yaml ABI: 14, path: /home/owentheoracle/.local/share/nvim/lazy/nvim-treesitter/parser/yaml.so

==============================================================================
which-key: 10 ⚠️

- ✅ OK Most of these checks are for informational purposes only.
  WARNINGS should be treated as a warning, and don't necessarily indicate a problem with your config.
  Please |DON'T| report these warnings as an issue.

Checking your config ~

- ⚠️ WARNING |mini.icons| is not installed
- ✅ OK |nvim-web-devicons| is installed

Checking for issues with your mappings ~

- ✅ OK No issues reported

checking for overlapping keymaps ~

- ⚠️ WARNING In mode `n`, <d> overlaps with <ds>:
  - <d>: Diff
  - <ds>: Delete a surrounding pair
- ⚠️ WARNING In mode `n`, <c> overlaps with <cS>, <cs>:
  - <c>: Check for updates and show the log (git fetch)
  - <cS>: Change a surrounding pair, putting replacements on new lines
  - <cs>: Change a surrounding pair
- ⚠️ WARNING In mode `n`, <<Space>f> overlaps with <<Space>fb>, <<Space>fp>:
  - <<Space>f>: Find Files
  - <<Space>fb>: Buffers
  - <<Space>fp>: Projects
- ⚠️ WARNING In mode `n`, <ys> overlaps with <yss>:
  - <ys>: Add a surrounding pair around a motion (normal mode)
  - <yss>: Add a surrounding pair around the current line (normal mode)
- ⚠️ WARNING In mode `n`, <yS> overlaps with <ySS>:
  - <yS>: Add a surrounding pair around a motion, on new lines (normal mode)
  - <ySS>: Add a surrounding pair around the current line, on new lines (normal mode)
- ⚠️ WARNING In mode `n`, <gc> overlaps with <gco>, <gcc>, <gcO>, <gcA>:
  - <gc>: Comment toggle linewise
  - <gco>: Comment insert below
  - <gcc>: Comment toggle current line
  - <gcO>: Comment insert above
  - <gcA>: Comment insert end of line
- ⚠️ WARNING In mode `n`, <gb> overlaps with <gbc>:
  - <gbc>: Comment toggle current block
- ⚠️ WARNING In mode `n`, <gr> overlaps with <gri>, <grn>, <grt>, <grr>, <gra>:
  - <gr>: References
  - <gri>: vim.lsp.buf.implementation()
  - <grn>: vim.lsp.buf.rename()
  - <grt>: vim.lsp.buf.type_definition()
  - <grr>: vim.lsp.buf.references()
  - <gra>: vim.lsp.buf.code_action()
- ⚠️ WARNING In mode `x`, <i> overlaps with <in>:
  - <i>: Install a plugin
  - <in>: vim.lsp.buf.selection_range(-vim.v.count1)
- ✅ OK Overlapping keymaps are only reported for informational purposes.
  This doesn't necessarily mean there is a problem with your config.

Checking for duplicate mappings ~

- ✅ OK No duplicate mappings found
