#!/bin/bash

cat <<EOF > .tmux.conf
# tmuxを256色表示できるようにする
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'

# prefixキーをC-tに変更
set -g prefix C-t

# C-bのキーバインドを解除
unbind C-b
unbind C-n
unbind C-p

# ステータスバーをトップに配置する
set-option -g status-position top

# 左右のステータスバーの長さを決定する
set-option -g status-left-length 90
set-option -g status-right-length 90

# #P => ペイン番号
# 最左に表示
set-option -g status-left '#H:[#P]'

# Wi-Fi、バッテリー残量、現在時刻
# 最右に表示
set-option -g status-right '[%Y-%m-%d(%a) %H:%M]'

# ステータスバーを1秒毎に描画し直す
set-option -g status-interval 1

# センタライズ（主にウィンドウ番号など）
set-option -g status-justify centre

# ステータスバーの色を設定する
set-option -g status-bg "colour238"

# status line の文字色を指定する。
set-option -g status-fg "colour248"

# ボーダーラインの色を変更する
set -g pane-border-style fg=magenta
set -g pane-active-border-style "bg=default fg=magenta"

# vimのキーバインドでペインを移動する
bind -r p select-pane -U
bind -r n select-pane -D
bind -r h select-pane -L
bind -r l select-pane -R

# | でペインを縦分割する
bind | split-window -h

# - でペインを縦分割する
bind - split-window -v

# 番号基準値を変更
set-option -g base-index 1

# ウィンドウのインデックスを1から始める
set -g base-index 1

# ペインのインデックスを1から始める
setw -g pane-base-index 1

# コピーモードでvimキーバインドを使う
setw -g mode-keys vi

# 'v' で選択を始める
bind -T copy-mode-vi v send -X begin-selection

# 'V' で行選択
bind -T copy-mode-vi V send -X select-line

# 'y' でヤンク
bind -T copy-mode-vi y send -X copy-selection

# 'Y' で行ヤンク
bind -T copy-mode-vi Y send -X copy-line

# Prefix keyが押されているか判定
set-option -g status-left '#[fg=cyan,bg=#303030]#{?client_prefix,#[reverse],} #H[#S] #[default]'
EOF

mv .tmux.conf ~/.tmux.conf
