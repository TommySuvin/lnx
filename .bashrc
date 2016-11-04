# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then        
  . /etc/bashrc
fi
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#Setting up Tmux Profile
tmux_count=`tmux ls | wc -l`
 if [[ "$tmux_count" == "0" ]];   then    
  tmux new-session -d -s "DB_ADMIN"    
  tmux split-window -v    
  tmux split-window -h    
  tmux attach-session -t "DB_ADMIN"
else    
  if [[ -z "$TMUX" ]]; then        
    if [[ "$tmux_count" == "1" ]]; then            
            session_id=1       
           else            
             session_id=`echo $tmux_count`      
     fi    
              tmux new-session -d -s "DB_ADMIN".$session_id    
              tmux split-window -v    
              tmux split-window -h    
              tmux attach-session -t "DB_ADMIN".$session_id    
   fi
  fi
 
 #Most Commonly Used Aliases
 alias as="tmux a -t"
 alias list="tmux list-session"
 alias tk="killall tmux"
