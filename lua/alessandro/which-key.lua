local which_key_ok = pcall(require, "which_key")
if not which_key_ok then
  print "which-key did not initialize"
  return 0
end
