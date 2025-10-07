{lib', ...}:
lib'.zellij.zellijPlugin {
  name = "zellij-hints";
  url = "https://github.com/b0o/zjstatus-hints/releases/download/v0.1.4/zjstatus-hints.wasm";
  sha256 = "17bir2z85ip7x6zndy94x5wdrpqv2py3wf116kadn3jw0blmav4k";
  load = true;
  config =
    #kdl
    ''
      max_length 0
      overflow_str "..."
      pipe_name "zjstatus_hints"
      hide_in_base_mode false
    '';
}
