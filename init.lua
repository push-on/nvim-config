require "user.plugins-setup"
local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

for _, source in ipairs {
    "user.core.options", "user.plugins-setup", "user.core.colorscheme",
    "user.core.keymaps", "user.plugins.mason",  "user.plugins.cmp", "user.plugins.lspconfig"
} do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
    end
end

