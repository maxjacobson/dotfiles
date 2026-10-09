function jco --argument-names bookmark --description "Check out someone else's branch"
    commandline --replace "jj bookmark track $bookmark && jj edit $bookmark"
end
