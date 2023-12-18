BASIC_PATH=/Users/yushing
# create tmux
tmux new-session -d -s waltily  -c $BASIC_PATH/Projects/waltily/waltily
tmux split-window -t waltily -c $BASIC_PATH/Projects/waltily/waltily

tmux new-window -t waltily  -c $BASIC_PATH/Projects/waltily/waltily-frontend
tmux split-window -t waltily:2 -c $BASIC_PATH/Projects/waltily/waltily-frontend

tmux new-session -d -s mix  -c $BASIC_PATH/Packages/framework
tmux split-window -t mix -c $BASIC_PATH/Packages/framework

tmux new-window -t mix  -c $BASIC_PATH/Practice/c
tmux split-window -t mix:2 -c $BASIC_PATH/Practice/c

tmux new-window -t mix  -c $BASIC_PATH/Practice/php
tmux split-window -t mix:3 -c $BASIC_PATH/Practice/php

tmux resize-pane -t waltily -y 8
tmux resize-pane -t waltily:2 -y 8
tmux resize-pane -t mix -y 8
tmux resize-pane -t mix:2 -y 8
tmux resize-pane -t mix:3 -y 8

# run pm2
cd $BASIC_PATH/Projects/waltily/waltily-frontend
pm2 start yarn --name waltily -- serve  --port 8080
