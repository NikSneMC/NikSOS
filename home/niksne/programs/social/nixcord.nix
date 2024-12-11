{
  config,
  inputs,
  lib,
  ...
}: let
  plugins = {
    user = {};
    discord = [];
    vesktop = [
      "webKeybinds"
      "webScreenShareFixes"
    ];
    vencord = [
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
      # "decor" # TODO: re-enable when fixed
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
  };

  mkEnabledPluginsFromList = plugins:
    plugins
    |> map (
      plugin: {enable = true;}
      |> (value: 
        if builtins.isString plugin
        then {
          name = plugin;
          inherit value;
        }
        else {
          inherit (plugin) name;
          value = (builtins.removeAttrs plugin ["name"]) // value;
        }
      )
    )
    |> builtins.listToAttrs;

  mkUserPlugins = p:
    (_: {platform ? "vencord", ...}: platform == p)
    |> (condition: lib.filterAttrs condition plugins.user)
    |> builtins.mapAttrs (_: {settings ? {}, ...}: settings // {enable = true;});
in {
  imports = [inputs.nixcord.homeManagerModules.nixcord];

  programs.nixcord = {
    enable = true;
    discord.enable = true;
    vesktop.enable = true;
    config = {
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-${config.theme.flavor}-${config.theme.accent}.theme.css"
        "https://raw.githubusercontent.com/NikSneMC/vesktop-jetbrainsmono-nerd-font-theme/main/font.css"
      ];
      enableReactDevtools = true;
      useQuickCss = true;
      plugins = mkEnabledPluginsFromList plugins.vencord;
    };
    userPlugins = builtins.mapAttrs (_: {source, ...}: source) plugins.user;
    parseRules.lowerPluginTitles = plugins.user
      |> lib.filterAttrs (_: {lowerNamed ? false, ...}: lowerNamed)
      |> lib.mapAttrsToList (name: _: name);
    extraConfig.plugins = mkUserPlugins "vencord";
    vencordConfig.plugins = (mkEnabledPluginsFromList plugins.discord) // (mkUserPlugins "discord");
    vesktopConfig.plugins = (mkEnabledPluginsFromList plugins.vesktop) // (mkUserPlugins "vesktop");
  };
}
