{
  config,
  inputs,
  lib,
  ...
}: let
  mkEnabledPlugins = plugins: lib.mapAttrs (plugin: settings: settings // { enable = true; }) plugins;
  mkEnabledPluginsFromList = plugins: lib.genAttrs plugins (plugin: { enable = true; });
in {
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    vesktopConfig.plugins = mkEnabledPluginsFromList [
      "webKeybinds"
      "webScreenShareFixes"
    ];
    config = {
      themeLinks = [ "https://catppuccin-discord.niksne.ru/catppuccin-${config.theme.flavor}-${config.theme.accent}.theme.css" ];
      enableReactDevtools = true;
      useQuickCss = true;
      plugins = (mkEnabledPlugins {
        betterNotesBox.hide = true;
        betterRoleContext.roleIconFileFormat = "webp";
        betterRoleDot.copyRoleColorInProfilePopout = true;
        betterSessions.backgroundCheck = true;
        callTimer.format = "human";
        consoleJanitor.disableNoisyLoggers = true;
        experiments.toolbarDevMenu = true;
        messageLatency.showMillis = true;
        messageLogger.deleteStyle = "overlay";
        moyai = {
          ignoreBots = false;
          quality = "HD";
          triggerWhenUnfocused = false;
        };
        openInApp.spotify = false;
        relationshipNotifier.notices = true;
        shikiCodeblocks.theme = "https://esm.sh/@catppuccin/vscode/themes/${config.theme.flavor}.json";
        showHiddenChannels.showMode = "muted";
        showMeYourName.mode = "nick-user";
        silentMessageToggle = {
          autoDisable = false;
          persistState = true;
        };
        silentTyping.showIcon = true;
        sortFriendRequests.showDates = true;
        spotifyCrack.keepSpotifyActivityOnIdle = true;
        typingIndicator.includeMutedChannels = true;
      }) // (mkEnabledPluginsFromList [
        # "AI Noise Suppression"
        "betterGifAltText"
        "betterGifPicker"
        "betterSettings"
        "betterUploadButton"
        "biggerStreamPreview"
        "blurNSFW"
        "chatInputButtonAPI"
        "clearURLs"
        "consoleShortcuts"
        "copyEmojiMarkdown"
        "copyUserURLs"
        "dearrow"
        "decor"
        "disableCallIdle"
        "dontRoundMyTimestamps"
        "emoteCloner"
        "favoriteEmojiFirst"
        "favoriteGifSearch"
        "fixCodeblockGap"
        # "fixImagesQuality"
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
        "messageLinkEmbeds"
        "messageTags"
        "messageUpdaterAPI"
        "moreCommands"
        "moreKaomoji"
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
        "showConnections"
        "showHiddenThings"
        "showTimeoutDuration"
        "spotifyControls"
        "spotifyShareCommands"
        "startupTimings"
        "streamerModeOnStream"
        "superReactionTweaks"
        "themeAttributes"
        "timeBarAllActivities"
        "translate"
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
        # "wikisearch"
        "youtubeAdblock"
      ]);
    };
  };
}
