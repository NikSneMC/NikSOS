{
  services = {
    logind.extraConfig = ''
      HandlePowerKey=suspend
    '';

    power-profiles-daemon.enable = true;

    # battery info
    upower.enable = true;

    # fix pipewire #2669 and #4115
    pipewire.wireplumber.extraConfig."10-disable-camera"."wireplumber.profiles".main."monitor.libcamera" = "disabled";
  };
}
