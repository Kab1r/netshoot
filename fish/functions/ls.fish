#!/usr/bin/env fish
function ls
  if command -qs eza
    eza --icons --color=always --group-directories-first $argv
  else if command -qs exa
    exa --icons --color=always --group-directories-first $argv
  else
    command ls $argv
  end
end
