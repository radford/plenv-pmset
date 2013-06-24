unset PERL_MB_OPT PERL_MM_OPT

if [ "$(plenv-version-name)" = "system" ]; then
  PLENV_PMSET_ROOT="$PLENV_PMSET_SYSTEM_ROOT"
else
  PLENV_PMSET_ROOT="$(plenv-prefix)/pmsets"
fi

OLDIFS="$IFS"
IFS=$' \t\n'
for pmset in $(plenv-pmset active 2>/dev/null); do
  path="${PLENV_PMSET_ROOT}/$pmset"
  PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:$path";
  PERL_MB_OPT="--install_base $path";
  PERL_MM_OPT="INSTALL_BASE=$path";
  PERL5LIB="$path/lib/perl5:$PERL5LIB";
  PATH="$path/bin:$PATH";
  MANPATH="$path/man:$MANPATH";
done
IFS="$OLDIFS"

if [ -n "$PERL_MB_OPT" ]; then
  export PERL_LOCAL_LIB_ROOT PERL_MB_OPT PERL_MM_OPT PERL5LIB PATH MANPATH
fi
