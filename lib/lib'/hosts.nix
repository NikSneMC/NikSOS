{...}: let
  hostIn = config: hostlist: builtins.elem config.networking.hostName hostlist;

  forHosts = config: fn: hostlist: hostIn config hostlist |> fn;
  notForHosts = config: fn: hostlist: !(hostIn config hostlist) |> fn;
in {
  inherit forHosts notForHosts;
}
