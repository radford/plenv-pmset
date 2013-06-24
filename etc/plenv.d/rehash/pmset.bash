shopt -s nullglob
OLDIFS="$IFS"
IFS=$' \t\n'
pmset_bin=(${PLENV_ROOT}/versions/*/pmsets/*/bin/*)
IFS="$OLDIFS"
shopt -s nullglob

cd "$SHIM_PATH"
make_shims ${pmset_bin[@]}
cd "$CUR_PATH"
