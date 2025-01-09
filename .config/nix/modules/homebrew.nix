{ pkgs, ... }: {
  homebrew = {
    enable = true;
    brews = [
      "mas"
      "fd"
      "entr"
      "tmux"
      "powerlevel10k"
      "fzf"
      "ripgrep"
      "ast-grep"
      "bat"
      "eza"
      "stow"
      "lazygit"
      "gh"
      "nmap"
      "pandoc"
      "nushell"
      "neovim"
      "tmux"
      "git"
      "python"
      "node"
      "ffmpeg"
      "p7zip"
      "yazi"
      "poppler"
      "vim"
      "imagemagick"
      "gnupg"
    ];
    casks = [
      "the-unarchiver"
      "arc"
      "desktoppr"
      "vlc"
      "ghostty"
      "obsidian"
      "font-ubuntu-mono-nerd-font"
    ];
    masApps = {
      "Magnet" = 441258766;
      "Tailscale" = 1475387142;
      "NordVpn" = 905953485;
    };
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
  };
}
