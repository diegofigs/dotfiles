{ pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.alacritty
      pkgs.neovim
      pkgs.raycast
      pkgs.rectangle
    ];

  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    nerd-fonts.hack
    nerd-fonts.noto
  ];


  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;
  programs.zsh.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  system = {
    defaults = {
      dock.autohide = true;
      dock.persistent-apps = [
        "${pkgs.alacritty}/Applications/Alacritty.app"
        "${pkgs.raycast}/Applications/Raycast.app"
        "${pkgs.rectangle}/Applications/Rectangle.app"
        "/Applications/Brave Browser.app"
      ];
      finder.FXPreferredViewStyle = "clmv";
      finder.ShowPathbar = true;
      NSGlobalDomain.AppleInterfaceStyle = "Dark";
    };
  };


  users.users.diegofigs = {
    name = "diegofigs";
    home = "/Users/diegofigs";
  };

  homebrew = {
    enable = true;
    brews = [ "ykman" ];
    casks = [
      "balenaetcher"
      "brave-browser"
      "discord"
      "docker"
      "cloudflare-warp"
      "expressvpn"
      "retroarch-metal"
      "the-unarchiver"
    ];
    onActivation.cleanup = "zap";
  };
}
