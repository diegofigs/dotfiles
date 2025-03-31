{ pkgs, lib, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "diegofigs";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  programs.gpg = {
    enable = true;
    mutableKeys = true;
    mutableTrust = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    history = {
      share = true;
      append = true;
      findNoDups = true;
      ignoreSpace = true;
      save = 10000;
      size = 10000;
    };
    initExtra = "
      export EDITOR=nvim
    ";
    completionInit = "
      # completers
      zstyle ':completion:*' completer _extensions _complete _approximate

      # arrow-driven tab menu
      zstyle ':completion:*' menu select

      # persistent rehash
      zstyle ':completion:*' rehash true
    ";
    shellAliases = {
      sudo = "sudo ";
      nf = "neofetch";
      vim = "nvim";
      pn = "pnpm";
      tf = "terraform";
      dot = "yadm";
      cat = "bat";
      find = "fd";
      ls = "eza";
      l = "ls -l";
      la = "ls -la";
      ll = "la";
      lf = "ls -lF";
      cleanup = "find . -type f -name '*.DS_Store' -ls -delete";
      grep = "grep --color";
    };
  };

  programs.mise.enable = true;
  programs.mise.enableZshIntegration = true;

  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    extraOptions = [ "--group-directories-first" ];
  };

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "NotoSansM Nerf Font"
      ];
      serif = [
        "NotoSerif Nerd Font"
      ];
      monospace = [
        "MesloLGS Nerd Font"
        "Hack Nerd Font"
        "NotoMono Nerd Font"
      ];
    };
  };

  services.gpg-agent.enable = true;

  home.packages = with pkgs; [
    coreutils
    act
    age
    bash
    bat
    btop
    curl
    eza
    fd
    fontconfig
    foundry
    fzf
    git
    gh
    gnugrep
    gnupg
    gnutar
    google-cloud-sdk
    gzip
    htop
    httpie
    jq
    lazygit
    less
    localsend
    lua-language-server
    mise
    neofetch
    openssl
    ripgrep
    rustup
    signal-desktop
    solana-cli
    sops
    starship
    telegram-desktop
    time
    tmux
    tokei
    watchman
    wget
    yadm
    zoxide

    nodePackages.node2nix

  ] ++ lib.optionals stdenv.isDarwin [
    m-cli
  ];
}
