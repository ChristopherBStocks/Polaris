{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.polaris.homeManager.dev.nodejs;
in
  with lib; {
    options.polaris.homeManager.dev.nodejs = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable Node.js";
      };
      node = mkOption {
        type = types.package;
        default = pkgs.nodejs_24;
        description = "Node.js package";
      };
    };
    config = mkIf cfg.enable {
      home.packages = with pkgs; [cfg.node];
    };
  }
