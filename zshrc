# Created by newuser for 5.9
export EDITOR=nvim
set -o vi
alias -g ls='ls --color=auto -h --classify'
eval "$(starship init zsh)"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# Configuración de 'oh-my-zsh'
plugins=(colorize)
 
# Configuración sugerida en la documentación de Archlinux
autoload -U compinit  # activar el auto-completado.
compinit

setopt completealiases # Para completado también con alias
setopt HIST_IGNORE_DUPS  # No permitir comados duplicados en el historial
bindkey -v   # En modo vi

# Prompts
# autoload -U promptinit
# promptinit
#
# autoload -U colors && colors # colores en el prompt

# Recordar los directorios visitados
# Luego usar dirs -v
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Elimina las entradas duplicadas
setopt pushdignoredups

## Esto revierte los operadores +/-.
setopt pushdminus

# Comando de ayuda _help_
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help

# Añadir resaltado fish en zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Recargar el autocommpletado al instalar nuevos paquetes.
zstyle ':completion:*' rehash true
