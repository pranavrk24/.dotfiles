return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      opts = {},
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
      config = function() end,
    },
  },
  keys = {
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
    },
    -- { "<leader>da", function() require("dap").continue({ before = get_args }) end, }, -- get_args function is used from LazyVim to get the arguments
    -- { "<leader>dC", function() require("dap").run_to_cursor() end, },
    -- { "<leader>dg", function() require("dap").goto_() end, },
    -- { "<leader>dj", function() require("dap").down() end, },
    -- { "<leader>dk", function() require("dap").up() end, },
    {
      "<leader>dl",
      function()
        require("dap").run_last()
      end,
    },
    {
      "<leader>dO",
      function()
        require("dap").step_over()
      end,
    },
    {
      "<leader>do",
      function()
        require("dap").step_out()
      end,
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
    },
    -- { "<leader>dp", function() require("dap").pause() end, },
    -- { "<leader>ds", function() require("dap").session() end, },
    -- { "<leader>dw", function() require("dap.ui.widgets").hover() end, },
  },
  config = function()
    -- Golang
    local dap = require("dap")
    dap.adapters.delve = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
      },
    }

    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        showLog = false,
        program = "${file}",
        --[[ dlvToolPath = vim.fn.exepath('~/go/bin/dlv') -- Adjust to where delve is installed ]]
      },
    }

    -- Python
    dap.adapters.python = {
      type = "executable",
      command = os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python3",
      args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return "/usr/bin/python3"
        end,
      },
    }

    -- Rust
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = os.getenv("HOME") .. "/Downloads/codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.rust = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
  end,
}
