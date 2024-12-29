####### ~*~ Work Stuff *~ #############
if test -d "$HOME/FAMLI"
  set -gx AWS_PROFILE FAMLI-ReadOnlyAccess
  set -gx MD_FAMLI_GIT_HOOKS_PRE_PUSH 1
  set -gx MD_FAMLI_GIT_HOOKS_PRE_PUSH_RSPEC 0
  set -gx MD_FAMLI_GIT_HOOKS_PRE_PUSH_BRAKEMAN 0
  set -gx MDWDS_GIT_HOOKS_PRE_PUSH_UNIT_TESTS 1
  set -gx MDWDS_GIT_HOOKS_PRE_PUSH_TEST_STORYBOOK 0

  set CDPATH \
    "$HOME/FAMLI/Code" \
    $CDPATH
end
