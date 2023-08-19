# Defined via `source`
function off --wraps='sudo shutdown -h now' --description 'alias off=sudo shutdown -h now'
  sudo shutdown -h now $argv; 
end
