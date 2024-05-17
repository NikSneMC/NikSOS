{
  pkgs,
  ...
}: {
  services.httpd = {
    enable = true;
    adminAddr = "niksne.mc@yandex.ru";
    virtualHosts = {
      "localhost" = {
        documentRoot = "/www/localhost";
      };
    };
  };
}