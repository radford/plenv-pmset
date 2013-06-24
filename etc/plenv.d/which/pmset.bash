if [ "$(plenv-version-name)" = "system" ]; then
  PLENV_PMSET_ROOT="$PLENV_PMSET_SYSTEM_ROOT"
else
  PLENV_PMSET_ROOT="$(plenv-prefix)/pmsets"
fi

OLDIFS="$IFS"
IFS=$' \t\n'
for pmset in $(plenv-pmset active 2>/dev/null); do
  command="${PLENV_PMSET_ROOT}/${pmset}/bin/$PLENV_COMMAND"
  if [ -x "$command" ]; then
    PLENV_COMMAND_PATH="$command"
    break
  fi
done
IFS="$OLDIFS"
