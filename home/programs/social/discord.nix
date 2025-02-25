{
  config,
  lib',
  pkgs,
  ...
}: let
  plugins = [
    {
      name = "AccountPanelServerProfile";
      prioritizeServerProfile = true;
    }
    {
      name = "AllCallTimers";
      format = "human";
      showRoleColor = true;
      showSeconds = true;
      showWithoutHover = false;
      trackSelf = true;
      watchLargeGuilds = false;
    }
    {
      name = "AnonymiseFileNames";
      anonymiseByDefault = true;
      consistent = "image";
      method = 0;
      randomisedLength = 7;
    }
    {
      name = "BetterActivities";
      allActivitiesStyle = "carousel";
      iconSize = 15;
      memberList = true;
      renderGifs = true;
      showAppDescriptions = true;
      specialFirst = true;
    }
    {
      name = "BetterAudioPlayer";
      forceMoveBelow = true;
      oscilloscope = true;
      oscilloscopeColor = "255, 255, 255";
      oscilloscopeSolidColor = false;
      spectrograph = true;
      spectrographColor = "33, 150, 243";
      spectrographSolidColor = false;
    }
    "BetterGifAltText"
    "BetterGifPicker"
    "BetterInvites"
    {
      name = "BetterNotesBox";
      hide = true;
      noSpellCheck = false;
    }
    "BetterPlusReacts"
    {
      name = "BetterQuickReact";
      columns = 4;
      compactMode = false;
      frequentEmojis = true;
      rows = 2;
      scroll = true;
    }
    {
      name = "BetterRoleContext";
      roleIconFileFormat = "png";
    }
    {
      name = "BetterRoleDot";
      bothStyles = false;
      copyRoleColorInProfilePopout = false;
    }
    {
      name = "BetterSessions";
      backgroundCheck = true;
      checkInterval = 20;
    }
    "BetterUploadButton"
    "BetterUserArea"
    "BiggerStreamPreview"
    {
      name = "BlurNSFW";
      blurAmount = 10;
    }
    {
      name = "CallTimer";
      format = "human";
    }
    {
      name = "CharacterCounter";
      colorEffects = true;
      position = false;
    }
    "ChatInputButtonAPI"
    "ClearURLs"
    {
      name = "CommandPalette";
      allowMouseControl = true;
      hotkey = [
        "control"
        "shift"
      ];
    }
    "CommandsAPI"
    {
      name = "ConsoleJanitor";
      disableLoggers = false;
      disableSpotifyLogger = true;
      whitelistedLoggers = "GatewaySocket; Routing/Utils";
    }
    "ConsoleShortcuts"
    "ContextMenuAPI"
    {
      name = "CopyEmojiMarkdown";
      copyUnicode = true;
    }
    "CopyFileContents"
    "CopyUserMention"
    "CopyUserURLs"
    {
      name = "CrashHandler";
      attemptToNavigateToHome = false;
      attemptToPreventCrashes = true;
    }
    {
      name = "CustomUserColors";
      colorInServers = true;
      dmList = true;
    }
    "DeadMembers"
    {
      name = "Dearrow";
      dearrowByDefault = true;
      hideButton = false;
      replaceElements = 0;
    }
    {
      name = "Decor";
      baseUrl = "https://decor.fieryflames.dev";
    }
    "DisableCallIdle"
    "DisableCameras"
    "DontFilterMe"
    "DontRoundMyTimestamps"
    "DynamicImageModalAPI"
    "EmojiDumper"
    "EmoteCloner"
    "EquicordHelper"
    {
      name = "Experiments";
      toolbarDevMenu = true;
    }
    "ExportContacts"
    "FavoriteEmojiFirst"
    {
      name = "FindReply";
      hideButtonIfNoReply = true;
      includeAuthor = true;
      includePings = true;
    }
    "FixCodeblockGap"
    "FixFileExtensions"
    "FixImagesQuality"
    {
      name = "FixSpotifyEmbeds";
      volume = 10;
    }
    "FixYoutubeEmbeds"
    {
      name = "FontLoader";
      applyOnClodeBlocks = true;
      selectedFont = "JetBrains Mono";
    }
    "ForceOwnerCrown"
    "FrequentQuickSwitcher"
    "FriendInvites"
    "FriendTags"
    "FriendsSince"
    "FriendshipRanks"
    "FullSearchContext"
    "FullUserInChatbox"
    {
      name = "GameActivityToggle";
      oldIcon = false;
    }
    "GifPaste"
    {
      name = "Glide";
      Accent = "313338";
      Brand = "ffffff";
      ColorPreset = 0;
      Primary = "000000";
      Text = "ffffff";
      animationSpeed = "0.2";
      customFont = "JetBrains Mono";
      memberListAnim = true;
      pastelStatuses = true;
      privacyBlur = false;
      serverListAnim = false;
      tooltips = false;
    }
    "GodMode"
    {
      name = "GoogleThat";
      defaultEngine = "DuckDuckGo";
      hyperlink = true;
    }
    {
      name = "GreetStickerPicker";
      greetMode = "Greet";
    }
    {
      name = "HideServers";
      showIndicator = true;
    }
    "HolyNotes"
    "HomeTyping"
    "IRememberYou"
    "ImageLink"
    {
      name = "ImagePreview";
      defaultMaxSize = "0";
      fileInformation = true;
      fixedImage = false;
      hoverDelay = 0.5;
      messageAvatars = true;
      messageImages = true;
      messageLinks = true;
      messageStickers = true;
      mouseOnlyMode = false;
      zoomFactor = 1.5;
    }
    "ImageZoom"
    "ImgToGif"
    {
      name = "ImplicitRelationships";
      sortByAffinity = true;
    }
    "InRole"
    "JumpToStart"
    "KeepCurrentChannel"
    {
      name = "LimitMiddleClickPaste";
      limitTo = "active";
      reenableDelay = 500;
    }
    {
      name = "LoadingQuotes";
      additionalQuotes = "";
      additionalQuotesDelimiter = "|";
      enableDiscordPresetQuotes = false;
      enablePluginPresetQuotes = true;
      replaceEvents = true;
    }
    "LoginWithQR"
    {
      name = "MediaDownloader";
      defaultGifQuality = 3;
      showFfmpegWarning = true;
      showProgress = true;
    }
    {
      name = "MediaPlaybackSpeed";
      defaultAudioSpeed = 1;
      defaultVideoSpeed = 1;
      defaultVoiceMessageSpeed = 1;
    }
    {
      name = "MemberCount";
      memberList = true;
      toolTip = true;
    }
    "MemberListDecoratorsAPI"
    {
      name = "MentionAvatars";
      value = {
        enabled = true;
        showAtSymbol = true;
      };
    }
    "MessageAccessoriesAPI"
    {
      name = "MessageBurst";
      shouldMergeWithAttachment = false;
      timePeriod = 3;
    }
    {
      name = "MessageClickActions";
      enableDeleteOnClick = true;
      enableDoubleClickToEdit = true;
      enableDoubleClickToReply = true;
      requireModifier = false;
    }
    "MessageDecorationsAPI"
    "MessageEventsAPI"
    {
      name = "MessageLatency";
      detectDiscordKotlin = true;
      latency = 2;
      showMillis = true;
    }
    {
      name = "MessageLinkTooltip";
      display = "auto";
      onForward = true;
      onLink = true;
      onReply = true;
    }
    {
      name = "MessageLogger";
      collapseDeleted = false;
      deleteStyle = "text";
      ignoreBots = false;
      ignoreChannels = "";
      ignoreGuilds = "";
      ignoreSelf = false;
      ignoreUsers = "";
      logDeletes = true;
      logEdits = true;
    }
    {
      name = "MessageLoggerEnhanced";
      ShowLogsButton = true;
      alwaysLogCurrentChannel = true;
      alwaysLogDirectMessages = true;
      attachmentFileExtensions = "png,jpg,jpeg,gif,webp,mp4,webm,mp3,ogg,wav";
      attachmentSizeLimitInMegabytes = 12;
      blacklistedIds = "";
      cacheLimit = 1000;
      cacheMessagesFromServers = false;
      hideMessageFromMessageLoggers = false;
      hideMessageFromMessageLoggersDeletedMessage = "redacted eh";
      ignoreBots = false;
      ignoreMutedCategories = false;
      ignoreMutedChannels = false;
      ignoreMutedGuilds = true;
      ignoreSelf = false;
      imageCacheDir = "${config.xdg.configHome}/equibop/MessageLoggerData/savedImages";
      logsDir = "${config.xdg.configHome}/equibop/MessageLoggerData";
      messageLimit = 200;
      messagesToDisplayAtOnceInLogs = 100;
      permanentlyRemoveLogByDefault = false;
      saveImages = true;
      saveMessages = true;
      sortNewest = true;
      whitelistedIds = "";
    }
    "MessagePopoverAPI"
    "MessageUpdaterAPI"
    "ModalFade"
    "MoreCommands"
    "MoreKaomoji"
    {
      name = "Moyai";
      ignoreBlocked = true;
      ignoreBots = true;
      quality = "Normal";
      triggerWhenUnfocused = true;
      volume = 0.5;
    }
    "MutualGroupDMs"
    "NSFWGateBypass"
    "NeverPausePreviews"
    "NewPluginsManager"
    "NoAppsAllowed"
    "NoDevtoolsWarning"
    "NoF1"
    "NoMirroredCamera"
    "NoModalAnimation"
    "NoNitroUpsell"
    "NoOnboardingDelay"
    {
      name = "NoTrack";
      disableAnalytics = true;
    }
    "NoUnblockToJump"
    "NormalizeMessageLinks"
    "NotificationTitle"
    {
      name = "NotificationVolume";
      notificationVolume = 100;
    }
    "PauseInvitesForever"
    {
      name = "PermissionFreeWill";
      lockout = true;
      onboarding = true;
    }
    {
      name = "PermissionsViewer";
      permissionsSortOrder = 0;
    }
    {
      name = "PictureInPicture";
      loop = true;
    }
    "PinIcon"
    {
      name = "PlatformIndicators";
      ConsoleIcon = "equicord";
      badges = true;
      colorMobileIndicator = true;
      list = true;
      messages = true;
      showBots = true;
    }
    {
      name = "PlatformSpoofer";
      platform = "desktop";
    }
    "PreviewMessage"
    "PurgeMessages"
    "QuestCompleter"
    "QuickMention"
    {
      name = "Quoter";
      userIdentifier = 0;
    }
    "ReactErrorDecoder"
    "ReadAllNotificationsButton"
    {
      name = "RelationshipNotifier";
      friendRequestCancels = true;
      friends = true;
      groups = true;
      notices = true;
      offlineRemovals = true;
      servers = true;
    }
    "RepeatMessage"
    "ReplyTimestamp"
    "RevealAllSpoilers"
    "ReverseImageSearch"
    {
      name = "ReviewDB";
      hideBlockedUsers = true;
      hideTimestamps = false;
      notifyReviews = true;
      showWarning = true;
    }
    {
      name = "RoleColorEverywhere";
      chatMentions = true;
      colorChatMessages = false;
      memberList = true;
      messageSaturation = 30;
      pollResults = true;
      reactorsList = true;
      voiceUsers = true;
    }
    "ScreenRecorder"
    "SearchFix"
    {
      name = "SecretRingToneEnabler";
      onlySnow = false;
    }
    {
      name = "SendTimestamps";
      replaceMessageContents = true;
    }
    {
      name = "ServerInfo";
      sorting = "displayname";
    }
    "ServerListAPI"
    {
      name = "ServerListIndicators";
      mode = 2;
      useCompact = true;
    }
    "ServerSearch"
    {
      name = "Settings";
      settingsLocation = "bottom";
    }
    {
      name = "ShikiCodeblocks";
      theme = "https://esm.sh/@catppuccin/vscode/themes/${config.theme.flavor}.json";
      useDevIcon = "GREYSCALE";
    }
    {
      name = "ShowBadgesInChat";
      DiscordNitroPosition = 0;
      DiscordProfilePosition = 1;
      EquicordContributorPosition = 3;
      EquicordDonorPosition = 2;
      VencordContributorPosition = 5;
      VencordDonorPosition = 4;
      showDiscordNitro = true;
      showDiscordProfile = true;
      showEquicordContributor = false;
      showEquicordDonor = false;
      showVencordContributor = false;
      showVencordDonor = false;
    }
    {
      name = "ShowConnections";
      iconSize = 32;
      iconSpacing = 1;
    }
    {
      name = "ShowHiddenChannels";
      channelStyle = 0;
      defaultAllowedUsersAndRolesDropdownState = true;
      showMode = 0;
    }
    {
      name = "ShowHiddenThings";
      showInvitesPaused = true;
      showModView = true;
      showTimeouts = true;
    }
    {
      name = "ShowMeYourName";
      displayNames = false;
      inReplies = true;
      mode = "nick-user";
      preferFriend = true;
    }
    {
      name = "ShowTimeoutDuration";
      displayStyle = "ssalggnikool";
    }
    "SidebarChat"
    {
      name = "SilentTyping";
      blockAllIsTyping = false;
      blockAllTypingIndicators = false;
      blockEverything = false;
      contextMenu = true;
      isEnabled = true;
      showIcon = false;
    }
    {
      name = "SortFriendRequests";
      showDates = true;
    }
    {
      name = "SoundBoardLogger";
      FileType = ".ogg";
      IconLocation = "toolbar";
      soundVolume = 0.5;
    }
    {
      name = "SpotifyControls";
      hoverControls = false;
      previousButtonRestartsTrack = true;
      useSpotifyUris = false;
    }
    {
      name = "SpotifyCrack";
      keepSpotifyActivityOnIdle = false;
      noSpotifyAutoPause = true;
    }
    "SpotifyShareCommands"
    "StartupTimings"
    "StatusPresets"
    "StickerPaste"
    "StreamerModeOn"
    {
      name = "SuperReactionTweaks";
      superReactByDefault = true;
      superReactionPlayingLimit = 20;
      unlimitedSuperReactionPlaying = false;
    }
    "SupportHelper"
    "ThemeAttributes"
    {
      name = "Timezones";
      "24h Time" = true;
      showMessageHeaderTime = true;
      showProfileTime = true;
    }
    {
      name = "Translate+";
      shavian = true;
      sitelen = true;
      target = "ru";
      toki = true;
    }
    {
      name = "TypingIndicator";
      includeBlockedUsers = false;
      includeCurrentChannel = true;
      includeMutedChannels = false;
      indicatorMode = 3;
    }
    {
      name = "TypingTweaks";
      alternativeFormatting = true;
      showAvatars = true;
      showRoleColors = true;
    }
    {
      name = "USRBG";
      nitroFirst = true;
      voiceBackground = true;
    }
    "Unindent"
    {
      name = "UnlimitedAccounts";
      maxAccounts = 0;
    }
    {
      name = "UnlockedAvatarZoom";
      zoomMultiplier = 4;
    }
    {
      name = "UserMessagesPronouns";
      pronounsFormat = "LOWERCASE";
      showSelf = true;
    }
    {
      name = "UserPFP";
      databaseToUse = "https://userpfp.github.io/UserPFP/source/data.json";
      preferNitro = true;
    }
    "UserSettingsAPI"
    {
      name = "UserVoiceShow";
      showInMemberList = true;
      showInMessages = true;
      showInUserProfileModal = true;
    }
    "VCSupport"
    "ValidReply"
    "ValidUser"
    {
      name = "VideoSpeed";
      preservePitch = false;
    }
    {
      name = "ViewIcons";
      format = "webp";
      imgSize = "1024";
    }
    {
      name = "ViewRaw";
      clickMethod = "Left";
    }
    "ViewRawVariant"
    "VoiceChatDoubleClick"
    {
      name = "VoiceChatUtilities";
      waitAfter = 5;
      waitSeconds = 2;
    }
    "VoiceDownload"
    {
      name = "VoiceMessages";
      echoCancellation = true;
      noiseSuppression = true;
    }
    {
      name = "VolumeBooster";
      multiplier = 5;
    }
    {
      name = "WebContextMenus";
      addBack = true;
    }
    "WebKeybinds"
    "WebScreenShareFixes"
    "WebpackTarball"
    {
      name = "WhoReacted";
      avatarClick = false;
    }
    {
      name = "WhosWatching";
      showPanel = true;
    }
    "WriteUpperCase"
    "YoutubeAdblock"
    "YoutubeDescription"
    "petpet"
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
    "equibop/settings/settings.json".text = toJSON {
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
    "equibop/settings.json".text = toJSON {
      discordBranch = "stable";
      tray = true;
      minimizeToTray = true;
      arRPC = true;
      trayColor = config.theme.colors.accent;
      trayMainOverride = false;
      splashColor = "#${config.theme.colors.text}";
      splashBackground = "#${config.theme.colors.base}";
      trayColorType = "custom";
      trayAutoFill = "auto";
      disableMinSize = true;
      splashAnimationPath = "${config.home.homeDirectory}/.face";
    };
  };

  home.packages = with pkgs; [
    equibop
  ];
}
