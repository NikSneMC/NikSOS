{
  services = {
    logind.settings.Login.HandlePowerKey = "suspend";

    power-profiles-daemon.enable = true;

    # battery info
    upower.enable = true;

    # fix pipewire #2669 and #4115
    pipewire.wireplumber.extraConfig."wireplumber.profiles".main."monitor.libcamera" = "disabled";
  };
}
