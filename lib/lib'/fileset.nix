{lib, ...}: let
  inherit (builtins) readDir elem attrNames;
  inherit (lib) filterAttrs;
  inherit (lib.fileset) fileFilter toList;

  filesNamed = filename: path:
    path
    |> fileFilter (file: file.name == filename)
    |> toList;

  listFilesExcluding = filenames: path:
    readDir path
    |> filterAttrs (
      name: type:
        type == "regular" && !(elem name filenames)
    )
    |> attrNames
    |> map (filename: "${path}/${filename}");
in {
  inherit filesNamed listFilesExcluding;
}
