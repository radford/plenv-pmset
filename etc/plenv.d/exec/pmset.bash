unset PM_HOME PM_PATH

if [ "$(plenv-version-name)" = "system" ]; then
  PLENV_PMSET_ROOT="$PLENV_PMSET_SYSTEM_ROOT"
else
  PLENV_PMSET_ROOT="$(plenv-prefix)/pmsets"
fi

OLDIFS="$IFS"
IFS=$' \t\n'
for pmset in $(plenv-pmset active 2>/dev/null); do
  path="${RBENV_PMSET_ROOT}/$pmset"
  PATH="$path/bin:$PATH"
  if [ -z "$PM_HOME" ]; then
    PM_HOME="$path"
    PM_PATH="$path"
  else
    PM_PATH="$PM_PATH:$path"
  fi
done
IFS="$OLDIFS"

if [ -n "$PM_HOME" ]; then
  export PM_HOME PM_PATH PATH
fi
