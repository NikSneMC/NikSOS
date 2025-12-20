{...}: let
  mkTmpfiles = {
    source,
    target,
    user,
    group,
  }: {
    ${target}."C+" = {
      argument = source;
    };

    ${dirOf target}.d = {
      inherit user group;
    };
  };
in {
  inherit mkTmpfiles;
}
