{...}: let
  hostIn = config: hostlist: builtins.elem config.networking.hostName hostlist;

  forHosts = config: hostlist: fn: hostIn config hostlist |> fn;
  notForHosts = config: hostlist: fn: !(hostIn config hostlist) |> fn;
in {
  inherit forHosts notForHosts;
}
