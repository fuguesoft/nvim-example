require('vim._core.ui2').enable({
  enable = true,
  msg = {
    target = "cmd",
    pager = { height = 0.5 },
    dialog = { height = 0.5 },
    cmd = { height = 0.5 },
    msg = { height = 0.5, timeout = 4500 },
  },
})

print "ooooooh, source me daddy"

require("core.options")
require("core.keymaps")
-- require("core.float-term")
require("core.lazy")
-- require("manage").setup()
require("core.theme")
