function md --description "Make a directory and then cd into it"
  mkdir -p "$argv" && cd "$argv"
end
