{lib, ...}: let
  mkSubvolumes = subvolumes:
    lib.pipe subvolumes [
      (map (
        subvolume:
          if builtins.isString subvolume
          then {
            name = subvolume;
            value = {
              mountpoint = subvolume;
            };
          }
          else {
            name = subvolume.mountpoint;
            value = subvolume;
          }
      ))
      builtins.listToAttrs
    ];

  mkUserSubvolumes = user: folders:
    lib.pipe folders [
      (map (folder: {
        mountpoint = "/home/${user}/${folder}";
        mountOptions = ["compress=zstd"];
      }))
      mkSubvolumes
    ];
in {
  inherit mkSubvolumes mkUserSubvolumes;
}
