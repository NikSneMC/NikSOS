{
  inputs,
  pkgs,
  ...
}: {
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers = {
      wolfland = {
        enable = true;
        autoStart = false;
        restart = "no";
        jvmOpts = "-Xmx32G";
        package = inputs.nix-minecraft.legacyPackages.${pkgs.system}.fabricServers.fabric-1_20_4;
        serverProperties = {
          allow-nether = false;
          difficulty = "hard";
          enable-command-block = true;
          enforce-secure-profile = false;
          max-players = 57;
          max-world-size = 10000;
          motd = "§f      Добро пожаловать на §3Вульфланд§f\!§r\n         §a[§eJava §61.20.4 §a| §eBedrock §61.20.x§a]";
          server-port = 25565;
          simulation-distance = 32;
          spawn-protection = 0;
          view-distance = 32;
          white-list = true;
        };
        whitelist = {
            NikSne = "4bff5ecf-43a8-46b1-81ce-1964864ebf95";
            DeckerKew = "7a914e6b-a507-4529-904a-083168f163cb";
        };
      };
    };
  };
}