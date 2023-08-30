# create tmux
tmux new-session -d -s fbbuy  -c /Users/yushinglai/Projects/fbbuy-fbbuy
tmux split-window -t fbbuy -c /Users/yushinglai/Projects/fbbuy-fbbuy

tmux new-window -t fbbuy  -c /Users/yushinglai/Projects/fbbuy-great-again
tmux split-window -t fbbuy:2 -c /Users/yushinglai/Projects/fbbuy-great-again

tmux new-window -t fbbuy  -c /Users/yushinglai/Projects/fbbuy-models
tmux split-window -t fbbuy:3 -c /Users/yushinglai/Projects/fbbuy-models

tmux new-window -t fbbuy  -c /Users/yushinglai/Projects/fbbuy-frontend
tmux split-window -t fbbuy:4 -c /Users/yushinglai/Projects/fbbuy-frontend

tmux new-session -d -s waltily  -c /Users/yushinglai/Projects/waltily
tmux split-window -t waltily -c /Users/yushinglai/Projects/waltily

tmux new-window -t waltily  -c /Users/yushinglai/Projects/waltily-frontend
tmux split-window -t waltily:2 -c /Users/yushinglai/Projects/waltily-frontend

tmux new-session -d -s mix  -c /Users/yushinglai/Packages/framework
tmux split-window -t mix -c /Users/yushinglai/Packages/framework

tmux new-window -t mix  -c /Users/yushinglai/Practice/c
tmux split-window -t mix:2 -c /Users/yushinglai/Practice/c

tmux new-window -t mix  -c /Users/yushinglai/Practice/php
tmux split-window -t mix:3 -c /Users/yushinglai/Practice/php

tmux resize-pane -t fbbuy -y 8
tmux resize-pane -t fbbuy:2 -y 8
tmux resize-pane -t fbbuy:3 -y 8
tmux resize-pane -t fbbuy:4 -y 8
tmux resize-pane -t waltily -y 8
tmux resize-pane -t waltily:2 -y 8
tmux resize-pane -t mix -y 8
tmux resize-pane -t mix:2 -y 8
tmux resize-pane -t mix:3 -y 8

# run pm2
cd /Users/yushinglai/Projects/fbbuy-frontend
pm2 start yarn --name fbbuy -- dev  --port 8081

cd /Users/yushinglai/Projects/waltily-frontend
pm2 start yarn --name waltily -- serve  --port 8080
