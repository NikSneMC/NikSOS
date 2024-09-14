{
  config,
  inputs,
  lib,
  ...
}: let
  plugins = {
    user = {
      wakatime = {
        source = "github:wakatime/vencord-wakatime/f508defde2f33217c3fe28fa821d1aee525443f4";
        settings = {
          apiKey = lib.trim (lib.last (builtins.split "=" (builtins.readFile "${config.home.homeDirectory}/.wakatime.cfg")));
          machineName = config.home.host;
          lowerNamed = true;
        };
      };
    };
    discord = [];
    vesktop = [
      "webKeybinds"
      "webScreenShareFixes"
    ];
    vencord = [
      "betterGifAltText"
      "betterGifPicker"
      { name = "betterNotesBox"; hide = true; }
      { name = "betterRoleContext"; roleIconFileFormat = "webp"; }
      { name = "betterRoleDot"; copyRoleColorInProfilePopout = true; }
      { name = "betterSessions"; backgroundCheck = true; }
      "betterSettings"
      "betterUploadButton"
      "biggerStreamPreview"
      "blurNSFW"
      { name = "callTimer"; format = "human"; }
      "chatInputButtonAPI"
      "clearURLs"
      { name = "consoleJanitor"; disableNoisyLoggers = true; }
      "consoleShortcuts"
      "copyEmojiMarkdown"
      "copyUserURLs"
      "dearrow"
      "decor"
      "disableCallIdle"
      "dontRoundMyTimestamps"
      "emoteCloner"
      { name = "experiments"; toolbarDevMenu = true; }
      "favoriteEmojiFirst"
      "favoriteGifSearch"
      "fixCodeblockGap"
      "fixSpotifyEmbeds"
      "fixYoutubeEmbeds"
      "forceOwnerCrown"
      "friendInvites"
      "friendsSince"
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
      { name = "messageLatency"; showMillis = true; }
      "messageLinkEmbeds"
      { name = "messageLogger"; deleteStyle = "overlay"; }
      "messageTags"
      "messageUpdaterAPI"
      "moreCommands"
      "moreKaomoji"
      { name = "moyai"; ignoreBots = false; quality = "HD"; triggerWhenUnfocused = false; }
      "mutualGroupDMs"
      "noBlockedMessages"
      "noDefaultHangStatus"
      "noDevtoolsWarning"
      "noF1"
      "noOnboardingDelay"
      "normalizeMessageLinks"
      "notificationVolume"
      "noTypingAnimation"
      "noUnblockToJump"
      "nsfwGateBypass"
      { name = "openInApp"; spotify = false; }
      "pauseInvitesForever"
      "permissionFreeWill"
      "permissionsViewer"
      "petpet"
      "pictureInPicture"
      "platformIndicators"
      "previewMessage"
      "pronounDB"
      "quickMention"
      "quickReply"
      "reactErrorDecoder"
      "readAllNotificationsButton"
      { name = "relationshipNotifier"; notices = true; }
      "replaceGoogleSearch"
      "replyTimestamp"
      "revealAllSpoilers"
      "reverseImageSearch"
      "reviewDB"
      "roleColorEverywhere"
      "searchReply"
      "secretRingToneEnabler"
      "sendTimestamps"
      "serverInfo"
      "serverListIndicators"
      { name = "shikiCodeblocks"; theme = "https://esm.sh/@catppuccin/vscode/themes/${config.theme.flavor}.json"; }
      "showConnections"
      { name = "showHiddenChannels"; showMode = "muted"; }
      "showHiddenThings"
      { name = "showMeYourName"; mode = "nick-user"; }
      "showTimeoutDuration"
      { name = "silentMessageToggle"; autoDisable = false; persistState = true; }
      { name = "silentTyping"; showIcon = true; }
      { name = "sortFriendRequests"; showDates = true; }
      "spotifyControls"
      { name = "spotifyCrack"; keepSpotifyActivityOnIdle = true; }
      "spotifyShareCommands"
      "startupTimings"
      "streamerModeOnStream"
      "superReactionTweaks"
      "themeAttributes"
      "timeBarAllActivities"
      "translate"
      { name = "typingIndicator"; includeMutedChannels = true; }
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
      "whoReacted"
      "youtubeAdblock"
    ];
  };

  mkEnabledPluginsFromList = plugins: builtins.listToAttrs (builtins.map (
    plugin: let
      value = { enable = true; };
    in if builtins.isString plugin then {
      name = plugin;
      inherit value;
    } else {
      inherit (plugin) name;
      value = (builtins.removeAttrs plugin [ "name" ]) // value;
    })
    plugins
  );
  mkUserPlugins = p: builtins.mapAttrs (name: { settings ? {}, ... }: settings) (lib.filterAttrs (_: { platform ? "vencord", ... }: platform == p) plugins.user);
in {
  imports = [ inputs.nixcord.homeManagerModules.nixcord ];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    config = {
      themeLinks = [ "https://catppuccin-discord.niksne.ru/catppuccin-${config.theme.flavor}-${config.theme.accent}.theme.css" ];
      enableReactDevtools = true;
      useQuickCss = true;
      plugins = (mkEnabledPluginsFromList plugins.vencord);
    };
    userPlugins = builtins.mapAttrs (_: { source, ...}: source) plugins.user;
    parseRules.lowerPluginTitles = lib.mapAttrsToList (name: _: name) (lib.filterAttrs (_: { lowerNamed ? false, ... }: lowerNamed) plugins.user);
    extraConfig.plugins = mkUserPlugins "vencord";
    vencordConfig.plugins = (mkEnabledPluginsFromList plugins.discord) // (mkUserPlugins "discord");
    vesktopConfig.plugins = (mkEnabledPluginsFromList plugins.vesktop) // (mkUserPlugins "vesktop");
  };
}

