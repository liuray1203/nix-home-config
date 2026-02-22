{ config, pkgs, ... }:

{
home.username = "liuray";
home.homeDirectory = "/home/liuray";
home.stateVersion = "24.05";


# ----------------------------
# 基礎系統工具（CLI / Dev / Laptop CLI）
# ----------------------------
home.packages = with pkgs; [
# CLI 基礎
git
curl
wget
unzip
zip
rsync
tree
htop
btop
fastfetch
ripgrep
fd
#nerd-fonts字體
(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

# 開發 / 腳本
python3
python3Packages.pip
shellcheck
shfmt


# Node / 編輯器
nodejs
neovim
vim

# ThinkPad CLI 工具（不啟動 systemd 服務）
brightnessctl
];


# ----------------------------
# Shell 設定
# ----------------------------
programs.zsh = {
enable = true;
enableCompletion = true;
autosuggestion.enable = true;
syntaxHighlighting.enable = true;
};


programs.starship = {
enable = true;
settings = {
    add_newline = false;
  };
};


# ----------------------------
# Git 設定
# ----------------------------
programs.git = {
enable = true;
userName = "liuray";
userEmail = "you@example.com"; # 之後再改
};


# ----------------------------
# Home Manager 本體
# ----------------------------
programs.home-manager.enable = true;
}
