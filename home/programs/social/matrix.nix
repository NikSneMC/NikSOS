{
  programs.element-desktop = {
    enable = true;
    settings = {
      show_labs_settings = true;
      features = {
        feature_latex_maths = true;
        feature_pinning = true;
        feature_jump_to_date = true;
        feature_bridge_state = true;
        feature_custom_themes = true;
        feature_notifications = true;
        # those are from Element nightly
        threadsActivityCentre = true;
        feature_spotlight = true;
      };
      default_country_code = "RU";
      "UIFeature.feedback" = false;

      # this is slightly modified default Element config
      brand = "Element";
      bug_report_endpoint_url = "https://rageshakes.element.io/api/submit";
      default_server_config = {
        "m.homeserver".base_url = "https://matrix-client.matrix.org";
        "m.identity_server".base_url = "https://vector.im";
      };
      default_server_name = "matrix.org";
      element_call.url = "https://call.element.io";
      enable_presence_by_hs_url = {
        "https://matrix-client.matrix.org" = false;
        "https://matrix.org" = false;
      };
      features = {
        feature_element_call_video_rooms = true;
        feature_group_calls = true;
        feature_video_rooms = true;
      };
      integrations_rest_url = "https://scalar.vector.im/api";
      integrations_ui_url = "https://scalar.vector.im/";
      integrations_widgets_urls = [
        "https://scalar.vector.im/_matrix/integrations/v1"
        "https://scalar.vector.im/api"
        "https://scalar-staging.vector.im/_matrix/integrations/v1"
        "https://scalar-staging.vector.im/api"
        "https://scalar-staging.riot.im/scalar/api"
      ];
      room_directory.servers = [
        "matrix.org"
        "gitter.im"
      ];
      map_style_url = "https://api.maptiler.com/maps/streets/style.json?key=fU3vlMsMn4Jb6dnEIFsx";
      setting_defaults."RustCrypto.staged_rollout_percent" = 60;
      uisi_autorageshake_app = "element-auto-uisi";
    };
  };
}
