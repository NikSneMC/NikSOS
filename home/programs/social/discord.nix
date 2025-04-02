{
  config,
  lib',
  pkgs,
  ...
}: let
  plugins = [
    {
      name = "accountPanelServerProfile";
      prioritizeServerProfile = true;
    }
    "betterGifAltText"
    "betterGifPicker"
    {
      name = "betterNotesBox";
      hide = true;
    }
    {
      name = "betterRoleContext";
      roleIconFileFormat = "webp";
    }
    {
      name = "betterRoleDot";
      copyRoleColorInProfilePopout = true;
    }
    {
      name = "betterSessions";
      backgroundCheck = true;
    }
    "betterSettings"
    "betterUploadButton"
    "biggerStreamPreview"
    "blurNSFW"
    {
      name = "callTimer";
      format = "human";
    }
    "chatInputButtonAPI"
    "clearURLs"
    {
      name = "consoleJanitor";
      disableNoisyLoggers = true;
    }
    "consoleShortcuts"
    "copyEmojiMarkdown"
    "copyFileContents"
    "copyUserURLs"
    "dearrow"
    "decor"
    "disableCallIdle"
    "dontRoundMyTimestamps"
    "emoteCloner"
    {
      name = "experiments";
      toolbarDevMenu = true;
    }
    "favoriteEmojiFirst"
    "favoriteGifSearch"
    "fixCodeblockGap"
    "fixSpotifyEmbeds"
    "fixYoutubeEmbeds"
    "forceOwnerCrown"
    "friendInvites"
    "friendsSince"
    "fullSearchContext"
    "gameActivityToggle"
    "gifPaste"
    "greetStickerPicker"
    "imageLink"
    "imageZoom"
    "implicitRelationships"
    "keepCurrentChannel"
    "loadingQuotes"
    "memberCount"
    "mentionAvatars"
    "messageClickActions"
    {
      name = "messageLatency";
      showMillis = true;
    }
    "messageLinkEmbeds"
    {
      name = "messageLogger";
      deleteStyle = "overlay";
    }
    "messageTags"
    "messageUpdaterAPI"
    "moreCommands"
    "moreKaomoji"
    {
      name = "moyai";
      ignoreBots = false;
      quality = "HD";
      triggerWhenUnfocused = false;
    }
    "mutualGroupDMs"
    "noBlockedMessages"
    "noDevtoolsWarning"
    "noF1"
    "noOnboardingDelay"
    "normalizeMessageLinks"
    "notificationVolume"
    "noTypingAnimation"
    "noUnblockToJump"
    "nsfwGateBypass"
    {
      name = "openInApp";
      spotify = false;
    }
    "pauseInvitesForever"
    "permissionFreeWill"
    "permissionsViewer"
    "petpet"
    "pictureInPicture"
    "platformIndicators"
    "previewMessage"
    "userMessagesPronouns"
    "quickMention"
    "quickReply"
    "reactErrorDecoder"
    "readAllNotificationsButton"
    {
      name = "relationshipNotifier";
      notices = true;
    }
    "replaceGoogleSearch"
    "replyTimestamp"
    "revealAllSpoilers"
    "reverseImageSearch"
    "reviewDB"
    "roleColorEverywhere"
    "secretRingToneEnabler"
    "sendTimestamps"
    "serverInfo"
    "serverListIndicators"
    {
      name = "settings";
      settingsLocation = "belowActivity";
    }
    {
      name = "shikiCodeblocks";
      theme = "https://esm.sh/@catppuccin/vscode/themes/${config.theme.flavor}.json";
    }
    "showConnections"
    {
      name = "showHiddenChannels";
      showMode = "muted";
    }
    "showHiddenThings"
    {
      name = "showMeYourName";
      mode = "nick-user";
    }
    "showTimeoutDuration"
    {
      name = "silentMessageToggle";
      autoDisable = false;
      persistState = true;
    }
    {
      name = "silentTyping";
      showIcon = true;
    }
    {
      name = "sortFriendRequests";
      showDates = true;
    }
    "spotifyControls"
    {
      name = "spotifyCrack";
      keepSpotifyActivityOnIdle = true;
    }
    "spotifyShareCommands"
    "startupTimings"
    "stickerPaste"
    "streamerModeOnStream"
    "superReactionTweaks"
    "themeAttributes"
    "translate"
    {
      name = "typingIndicator";
      includeMutedChannels = true;
    }
    "typingTweaks"
    "unindent"
    "unlockedAvatarZoom"
    "unsuppressEmbeds"
    "userSettingsAPI"
    "userVoiceShow"
    "USRBG"
    "validReply"
    "validUser"
    "vencordToolbox"
    "viewIcons"
    "viewRaw"
    "voiceChatDoubleClick"
    "voiceDownload"
    "voiceMessages"
    "volumeBooster"
    "whoReacted"
    "youtubeAdblock"
  ];

  themes = [
    "https://catppuccin.github.io/discord/dist/catppuccin-${config.theme.flavor}-${config.theme.accent}.theme.css"
    "https://raw.githubusercontent.com/NikSneMC/vesktop-jetbrainsmono-nerd-font-theme/main/font.css"
    "https://discord-themes.com/api/106"
    "https://discord-themes.com/api/113"
    "https://discord-themes.com/api/104"
    "https://discord-themes.com/api/8"
    "https://discord-themes.com/api/117"
    "https://discord-themes.com/api/121"
    "https://discord-themes.com/api/119"
    "https://discord-themes.com/api/126"
    "https://discord-themes.com/api/129"
    "https://discord-themes.com/api/128"
  ];
in {
  xdg.configFile = let
    inherit (builtins) toJSON;
  in {
    "vesktop/settings/settings.json".text = toJSON {
      autoUpdate = false;
      autoUpdateNotification = false;
      disableMinSize = true;
      eagerPatches = false;
      enableReactDevtools = true;
      enabledThemeLinks = themes;
      enabledThemes = [];
      frameless = false;
      ignoreResetWarning = false;
      notifications = {
        logLimit = 50;
        position = "bottom-right";
        timeout = 5000;
        useNative = "not-focused";
      };
      plugins = lib'.discord.mkEnabledPluginsFromList plugins;
      themeLinks = themes;
      transparent = true;
      updateRelaunch = false;
      useQuickCss = true;
      userCssVars = {};
      winCtrlQ = false;
      winNativeTitleBar = false;
    };
    "vesktop/settings.json".text = toJSON {
      discordBranch = "stable";
      tray = true;
      minimizeToTray = true;
      arRPC = true;
      trayColor = config.theme.colors.accent;
      trayMainOverride = false;
      splashColor = "#${config.theme.colors.text}";
      splashBackground = "#${config.theme.colors.surface1}";
      trayColorType = "custom";
      trayAutoFill = "auto";
      disableMinSize = true;
      splashAnimationPath = "${config.home.homeDirectory}/.face";
      splashProgress = true;
    };
  };

  home.packages = with pkgs; [
    vesktop
  ];
}
