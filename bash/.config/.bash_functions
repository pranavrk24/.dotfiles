# To change the title of the current terminal tab
function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# To create a directory and enter it
function mkcd() {
    mkdir -p $1
    cd $1
}

# To change the directory and list the contents
function cl() {
    builtin cd "$@" && \
    ls -F --color=auto
}

