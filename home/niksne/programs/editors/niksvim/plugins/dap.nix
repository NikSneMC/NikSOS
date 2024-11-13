{
  programs.nixvim.plugins.dap = {
    enable = true;
    extensions = {
      dap-go.enable = true;
      dap-python.enable = true;
      dap-ui.enable = true;
      dap-virtual-text.enable = true;
    };
  };
}
