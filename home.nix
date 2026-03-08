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
fzf
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

home.sessionPath = [
  "$HOME/.local/bin"
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

      format = "[░▒▓](#a3aed2)[  ](bg:#a3aed2 fg:#090c0c)[](bg:#769ff0 fg:#a3aed2)$directory[](fg:#769ff0 bg:#394260)$git_branch$git_status[](fg:#394260 bg:#212736)$nodejs$rust$golang$php[](fg:#212736 bg:#1d2230)$time[ ](fg:#1d2230)$character";

      directory = {
        style = "fg:#e3e5e5 bg:#769ff0";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";

        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:#394260";
        format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
      };

      git_status = {
        style = "bg:#394260";
        format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#1d2230";
        format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
      };
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
