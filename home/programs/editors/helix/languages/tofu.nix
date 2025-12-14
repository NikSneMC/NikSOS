{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "hcl";
          language-id = "opentofu";
          scope = "source.hcl";
          file-types = ["tf" "tofu" "tfvars"];
          auto-format = true;
          comment-token = "#";
          block-comment-tokens = {
            start = "/*";
            end = "*/";
          };
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          language-servers = ["tofu-ls"];
        }
      ];

      language-server.tofu-ls = {
        command = "tofu-ls";
        args = ["serve"];
      };
    };

    extraPackages = with pkgs; [
      tofu-ls
    ];
  };
}
