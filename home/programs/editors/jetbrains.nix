{
  lib',
  pkgs,
  ...
}: let
  inherit (pkgs) fetchFromGitHub;

  ides = [
    "idea"
    # "pycharm"
    "webstorm"
    # "rust-rover"
    # "goland"
    # "phpstorm"
    # "clion"
    "datagrip"
  ];

  plugins = let
    jetbrains = "https://downloads.marketplace.jetbrains.com/files";
  in {
    common = {
      "${jetbrains}/18682/864736/Catppuccin_Theme-3.5.2.zip" = "sha256-F37RoWSV96ofEw7ckvhSS4nHaXUJOBuWecEhzaH2Zk4=";
      "${jetbrains}/23029/876768/Catppuccin_Icons-1.13.0.zip" = "sha256-fE0M8jYTYVIC0bbBDY9fWB+mgGcVIFkeee0VTAMXt2E=";
      "${jetbrains}/164/909533/IdeaVIM-2.28.0.zip" = "sha256-gbldn7jiZTo/U6/jzXUuLjOE/CZfhLV1WPGmydeFM+4=";
      "${jetbrains}/10149/881645/KJump-1.0.4.zip" = "sha256-95KQkv47EYUj+MQPGrLStc8aDzRPRQlxDWfwyvAxVO4=";
      "${jetbrains}/2162/820000/StringManipulation-9.16.0.zip" = "sha256-hevU8OwVr5HjMLpROZm3NiZI+PW2f7eNTxD+1aZsC8Q=";
      "${jetbrains}/7475/893203/tab-shifter.zip" = "sha256-h4+WMrj8U4+4rkHW2TdbSRBalOp4SiAeARAy1HIM7hk=";
      "${jetbrains}/8607/786671/NixIDEA-0.4.0.18.zip" = "sha256-JShheBoOBiWM9HubMUJvBn4H3DnWykvqPyrmetaCZiM=";
      "${jetbrains}/15285/578856/Direnv_integration-0.2.10.zip" = "sha256-fJ8jHh1PsXo+9FeYVHtWvfL4J0ChpSW5Gj622wjLU3I=";
      "${jetbrains}/10080/887330/intellij-rainbow-brackets-2025.3.6.zip" = "sha256-MOW8OwMdeBKr9jsc2lWnuiRRkmbg7rSUsKbZMftKzHU=";
      "${jetbrains}/7495/678216/ignore-4.5.6.zip" = "sha256-PdkZ5FeGqVqaZFSGfaZz3ksfHlQyOBvSp7Qgparkx4E=";
      "${jetbrains}/9525/909501/dotenv-253.28294.351.zip" = "sha256-Qa3UEr5kIklJF1ByqJmelmfHI31i/4aEzJKWnLz4uAA=";
      "${jetbrains}/11545/899630/tasks-253.28294.218.zip" = "sha256-4836pgkkP8adLMXPzaZ4A4XRLuxFTrInzqKQU+ZczCk=";
      "${jetbrains}/22477/922454/gitea-0.5.4.zip" = "sha256-aLPy+JIBnQB2took2LkmmIhtnNkgazvZoDEKJi3c9A4=";
      "${jetbrains}/22857/907468/vcs-gitlab-253.28294.325.zip" = "sha256-E1WbqzQGk3hnasxS+m85r7eHI+QUzRoAZb1OWhMrRbI=";
    };
    idea = {
      "${jetbrains}/1347/918481/scala-intellij-bin-2025.3.26.zip" = "sha256-wU1DNK5m1UH/L6iAUBnm1Mfv1D/Luz4SUmnvjdf/pso=";
      "${jetbrains}/8327/917195/Minecraft_Development-2025.3-1.8.11.zip" = "sha256-e831b/IcNH/FTbJyi6tbpXbSQE8SztJBbszNiMVqd/0=";
      "${jetbrains}/12839/262179/minecraft-nbt-intellij-plugin-1.5.4.zip" = "sha256-CDsO0R1vZN/Xv7aIuyEKOcN35FZfMbE9s7tXXmUzk/0=";
      "${jetbrains}/27606/920551/FIM-IntelliJ-0.5.1.jar" = "sha256-Vblr63sT1zN+T8o6pyitjSbx6QdzrPmQolcdBbEwf8A=";
      "${jetbrains}/29285/920968/MinecraftDevServer-1.0.1.zip" = "sha256-Wdze/yjkS8pprFhuWxYeQCBY+xa6/qZaG0tMYA1k81I=";
      "${jetbrains}/28320/869671/ModPublish-0.0.9.zip" = "sha256-P+qN1FgS0WQdqy78U+kTThFQdVY8r/s+BxzkOeotj08=";
    };
  };

  ides' = lib'.jetbrains.mkIdes pkgs ides plugins;
in {
  programs.jetbrains-remote = {
    enable = true;
    ides = ides';
  };
  home.packages = ides';

  # ideavim helix config
  home.file = let
    owner = "chtenb";
    repo = "helix.vim";
    path = "Projects/github/${owner}/${repo}";
  in {
    ${path}.source = fetchFromGitHub {
      inherit owner repo;
      rev = "958314b6210d93d1abd4b1bc23b06a69fd17e3e9";
      hash = "sha256-BYXknpFAX2vQpebAN4yGuve+2jpB8j1ZS1dXaq2kuI0=";
    };
    ".ideavimrc".text = "source ~/${path}/helix.idea.vim";
  };
}
