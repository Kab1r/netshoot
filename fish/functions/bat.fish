#!/usr/bin/env fish
function bat
  if command -qs batcat
    batcat $argv
  else
    command bat $argv
  end
end
