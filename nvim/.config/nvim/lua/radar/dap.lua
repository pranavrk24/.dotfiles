local dap_ok, dap = pcall(require, "dap")
local dapui_ok, dapui = pcall(require, "dapui")
if not dap_ok then
  return
end
if not dapui_ok then
  return
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Golang
dap.adapters.delve = {
  type = 'server',
  port = "${port}",
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
}

dap.configurations.go = {
  {
    type = 'delve',
    name = 'Debug',
    request = 'launch',
    showLog = false,
    program = "${file}",
    --[[ dlvToolPath = vim.fn.exepath('~/go/bin/dlv') -- Adjust to where delve is installed ]]
  },
}

-- Python
dap.adapters.python = {
  type = 'executable',
  command = os.getenv('HOME') .. '/.virtualenvs/debugpy/bin/python3',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return '/usr/bin/python3'
    end,
  },
}

-- Rust
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = os.getenv('HOME') .. '/Downloads/codelldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},
  }
}

dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

-- Ruby
-- dap.adapters.ruby = {
--   type = 'executable';
--   command = 'bundle';
--   args = {'exec', 'readapt', 'stdio'};
-- }
--
-- dap.configurations.ruby = {
--   {
--     type = 'ruby';
--     request = 'launch';
--     name = 'Rails';
--     program = 'bundle';
--     programArgs = {'exec', 'rails', 's'};
--     useBundler = true;
--   },
-- }
