require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
require("copilot.suggestion").is_visible()
require("copilot.suggestion").accept_word()
require("copilot.suggestion").accept_line()
require("copilot.suggestion").next()
require("copilot.suggestion").prev()
require("copilot.suggestion").dismiss()
require("copilot.suggestion").toggle_auto_trigger()
require("copilot_cmp").setup()
