{lib, ...}: {
  config = {
    time.timeZone = lib.mkDefault "Europe/Moscow";
  };
}
