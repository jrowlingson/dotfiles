# disable all beeping
setopt no_beep

# vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey '^P' up-history
bindkey '^N' down-history

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Whenever the user enters a line with history substitution, don't execute
# the line directly; instead, perform history substitution and reload the
# line into the editing buffer.
setopt hist_verify

# Save beginning and ending timestamps to the history file.
setopt extended_history

# Remove superfluous blanks from each command line being added to the history list.
setopt hist_reduce_blanks
setopt hist_ignore_all_dups

# Append and share history between parallel zsh instances
setopt share_history

# setopt complete_aliases TODO: what does this do?
