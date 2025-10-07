{
  config,
  lib',
  ...
}: let
  inherit (config.theme) colors;
in
  lib'.zellij.zellijPlugin {
    name = "zjstatus";
    url = "https://github.com/dj95/zjstatus/releases/download/v0.21.1/zjstatus.wasm";
    sha256 = "06mfcijmsmvb2gdzsql6w8axpaxizdc190b93s3nczy212i846fw";
    config =
      # kdl
      ''
        format_left   "{mode}#[bg=#${colors.base}] {tabs}"
        format_center "{pipe_zjstatus_hints}"
        format_right  "#[bg=#${colors.base},fg=#${colors.blue}]#[bg=#${colors.blue},fg=#${colors.mantle},bold] #[bg=#${colors.surface0},fg=#${colors.text},bold] {session} #[bg=#${colors.surface1},fg=#${colors.text},bold]"
        format_space  ""
        format_hide_on_overlength "true"
        format_precedence "crl"

        border_enabled  "false"
        border_char     "─"
        border_format   "#[fg=#6C7086]{char}"
        border_position "top"

        mode_normal        "#[bg=#${colors.green},fg=#${colors.surface0},bold] NORMAL#[bg=#${colors.surface1},fg=#${colors.green}]█"
        mode_locked        "#[bg=#${colors.surface2},fg=#${colors.surface0},bold] LOCKED #[bg=#${colors.surface1},fg=#${colors.surface2}]█"
        mode_resize        "#[bg=#${colors.red},fg=#${colors.surface0},bold] RESIZE#[bg=#${colors.surface1},fg=#${colors.red}]█"
        mode_pane          "#[bg=#${colors.blue},fg=#${colors.surface0},bold] PANE#[bg=#${colors.surface1},fg=#${colors.blue}]█"
        mode_tab           "#[bg=#${colors.lavender},fg=#${colors.surface0},bold] TAB#[bg=#${colors.surface1},fg=#${colors.lavender}]█"
        mode_scroll        "#[bg=#${colors.yellow},fg=#${colors.surface0},bold] SCROLL#[bg=#${colors.surface1},fg=#${colors.yellow}]█"
        mode_enter_search  "#[bg=#${colors.blue},fg=#${colors.surface0},bold] ENT-SEARCH#[bg=#${colors.surface1},fg=#${colors.blue}]█"
        mode_search        "#[bg=#${colors.blue},fg=#${colors.surface0},bold] SEARCHARCH#[bg=#${colors.surface1},fg=#${colors.blue}]█"
        mode_rename_tab    "#[bg=#${colors.lavender},fg=#${colors.surface0},bold] RENAME-TAB#[bg=#${colors.surface1},fg=#${colors.lavender}]█"
        mode_rename_pane   "#[bg=#${colors.blue},fg=#${colors.surface0},bold] RENAME-PANE#[bg=#${colors.surface1},fg=#${colors.blue}]█"
        mode_session       "#[bg=#${colors.mauve},fg=#${colors.surface0},bold] SESSION#[bg=#${colors.surface1},fg=#${colors.mauve}]█"
        mode_move          "#[bg=#${colors.flamingo},fg=#${colors.surface0},bold] MOVE#[bg=#${colors.surface1},fg=#${colors.flamingo}]█"
        mode_prompt        "#[bg=#${colors.blue},fg=#${colors.surface0},bold] PROMPT#[bg=#${colors.surface1},fg=#${colors.blue}]█"
        mode_tmux          "#[bg=#${colors.peach},fg=#${colors.surface0},bold] TMUX#[bg=#${colors.surface1},fg=#${colors.peach}]█"

        // formatting for inactive tabs
        tab_normal              "#[bg=#${colors.surface1},fg=#${colors.blue}]█#[bg=#${colors.blue},fg=#${colors.surface0},bold]{index} #[bg=#${colors.surface0},fg=#${colors.text},bold] {name}{floating_indicator}#[bg=#${colors.surface1},fg=#${colors.surface0},bold]█"
        tab_normal_fullscreen   "#[bg=#${colors.surface1},fg=#${colors.blue}]█#[bg=#${colors.blue},fg=#${colors.surface0},bold]{index} #[bg=#${colors.surface0},fg=#${colors.text},bold] {name}{fullscreen_indicator}#[bg=#${colors.surface1},fg=#${colors.surface0},bold]█"
        tab_normal_sync         "#[bg=#${colors.surface1},fg=#${colors.blue}]█#[bg=#${colors.blue},fg=#${colors.surface0},bold]{index} #[bg=#${colors.surface0},fg=#${colors.text},bold] {name}{sync_indicator}#[bg=#${colors.surface1},fg=#${colors.surface0},bold]█"

        // formatting for the current active tab
        tab_active              "#[bg=#${colors.surface1},fg=#${colors.peach}]█#[bg=#${colors.peach},fg=#${colors.surface0},bold]{index} #[bg=#${colors.surface0},fg=#${colors.text},bold] {name}{floating_indicator}#[bg=#${colors.surface1},fg=#${colors.surface0},bold]█"
        tab_active_fullscreen   "#[bg=#${colors.surface1},fg=#${colors.peach}]█#[bg=#${colors.peach},fg=#${colors.surface0},bold]{index} #[bg=#${colors.surface0},fg=#${colors.text},bold] {name}{fullscreen_indicator}#[bg=#${colors.surface1},fg=#${colors.surface0},bold]█"
        tab_active_sync         "#[bg=#${colors.surface1},fg=#${colors.peach}]█#[bg=#${colors.peach},fg=#${colors.surface0},bold]{index} #[bg=#${colors.surface0},fg=#${colors.text},bold] {name}{sync_indicator}#[bg=#${colors.surface1},fg=#${colors.surface0},bold]█"

        // separator between the tabs
        tab_separator           "#[bg=#${colors.base}] "

        // indicators
        tab_sync_indicator       " "
        tab_fullscreen_indicator " 󰊓"
        tab_floating_indicator   " 󰹙"

        command_git_branch_command     "git rev-parse --abbrev-ref HEAD"
        command_git_branch_format      "#[fg=blue] {stdout} "
        command_git_branch_interval    "10"
        command_git_branch_rendermode  "static"

        datetime        "#[fg=#6C7086,bold] {format} "
        datetime_format "%A, %d %b %Y %H:%M"
        datetime_timezone "Europe/Moscow"
      '';
  }
