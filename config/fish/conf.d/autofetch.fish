# Mimic the autofetch behavior that sindresorhus/pure has by running a git fetch in the background
# whenever rendering a fish prompt. This just helps make sure the prompt will be up-to-date
function autofetch --on-event "fish_prompt" --description 'Fetch on prompt'
  if test -d ".git"
    #git fetch &
    # I feel like this is probably a bad idea...
  end
end
