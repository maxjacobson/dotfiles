function t --description "Start a tmux session"
  tmux new-session -A -s (basename $PWD)
end
