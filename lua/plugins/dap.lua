require("dapui").setup()
-- require("dapui").open()
-- require("dapui").close()
-- require("dapui").toggle()

-- autoopen and close ui
local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

if not dap.adapters["codelldb"] then
require("dap").adapters["codelldb"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = {
      "--port",
      "${port}",
    },
  },
}
end
for _, lang in ipairs({ "c", "cpp" }) do
dap.configurations[lang] = {
  {
    type = "codelldb",
    request = "launch",
    name = "Launch file",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
  },
  {
    type = "codelldb",
    request = "attach",
    name = "Attach to process",
    pid = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  },
}
end
