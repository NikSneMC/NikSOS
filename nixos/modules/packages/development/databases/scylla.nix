{ nnr, ...}:

{
    environment.systemPackages = with nnr; [
        scylladb
    ];
}
