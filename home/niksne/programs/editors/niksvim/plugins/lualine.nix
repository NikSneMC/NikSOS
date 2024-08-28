{
  programs.nixvim.plugins.lualine = {
    enable = true;
    globalstatus = true;
    theme = "catppuccin";
    sections = let
      mkLocationComponent = type: assert (builtins.elem type [ "col" "line" ]); {
        name = "location";
        fmt = ''
          function(text)
            local current_${type} = vim.fn.${type}('.')
            local last_${type} = vim.fn.${type}('$')${if type == "col" then " - 1" else ""}
            return string.format("%d:%d", current_${type}, last_${type})
          end
        '';
      };
    in {
      lualine_y = [ (mkLocationComponent "col") ];
      lualine_z = [ (mkLocationComponent "line") ];
    };
  };
}
