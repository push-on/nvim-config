local status_ok, _ = pcall(require, "auto-save")
if status_ok then require("auto-save").setup {} end
