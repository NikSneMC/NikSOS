{
  disabledModules = ["services/networking/zapret.nix"]; # необходимо если версия nixpkgs новее 5a5c04d

  services.zapret = {
    enable = true;
    mode = "nfqws";

    settings = ''
      SET_MAXELEM=522288
      IPSET_OPT="hashsize 262144 maxelem $SET_MAXELEM"

      IP2NET_OPT4="--prefix-length=22-30 --v4-threshold=3/4"
      IP2NET_OPT6="--prefix-length=56-64 --v6-threshold=5"
      AUTOHOSTLIST_RETRANS_THRESHOLD=3
      AUTOHOSTLIST_FAIL_THRESHOLD=3
      AUTOHOSTLIST_FAIL_TIME=60
      AUTOHOSTLIST_DEBUGLOG=0

      MDIG_THREADS=30

      GZIP_LISTS=1
      QUIC_PORTS=50000-65535

      MODE_HTTP=1
      MODE_HTTP_KEEPALIVE=0
      MODE_HTTPS=1
      MODE_QUIC=1
      MODE_FILTER=none

      DESYNC_MARK=0x40000000
      DESYNC_MARK_POSTNAT=0x20000000
      NFQWS_OPT_DESYNC="--dpi-desync=fake --dpi-desync-ttl=0 --dpi-desync-ttl6=0 --dpi-desync-fooling=badsum"
      NFQWS_OPT_DESYNC_HTTP="--dpi-desync=split --dpi-desync-ttl=5"
      NFQWS_OPT_DESYNC_HTTPS="--dpi-desync=fake --dpi-desync-ttl=5"
      NFQWS_OPT_DESYNC_QUIC="--dpi-desync=fake,tamper --dpi-desync-repeats=6 --dpi-desync-any-protocol"

      TPWS_OPT="--hostspell=HOST --split-http-req=method --split-pos=3 --hostcase --oob"

      FLOWOFFLOAD=donttouch

      INIT_APPLY_FW=1

      DISABLE_IPV6=1
    '';
  };
}
