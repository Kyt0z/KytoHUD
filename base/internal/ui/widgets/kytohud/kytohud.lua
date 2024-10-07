require 'base/internal/ui/reflexcore'

local kyto_armor_font = FONT_HUD
local kyto_deathMessages_font = FONT_HUD
local kyto_followingPlayer_font = FONT_HUD
local kyto_fragMessage_font = FONT_HUD
local kyto_gameMessages_font = FONT_HUD
local kyto_gameModeAndMap_font = FONT_HUD
local kyto_gameTimer_font = FONT_HUD
local kyto_pickupTimers_font = FONT_HUD
local kyto_health_font = FONT_HUD
local kyto_ionBurstAcc_font = FONT_HUD
local kyto_powerups_font = FONT_HUD
local kyto_readyUpStatus_font = FONT_HUD
local kyto_scores_font = FONT_HUD
local kyto_teamInfo_font = FONT_TEXT2
local kyto_weaponAccuracies_font = FONT_HUD
local kyto_weaponList_font = FONT_HUD

-- Melee, Burst Gun, Shotgun, Grenade Launcher, Plasma Rifle,
-- Rocket Launcher, Ion Cannon, Bolt Rifle, Stake Launcher
local kyto_ammoCountLow = {0, 5, 5, 5, 50, 5, 50, 3, 5}
local kyto_ammoCountMed = {0, 10, 10, 10, 100, 10, 100, 5, 10}

-- killMessages
local killMessages = {}
killMessages[DAMAGE_TYPE_MELEE] = '%s meleed %s'
killMessages[DAMAGE_TYPE_BURST] = '%s bursted %s'
killMessages[DAMAGE_TYPE_SHELL] = '%s gunned down %s'
killMessages[DAMAGE_TYPE_GRENADE] = '%s pineappled %s'
killMessages[DAMAGE_TYPE_PLASMA] = '%s plasmaed %s'
killMessages[DAMAGE_TYPE_ROCKET] = '%s exploded %s'
killMessages[DAMAGE_TYPE_BEAM] = '%s melted %s'
killMessages[DAMAGE_TYPE_BOLT] = '%s railed %s'
killMessages[DAMAGE_TYPE_STAKE] = '%s crucified %s'
killMessages[DAMAGE_TYPE_TELEFRAG] = '%s telefragged %s'

-- suicideMessages
local suicideMessages = {}
suicideMessages[DAMAGE_TYPE_GRENADE] = '%s tripped on his own grenade'
suicideMessages[DAMAGE_TYPE_PLASMA] = '%s plasmaed themself'
suicideMessages[DAMAGE_TYPE_ROCKET] = '%s exploded themself'
suicideMessages[DAMAGE_TYPE_LAVA] = '%s was deep fried'
suicideMessages[DAMAGE_TYPE_DROWN] = '%s drowned'
suicideMessages[DAMAGE_TYPE_OUTOFWORLD] = '%s fell out of the world'
suicideMessages[DAMAGE_TYPE_OVERTIME] = '%s waited too long'
suicideMessages[DAMAGE_TYPE_SUICIDE] = '%s suicided'

-- killIcons
local killIcons = {}
killIcons[DAMAGE_TYPE_MELEE] = 'internal/ui/icons/weapon1'
killIcons[DAMAGE_TYPE_BURST] = 'internal/ui/icons/weapon2'
killIcons[DAMAGE_TYPE_SHELL] = 'internal/ui/icons/weapon3'
killIcons[DAMAGE_TYPE_GRENADE] = 'internal/ui/icons/weapon4'
killIcons[DAMAGE_TYPE_PLASMA] = 'internal/ui/icons/weapon5'
killIcons[DAMAGE_TYPE_ROCKET] = 'internal/ui/icons/weapon6'
killIcons[DAMAGE_TYPE_BEAM] = 'internal/ui/icons/weapon7'
killIcons[DAMAGE_TYPE_BOLT] = 'internal/ui/icons/weapon8'
killIcons[DAMAGE_TYPE_STAKE] = 'internal/ui/icons/weapon9'
killIcons[DAMAGE_TYPE_TELEFRAG] = 'internal/ui/icons/teleporter'

-- suicideIcons
local suicideIcons = {}
suicideIcons[DAMAGE_TYPE_GRENADE] = 'internal/ui/icons/weapon4'
suicideIcons[DAMAGE_TYPE_PLASMA] = 'internal/ui/icons/weapon5'
suicideIcons[DAMAGE_TYPE_ROCKET] = 'internal/ui/icons/weapon6'
suicideIcons[DAMAGE_TYPE_LAVA] = 'internal/ui/icons/lava'
suicideIcons[DAMAGE_TYPE_DROWN] = 'internal/ui/icons/drown'
suicideIcons[DAMAGE_TYPE_OUTOFWORLD] = 'internal/ui/icons/falling'
suicideIcons[DAMAGE_TYPE_OVERTIME] = 'internal/ui/icons/skull'
suicideIcons[DAMAGE_TYPE_SUICIDE] = 'internal/ui/icons/skull'

local toastyWindow = 3000

-- fallback color for technical reasons
local otherColor = Color(255, 255, 0)

-- valid countries
local kyto_validCountries = {
   ['ad'] = true, ['ae'] = true, ['af'] = true, ['ag'] = true, ['ai'] = true, ['al'] = true,
   ['am'] = true, ['ao'] = true, ['aq'] = true, ['ar'] = true, ['as'] = true, ['at'] = true,
   ['au'] = true, ['aw'] = true, ['ax'] = true, ['az'] = true, ['ba'] = true, ['bb'] = true,
   ['bd'] = true, ['be'] = true, ['bf'] = true, ['bg'] = true, ['bh'] = true, ['bi'] = true,
   ['bj'] = true, ['bl'] = true, ['bm'] = true, ['bn'] = true, ['bo'] = true, ['bot'] = true,
   ['bq'] = true, ['br'] = true, ['bs'] = true, ['bt'] = true, ['bv'] = true, ['bw'] = true,
   ['by'] = true, ['bz'] = true, ['ca'] = true, ['cc'] = true, ['cd'] = true, ['cf'] = true,
   ['cg'] = true, ['ch'] = true, ['ci'] = true, ['ck'] = true, ['cl'] = true, ['cm'] = true,
   ['cn'] = true, ['co'] = true, ['cr'] = true, ['cu'] = true, ['cv'] = true, ['cw'] = true,
   ['cx'] = true, ['cy'] = true, ['cz'] = true, ['de'] = true, ['dj'] = true, ['dk'] = true,
   ['dm'] = true, ['do'] = true, ['dz'] = true, ['ec'] = true, ['ee'] = true, ['eg'] = true,
   ['eh'] = true, ['er'] = true, ['es'] = true, ['et'] = true, ['fi'] = true, ['fj'] = true,
   ['fk'] = true, ['fm'] = true, ['fo'] = true, ['fr'] = true, ['ga'] = true, ['gb'] = true,
   ['gd'] = true, ['ge'] = true, ['gf'] = true, ['gg'] = true, ['gh'] = true, ['gi'] = true,
   ['gl'] = true, ['gm'] = true, ['gn'] = true, ['gp'] = true, ['gq'] = true, ['gr'] = true,
   ['gs'] = true, ['gt'] = true, ['gu'] = true, ['gw'] = true, ['gy'] = true, ['hk'] = true,
   ['hm'] = true, ['hn'] = true, ['hr'] = true, ['ht'] = true, ['hu'] = true, ['id'] = true,
   ['ie'] = true, ['il'] = true, ['im'] = true, ['in'] = true, ['io'] = true, ['iq'] = true,
   ['ir'] = true, ['is'] = true, ['it'] = true, ['je'] = true, ['jm'] = true, ['jo'] = true,
   ['jp'] = true, ['ke'] = true, ['kg'] = true, ['kh'] = true, ['ki'] = true, ['km'] = true,
   ['kn'] = true, ['kp'] = true, ['kr'] = true, ['kw'] = true, ['ky'] = true, ['kz'] = true,
   ['la'] = true, ['lb'] = true, ['lc'] = true, ['li'] = true, ['lk'] = true, ['lr'] = true,
   ['ls'] = true, ['lt'] = true, ['lu'] = true, ['lv'] = true, ['ly'] = true, ['ma'] = true,
   ['mc'] = true, ['md'] = true, ['me'] = true, ['mf'] = true, ['mg'] = true, ['mh'] = true,
   ['mk'] = true, ['ml'] = true, ['mm'] = true, ['mn'] = true, ['mo'] = true, ['mp'] = true,
   ['mq'] = true, ['mr'] = true, ['ms'] = true, ['mt'] = true, ['mu'] = true, ['mv'] = true,
   ['mw'] = true, ['mx'] = true, ['my'] = true, ['mz'] = true, ['na'] = true, ['nc'] = true,
   ['ne'] = true, ['nf'] = true, ['ng'] = true, ['ni'] = true, ['nl'] = true, ['no'] = true,
   ['np'] = true, ['nr'] = true, ['nu'] = true, ['nz'] = true, ['om'] = true, ['pa'] = true,
   ['pe'] = true, ['pf'] = true, ['pg'] = true, ['ph'] = true, ['pk'] = true, ['pl'] = true,
   ['pm'] = true, ['pn'] = true, ['pr'] = true, ['ps'] = true, ['pt'] = true, ['pw'] = true,
   ['py'] = true, ['qa'] = true, ['re'] = true, ['ro'] = true, ['rs'] = true, ['ru'] = true,
   ['rw'] = true, ['sa'] = true, ['sb'] = true, ['sc'] = true, ['sct'] = true, ['sd'] = true,
   ['se'] = true, ['sg'] = true, ['sh'] = true, ['si'] = true, ['sj'] = true, ['sk'] = true,
   ['sl'] = true, ['sm'] = true, ['sn'] = true, ['so'] = true, ['sr'] = true, ['ss'] = true,
   ['st'] = true, ['sv'] = true, ['sx'] = true, ['sy'] = true, ['sz'] = true, ['tc'] = true,
   ['td'] = true, ['tf'] = true, ['tg'] = true, ['th'] = true, ['tj'] = true, ['tk'] = true,
   ['tl'] = true, ['tm'] = true, ['tn'] = true, ['to'] = true, ['tr'] = true, ['tt'] = true,
   ['tv'] = true, ['tw'] = true, ['tz'] = true, ['ua'] = true, ['ug'] = true, ['um'] = true,
   ['us'] = true, ['uy'] = true, ['uz'] = true, ['va'] = true, ['vc'] = true, ['ve'] = true,
   ['vg'] = true, ['vi'] = true, ['vn'] = true, ['vu'] = true, ['wf'] = true, ['ws'] = true,
   ['ye'] = true, ['yt'] = true, ['za'] = true, ['zm'] = true, ['zw'] = true, ['zz'] = true,
}

----------------------------------------------------------------------------------------------------
-- Global variables (do n0t touch)
----------------------------------------------------------------------------------------------------

local kyto_killColors = {}
local kyto_suicideColors = {}
local kyto_warmupTimeElapsed = 0

local kyto_confirmDefaults = false
local kyto_confirmOutlines = false
local kyto_preMapName = ''
local kyto_preResolutionWidth = 0
local kyto_preResolutionHeight = 0

local deathMessages_eventsLogged = {}
local deathMessages_eventsPrinted = {}
-- local deathMessages_messageKeepInTime = 10000
local deathMessages_messageFadeInOutTime = 250
local deathMessages_messageTable = {}
local deathMessages_preDebugMode = false
local deathMessages_povPlayerChanged = false
local deathMessages_prePovPlayer

local fakeIonBeam_zFucked = false

local fragMessage_FadeInOutTime = 0

local gameMessages_lastTickSeconds = -1

local ionBurstAcc_prePlayerIndex = 0
local ionBurstAcc_preShootingIC = false
local ionBurstAcc_shotsFiredStart = 0
local ionBurstAcc_shotsFiredCount = 0
local ionBurstAcc_shotsHitStart = 0
local ionBurstAcc_shotsHitCount = 0
local ionBurstAcc_textTimer = 0

local powerups_hadCarnage = false
local powerups_hadResist = false
local powerups_hadMegaHealth = false
local powerups_hadFlag = false
local powerups_carnageFadeout = 0
local powerups_resistFadeout = 0
local powerups_megaHealthFadeout = 0

local powerups_preData = {}
local powerups_prePlayerIndex = 0

local teamInfo_carnageTable = {}
local teamInfo_resistTable = {}
local teamInfo_teamHasCarnage = false
local teamInfo_teamHasResist = false

local toasty_animTime = 0
local toasty_loggedEvents = {}
local toasty_log = {}
local toasty_soundPlayed = false
local toasty_TOASTYYY = false

local weaponOffsets_offsetSetFor = 0

-- local weaponSwitch_attackRebound = false
-- local weaponSwitch_emptyClickSoundDelay = 0
local weaponSwitch_noSwitchSoundDelay = 0

----------------------------------------------------------------------------------------------------
-- Global functions
----------------------------------------------------------------------------------------------------

local function kyto_setDefaultPositions()
   consolePerformCommand('ui_set_widget_offset kyto_armor 20 -10')
   consolePerformCommand('ui_set_widget_anchor kyto_armor 0 1')
   consolePerformCommand('ui_set_widget_offset kyto_deathMessages 10 10')
   consolePerformCommand('ui_set_widget_anchor kyto_deathMessages -1 -1')
   consolePerformCommand('ui_set_widget_offset kyto_followingPlayer 0 10')
   consolePerformCommand('ui_set_widget_anchor kyto_followingPlayer 0 -1')
   consolePerformCommand('ui_set_widget_offset kyto_fragMessage 0 -250')
   consolePerformCommand('ui_set_widget_anchor kyto_fragMessage 0 0')
   consolePerformCommand('ui_set_widget_offset kyto_gameMessages 0 -80')
   consolePerformCommand('ui_set_widget_anchor kyto_gameMessages 0 0')
   consolePerformCommand('ui_set_widget_offset kyto_gameModeAndMap -4 40')
   consolePerformCommand('ui_set_widget_anchor kyto_gameModeAndMap 1 -1')
   consolePerformCommand('ui_set_widget_scale  kyto_gameModeAndMap 0.4')
   consolePerformCommand('ui_set_widget_offset kyto_gameTimer 0 -160')
   consolePerformCommand('ui_set_widget_anchor kyto_gameTimer 0 1')
   consolePerformCommand('ui_set_widget_scale  kyto_gameTimer 0.75')
   consolePerformCommand('ui_set_widget_offset kyto_health -20 -10')
   consolePerformCommand('ui_set_widget_anchor kyto_health 0 1')
   consolePerformCommand('ui_set_widget_offset kyto_ionBurstAcc 0 -200')
   consolePerformCommand('ui_set_widget_anchor kyto_ionBurstAcc 0 0')
   consolePerformCommand('ui_set_widget_offset kyto_pickupTimers 5 -5')
   consolePerformCommand('ui_set_widget_anchor kyto_pickupTimers -1 1')
   consolePerformCommand('ui_set_widget_offset kyto_powerups 0 -230')
   consolePerformCommand('ui_set_widget_anchor kyto_powerups 0 1')
   consolePerformCommand('ui_set_widget_offset kyto_readyUpStatus 0 145')
   consolePerformCommand('ui_set_widget_anchor kyto_readyUpStatus 0 -1')
   consolePerformCommand('ui_set_widget_offset kyto_scores 0 16')
   consolePerformCommand('ui_set_widget_anchor kyto_scores 1 -1')
   consolePerformCommand('ui_set_widget_scale  kyto_scores 0.75')
   consolePerformCommand('ui_set_widget_offset kyto_teamInfo 10 -385')
   consolePerformCommand('ui_set_widget_anchor kyto_teamInfo -1 1')
   consolePerformCommand('ui_set_widget_offset kyto_verticalBar 0 -10')
   consolePerformCommand('ui_set_widget_anchor kyto_verticalBar 0 1')
   consolePerformCommand('ui_set_widget_offset kyto_weaponAccuracies -10 0')
   consolePerformCommand('ui_set_widget_anchor kyto_weaponAccuracies 1 0')
   consolePerformCommand('ui_set_widget_offset kyto_weaponList 0 -100')
   consolePerformCommand('ui_set_widget_anchor kyto_weaponList 0 1')
   consolePrint('KytoHUD default positions set')
   playSound('internal/ui/widgets/kytohud/sfx/toasty')
end

local function kyto_bitAnd(x, y)
   return x % (y + y) >= y
end

local function kyto_formatGameTimer(elapsed, limit, countUp)
   if not countUp then
      local remaining = 1000 + limit - elapsed
      return {
         minutes = math.max(math.floor(remaining / 60000), 0),
         seconds = (math.floor(remaining / 1000) % 60 + 60) % 60,
      }
   end
   return {
      minutes = math.floor(elapsed / 60000),
      seconds = math.floor((elapsed / 1000) % 60),
   }
end

local function kyto_copyColor(color, intensity)
   if intensity == nil then
      intensity = 1
   end
   return Color(color.r, color.g, color.b, color.a * intensity)
end

local function countdownActive()
   return (world.timerActive and world.gameState == GAME_STATE_WARMUP) or (world.timerActive and world.gameState == GAME_STATE_ROUNDPREPARE)
end

local function shootingIC(player)
   return player and player.connected and player.state == PLAYER_STATE_INGAME and player.health > 0 and player.weaponIndexSelected == 7 and player.weaponSelectionIntensity == 1 and player.weapons[7].ammo > 0 and player.buttons.attack
end

local function accuracyHidden(player)
   local localPlayer = getLocalPlayer()
   return localPlayer.state == PLAYER_STATE_INGAME and localPlayer.index ~= player.index and (not gamemodes[world.gameModeIndex].hasTeams or localPlayer.team ~= player.team)
end

-- thx 2 Qualx
local widgetLookup = (function()
   local cache = {}
   local _widgets = nil

   return function(name)
      if _widgets == widgets then
         return cache[name]
      else
         _widgets = widgets
         for w, widget in ipairs(_widgets) do
            cache[widget.name] = widget
         end
         return cache[name]
      end
   end
end)()

local function kyto_getWidgetVisible(widgetName)
   local widget = widgetLookup(widgetName)
   return widget.visible
end

local function kyto_getWidgetHorizontalAlignment(widgetName)
   local widget = widgetLookup(widgetName)

   if widget.anchor.x == -1 then
      return NVG_ALIGN_LEFT
   elseif widget.anchor.x == 0 then
      return NVG_ALIGN_CENTER
   elseif widget.anchor.x == 1 then
      return NVG_ALIGN_RIGHT
   end

   return nil
end

local function kyto_getWidgetVerticalAlignment(widgetName)
   local widget = widgetLookup(widgetName)

   if widget.anchor.y == -1 then
      return NVG_ALIGN_TOP
   elseif widget.anchor.y == 0 then
      return NVG_ALIGN_MIDDLE
   elseif widget.anchor.y == 1 then
      return NVG_ALIGN_BOTTOM
   end

   return nil
end

local function kyto_shouldShowWidget(widgetName)
   local player = getPlayer()
   local localPlayer = getLocalPlayer()

   if player == nil
      or loading.loadScreenVisible
      or player.state == PLAYER_STATE_EDITOR
      or player.state == PLAYER_STATE_SPECTATOR
      or (playerIndexCameraAttachedTo == playerIndexLocalPlayer and localPlayer.state ~= PLAYER_STATE_INGAME)
      or world.gameState == GAME_STATE_GAMEOVER
      or consoleGetVariable('cl_show_hud') == 0
      or not player.connected
      or (isInMenu() and widgetName ~= 'kyto_gameMessages')
      or replayName == 'menu'
      or KytoHUD == nil
      or KytoHUD.userData == nil then

      return false
   end

   return true
end

local function kyto_getPlayerTrueHealth(player)
   return math.min(player.armor, player.health * (player.armorProtection + 1)) + player.health
end

local function getWeaponAccuracy(player, weaponIndex)
   if player.weaponStats[weaponIndex] == nil or player.weaponStats[weaponIndex].shotsFired <= 0 then
      return 0
   end

   return player.weaponStats[weaponIndex].shotsHit / player.weaponStats[weaponIndex].shotsFired
end

local function kyto_shouldShowWeapon(weapon, showUnpickedAmmo, showUnpickedNoAmmo)
   return weapon.pickedup or showUnpickedNoAmmo or (weapon.ammo > 0 and showUnpickedAmmo)
end

local function kyto_getPlayerByNameAndTeam(argPlayerName, argPlayerTeam)
   local fallbackPlayer
   for _, p in ipairs(players) do
      if p.name == argPlayerName then
         if p.team == argPlayerTeam then
            return p
         end

         if fallbackPlayer == nil then
            fallbackPlayer = p
         end
      end
   end

   return fallbackPlayer
end

local function kyto_getPlayerMeleeCosmetic(player, useMeleeCosmetics)
   if player == nil or not useMeleeCosmetics then
      return 'internal/ui/icons/weapon1'
   end

   local meleeDefinition = inventoryDefinitions[player.inventoryMelee]
   if meleeDefinition ~= nil then
      return meleeDefinition.asset
   end

   return 'internal/ui/icons/weapon1'
end

local function getPlayerColor(user, player, intensity)
   local localPlayer = getLocalPlayer()

   local povPlayer
   if localPlayer.state == PLAYER_STATE_INGAME and not replayActive then
      povPlayer = localPlayer
   else
      povPlayer = getPlayer()
   end

   if player == nil or povPlayer == nil then
      return otherColor
   else
      if gamemodes[world.gameModeIndex].hasTeams then
         if player.team == povPlayer.team then
            if player.index == povPlayer.index then
               return kyto_copyColor(user.selfTeamColor, intensity)
            else
               return kyto_copyColor(user.friendTeamColor, intensity)
            end
         else
            return kyto_copyColor(user.enemyTeamColor, intensity)
         end
      else
         if player.index == povPlayer.index then
            return kyto_copyColor(user.selfColor, intensity)
         else
            return kyto_copyColor(user.enemyColor, intensity)
         end
      end
   end

   return otherColor
end

local function trackMegaHealth(player)
   local playerIndex = player.index
   if powerups_preData[playerIndex] then
      -- thx 2 KovaaK
      if player.hasMega then
         if not powerups_preData[playerIndex].megaHealth then
            powerups_preData[playerIndex] = {
               megaHealth = true,
               megaRemaining = 100,
               health = player.health,
               armor = player.armor,
            }
         else
            if powerups_preData[playerIndex].armor > player.armor then
               powerups_preData[playerIndex].megaRemaining = powerups_preData[playerIndex].megaRemaining - (powerups_preData[playerIndex].armor - player.armor)
            end
            powerups_preData[playerIndex].armor = player.armor

            if powerups_preData[playerIndex].health > player.health then
               powerups_preData[playerIndex].megaRemaining = powerups_preData[playerIndex].megaRemaining - (powerups_preData[playerIndex].health - player.health)
            end
            powerups_preData[playerIndex].health = player.health
         end
      else
         powerups_preData[playerIndex].megaRemaining = 0
         powerups_preData[playerIndex].megaHealth = false
      end
   else
      powerups_preData[playerIndex] = {
         megaHealth = false,
         megaRemaining = 0,
         health = player.health,
         armor = player.armor,
      }
   end

   return powerups_preData[playerIndex].megaRemaining
end

local function kyto_updateGlobalColors()
   if KytoHUD ~= nil and KytoHUD.userData ~= nil then
      kyto_killColors[DAMAGE_TYPE_MELEE] = KytoHUD.userData.weaponColor1
      kyto_killColors[DAMAGE_TYPE_BURST] = KytoHUD.userData.weaponColor2
      kyto_killColors[DAMAGE_TYPE_SHELL] = KytoHUD.userData.weaponColor3
      kyto_killColors[DAMAGE_TYPE_GRENADE] = KytoHUD.userData.weaponColor4
      kyto_killColors[DAMAGE_TYPE_PLASMA] = KytoHUD.userData.weaponColor5
      kyto_killColors[DAMAGE_TYPE_ROCKET] = KytoHUD.userData.weaponColor6
      kyto_killColors[DAMAGE_TYPE_BEAM] = KytoHUD.userData.weaponColor7
      kyto_killColors[DAMAGE_TYPE_BOLT] = KytoHUD.userData.weaponColor8
      kyto_killColors[DAMAGE_TYPE_STAKE] = KytoHUD.userData.weaponColor9
      kyto_suicideColors[DAMAGE_TYPE_GRENADE] = KytoHUD.userData.weaponColor4
      kyto_suicideColors[DAMAGE_TYPE_PLASMA] = KytoHUD.userData.weaponColor5
      kyto_suicideColors[DAMAGE_TYPE_ROCKET] = KytoHUD.userData.weaponColor6
   end

   if kyto_deathMessages ~= nil and kyto_deathMessages.userData ~= nil then
      kyto_killColors[DAMAGE_TYPE_TELEFRAG] = kyto_deathMessages.userData.telefragColor
      kyto_suicideColors[DAMAGE_TYPE_LAVA] = kyto_deathMessages.userData.lavaColor
      kyto_suicideColors[DAMAGE_TYPE_DROWN] = kyto_deathMessages.userData.drownColor
      kyto_suicideColors[DAMAGE_TYPE_OUTOFWORLD] = kyto_deathMessages.userData.outOfWorldColor
      kyto_suicideColors[DAMAGE_TYPE_OVERTIME] = kyto_deathMessages.userData.overtimeColor
      kyto_suicideColors[DAMAGE_TYPE_SUICIDE] = kyto_deathMessages.userData.suicideColor
   end
end

local function kyto_updateWeaponsTable(weaponTable, drawWeapons)
   _G[weaponTable] = {}
   if drawWeapons > 0 then
      for weaponIndex = 1, 9 do
         if kyto_bitAnd(drawWeapons, 2 ^ (weaponIndex - 1)) then
            table.insert(_G[weaponTable], weaponIndex)
         end
      end
   end
end

local function kyto_setAllWidgetOutlines(enabled)
   for w, widget in ipairs(widgets) do
      if widget.name:sub(1, 5) == 'kyto_' then
         local widgetObj = _G[widget.name]
         if widgetObj ~= nil and widgetObj.userData ~= nil then
            -- Flag
            if widgetObj.userData.outlineFlag ~= nil then
               widgetObj.userData.outlineFlag = enabled
            end
            -- Icon
            if widgetObj.userData.outlineIcon ~= nil then
               widgetObj.userData.outlineIcon = enabled
            end
            -- Rect
            if widgetObj.userData.outlineRect ~= nil then
               widgetObj.userData.outlineRect = enabled
            end
            -- Text
            if widgetObj.userData.outlineText ~= nil then
               widgetObj.userData.outlineText = enabled
            end
            saveUserData(widgetObj.userData)
         end
      end
   end

   if enabled then
      consolePrint('KytoHUD enabled all outlines')
      playSound('internal/ui/widgets/kytohud/sfx/toasty')
   else
      consolePrint('KytoHUD disabled all outlines')
      playSound('internal/ui/widgets/kytohud/sfx/toasty')
   end
end

local function kyto_drawSvgOutline(svgName, svgX, svgY, svgRadius, svgAlpha, svgOutlineStyle)
   if svgAlpha == nil then
      svgAlpha = 255
   end

   if svgOutlineStyle == nil then
      svgOutlineStyle = KytoHUD.userData.iconOutlineStyle
   end

   if svgOutlineStyle == 1 then
      nvgFillColor(Color(0, 0, 0, (svgAlpha * 1.5) - 127.5))
      nvgSvg(svgName, svgX + 3, svgY + 3, svgRadius)
   elseif svgOutlineStyle == 2 then
      nvgFillColor(Color(0, 0, 0, (svgAlpha * 1.5) - 127.5))
      nvgSvg(svgName, svgX, svgY, svgRadius, 3)
      nvgSvg(svgName, svgX, svgY, svgRadius, 3)
      nvgSvg(svgName, svgX, svgY, svgRadius, 3)
      nvgFontBlur(0)
   else
      nvgFillColor(Color(0, 0, 0, svgAlpha))
      nvgSvg(svgName, svgX - 1, svgY, svgRadius)
      nvgSvg(svgName, svgX + 1, svgY, svgRadius)
      nvgSvg(svgName, svgX, svgY - 1, svgRadius)
      nvgSvg(svgName, svgX, svgY + 1, svgRadius)
   end
end

local function kyto_drawRectOutline(rectAlpha)
   if rectAlpha == nil then
      textAlpha = 255
   end

   nvgStrokeWidth(2)
   nvgStrokeColor(Color(0, 0, 0, rectAlpha))
   nvgStroke()
end

local function kyto_drawTextOutline(textX, textY, text, textAlpha, textOutlineStyle)
   if textAlpha == nil then
      textAlpha = 255
   end

   if textOutlineStyle == nil then
      textOutlineStyle = KytoHUD.userData.textOutlineStyle
   end

   if textOutlineStyle == 1 then
      nvgFillColor(Color(0, 0, 0, (textAlpha * 1.5) - 127.5))
      nvgText(textX + 3,  textY + 3, text)
   elseif textOutlineStyle == 2 then
      nvgFontBlur(3)
      nvgFillColor(Color(0, 0, 0, (textAlpha * 1.5) - 127.5))
      nvgText(textX, textY, text)
      nvgText(textX, textY, text)
      nvgText(textX, textY, text)
      nvgFontBlur(0)
   else
      nvgFontBlur(0)
      nvgFillColor(Color(0, 0, 0, textAlpha))
      nvgText(textX - 1, textY, text)
      nvgText(textX + 1, textY, text)
      nvgText(textX, textY - 1, text)
      nvgText(textX, textY + 1, text)
   end
end

local function drawCrosshair(user, x, y, intensity)
   local resolution
   if consoleGetVariable('r_fullscreen') ~= 0 then
      resolution = consoleGetVariable('r_resolution_fullscreen')
   else
      resolution = consoleGetVariable('r_resolution_windowed')
   end

   local pxsh = viewport.width / resolution[1]
   local pxsv = viewport.height / resolution[2]

   local cw = user.crosshairWidth
   local ch = user.crosshairHeight
   local cs = user.crosshairStroke
   local ct = user.crosshairThickness

   local gw = user.crosshairGapWidth
   local gh = user.crosshairGapHeight

   local dw = user.crosshairDotWidth
   local dh = user.crosshairDotHeight
   local ds = user.crosshairDotStroke

   local crosshairColor = kyto_copyColor(user.crosshairColor, intensity)
   local crosshairStrokeColor = kyto_copyColor(user.crosshairStrokeColor, intensity)
   local crosshairDotColor = kyto_copyColor(user.crosshairDotColor, intensity)
   local crosshairDotStrokeColor = kyto_copyColor(user.crosshairDotStrokeColor, intensity)

   -- fix for odd values of thickness
   if ct % 2 ~= 0 then
      x = x - 0.5
      y = y - 0.5
   end

   -- draw dot
   if dw > 0 or dh > 0 then
      -- dot stroke
      if ds > 0 then
         nvgBeginPath()
         nvgRect(x + pxsh * (-dw / 2 - ds), y + pxsv * (-dh / 2 - ds), pxsh * (dw + ds * 2), pxsv * (dh + ds * 2))
         nvgFillColor(crosshairDotStrokeColor)
         nvgFill()
      end

      -- dot
      nvgBeginPath()
      nvgRect(x + pxsh * -dw / 2, y + pxsv * -dh / 2, pxsh * dw, pxsv * dh)
      nvgFillColor(crosshairDotColor)
      nvgFill()
   end

   -- draw cross
   if gh > 0 or gw > 0 then
      -- 4 rect cross
      -- stroke
      if cs > 0 then
         nvgBeginPath()
         nvgRect(x + pxsh * (-ct / 2 - cs),          y + pxsv * (-ch / 2 - gh / 2 - cs), pxsh * (ct + cs * 2),     pxsv * (ch / 2 + cs * 2))
         nvgRect(x + pxsh * (-ct / 2 - cs),          y + pxsv * (gh / 2 - cs),           pxsh * (ct + cs * 2),     pxsv * (ch / 2 + cs * 2))
         nvgRect(x + pxsh * (-cw / 2 - gw / 2 - cs), y + pxsv * (-ct / 2 - cs),          pxsh * (cw / 2 + cs * 2), pxsv * (ct + cs * 2))
         nvgRect(x + pxsh * (gw / 2 - cs),           y + pxsv * (-ct / 2 - cs),          pxsh * (cw / 2 + cs * 2), pxsv * (ct + cs * 2))
         nvgFillColor(crosshairStrokeColor)
         nvgFill()
      end

      -- cross
      nvgBeginPath()
      nvgRect(x + pxsh * -ct / 2,            y + pxsv * (-ch / 2 - gh / 2), pxsh * ct,     pxsv * ch / 2)
      nvgRect(x + pxsh * -ct / 2,            y + pxsv * gh / 2,             pxsh * ct,     pxsv * ch / 2)
      nvgRect(x + pxsh * (-cw / 2 - gw / 2), y + pxsv * -ct / 2,            pxsh * cw / 2, pxsv * ct)
      nvgRect(x + pxsh * gw / 2,             y + pxsv * -ct / 2,            pxsh * cw / 2, pxsv * ct)
      nvgFillColor(crosshairColor)
      nvgFill()
   else
      -- 2 rect cross
      -- stroke
      if cs > 0 then
         nvgBeginPath()
         nvgRect(x + pxsh * (-ct / 2 - cs), y + pxsv * (-ch / 2 - cs), pxsh * (ct + cs * 2), pxsv * (ch + cs * 2))
         nvgRect(x + pxsh * (-cw / 2 - cs), y + pxsv * (-ct / 2 - cs), pxsh * (cw + cs * 2), pxsv * (ct + cs * 2))
         nvgFillColor(crosshairStrokeColor)
         nvgFill()
      end

      -- cross
      nvgBeginPath()
      nvgRect(x + pxsh * -ct / 2, y + pxsv * -ch / 2, pxsh * ct, pxsv * ch)
      nvgRect(x + pxsh * -cw / 2, y + pxsv * -ct / 2, pxsh * cw, pxsv * ct)
      nvgFillColor(crosshairColor)
      nvgFill()
   end
end

local function drawBackground(x, y, width, height, alpha, intensity, highlightColor)
   if alpha ~= 0 then
      nvgBeginPath()
      nvgRoundedRect(x, y, width, height, 2)
      if highlightColor ~= nil then
         local backgroundColor = Color(highlightColor.r, highlightColor.g, highlightColor.b)
         backgroundColor.a = math.min(255, highlightColor.a * 2.5)
         backgroundColor = kyto_copyColor(backgroundColor, intensity)
         nvgStrokeWidth(2)
         nvgStrokeColor(backgroundColor)
         nvgStroke()
         nvgFillColor(Color(0, 0, 0, alpha))
         -- highlightColor = Color(
         --    lerp(0, highlightColor.r, 0.5),
         --    lerp(0, highlightColor.g, 0.5),
         --    lerp(0, highlightColor.b, 0.5),
         --    alpha
         -- )
         -- nvgFillColor(highlightColor)
      else
         nvgFillColor(Color(0, 0, 0, alpha))
      end
      nvgFill()
   end
end

local function drawDeathMessage(message, messageNum, messageNumTotal, messageTime, printToConsole, drawFlag, outlineFlag, outlineIcon, outlineText, textOutlineStyle, useMeleeCosmetics)
   local localPlayer = getLocalPlayer()

   local povPlayer
   if localPlayer.state == PLAYER_STATE_INGAME then
      povPlayer = localPlayer
   else
      povPlayer = getPlayer()
      local povPlayerIndex = povPlayer.index
      if deathMessages_prePovPlayerIndex ~= nil and povPlayerIndex ~= deathMessages_prePovPlayerIndex then
         deathMessages_povPlayerChanged = true
      end
      deathMessages_prePovPlayerIndex = povPlayerIndex
   end

   -- time shits
   local intensity
   if message.debug then
      intensity = 1
   else
      if message.fadeIn > 0 then
         intensity = (deathMessages_messageFadeInOutTime - message.fadeIn) / deathMessages_messageFadeInOutTime
         message.fadeIn = message.fadeIn - deltaTime * 1000
      elseif message.keepIn <= 0 and deathMessages_messageFadeInOutTime > 0 then
         intensity = message.fadeOut / deathMessages_messageFadeInOutTime
         message.fadeOut = message.fadeOut - deltaTime * 1000
      else
         intensity = 1
         if messageTime >= 0 then
            message.keepIn = message.keepIn - deltaTime * 1000
         end
      end
   end

   --

   local deathMessageHeight = 32
   local deathMessageSpacing = 6

   nvgFontSize(deathMessageHeight)
   nvgFontFace(kyto_deathMessages_font)
   nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)

   local iconRadius = deathMessageHeight * 0.3125
   local iconSpacing = nvgTextWidth(' ')

   local flagRadius = deathMessageHeight * 0.3125
   local flagSpacing = nvgTextWidth(' ') * 0.75

   local deathMessage
   local deathMessageInner
   if message.deathSuicide then
      deathMessageInner = suicideMessages[message.deathDamageType]
      deathMessage = string.format(deathMessageInner, message.victimName)
   else
      deathMessageInner = killMessages[message.deathDamageType]
      deathMessage = string.format(deathMessageInner, message.killerName, message.victimName)
   end

   deathMessageInner = deathMessageInner:gsub('%%s', '') -- strip '%s'
   deathMessageInner = deathMessageInner:gsub('%b()', '') -- strip '(...)' where ... is any text
   deathMessageInner = deathMessageInner:gsub('^%s*(.-)%s*$', '%1') -- trim

   if printToConsole and deathMessages_eventsPrinted[message.logEventId] == nil then
      consolePrint(deathMessage)
      deathMessages_eventsPrinted[message.logEventId] = true
   end

   local iconSvg
   if message.deathSuicide then
      iconSvg = suicideIcons[message.deathDamageType]
   else
      iconSvg = killIcons[message.deathDamageType]
   end

   local killerFlagSet = message.killerFlag ~= ''
   local victimFlagSet = message.victimFlag ~= ''

   local deathMessageWidth
   if message.deathSuicide then
      deathMessageWidth = iconRadius * 2 + nvgTextWidth(message.victimName) + deathMessageSpacing * 2 + iconSpacing
      if drawFlag and victimFlagSet then
         deathMessageWidth = deathMessageWidth + flagRadius * 2 + flagSpacing
      end
   else
      deathMessageWidth = nvgTextWidth(message.killerName) + iconRadius * 2 + nvgTextWidth(message.victimName) + deathMessageSpacing * 2 + iconSpacing * 2
      if drawFlag then
         if killerFlagSet then
         deathMessageWidth = deathMessageWidth + flagRadius * 2 + flagSpacing
         end
         if victimFlagSet then
            deathMessageWidth = deathMessageWidth + flagRadius * 2 + flagSpacing
         end
      end
   end

   local x
   local deathMessageHorizontalAlignment = kyto_getWidgetHorizontalAlignment('kyto_deathMessages')
   if deathMessageHorizontalAlignment == NVG_ALIGN_LEFT then
      x = 0
   elseif deathMessageHorizontalAlignment == NVG_ALIGN_CENTER then
      x = -deathMessageWidth / 2
   elseif deathMessageHorizontalAlignment == NVG_ALIGN_RIGHT then
      x = -deathMessageWidth
   end

   local y
   local deathMessageVerticalAlignment = kyto_getWidgetVerticalAlignment('kyto_deathMessages')
   if deathMessageVerticalAlignment == NVG_ALIGN_TOP then
      y = (messageNum - 1) * (deathMessageHeight + deathMessageSpacing)
   elseif deathMessageVerticalAlignment == NVG_ALIGN_MIDDLE then
      y = (-messageNumTotal / 2 + messageNum - 1) * deathMessageHeight - ((messageNumTotal - 1) / 2 - messageNum + 1) * deathMessageSpacing
   elseif deathMessageVerticalAlignment == NVG_ALIGN_BOTTOM then
      y = -messageNum * deathMessageHeight - (messageNum - 1) * deathMessageSpacing
   end

   -- draw background
   local alpha = clamp(widgetGetConsoleVariable('background'), 0, 255) * intensity
   local highlightColor
   if message.hasCarnage and message.hasResist then
      highlightColor = Color(
         lerp(KytoHUD.userData.carnageColor.r, KytoHud.userData.resistColor.r, 0.5),
         lerp(KytoHUD.userData.carnageColor.g, KytoHud.userData.resistColor.g, 0.5),
         lerp(KytoHUD.userData.carnageColor.b, KytoHud.userData.resistColor.b, 0.5)
      )
   elseif message.hasCarnage then
      highlightColor = kyto_copyColor(KytoHUD.userData.carnageColor, intensity)
   elseif message.hasResist then
      highlightColor = kyto_copyColor(KytoHud.userData.resistColor, intensity)
   end
   drawBackground(x, y, deathMessageWidth, deathMessageHeight, alpha, intensity, highlightColor)

   -- draw foreground
   local iconColor
   if message.deathSuicide then
      iconColor = kyto_copyColor(kyto_suicideColors[message.deathDamageType], intensity)
   else
      iconColor = kyto_copyColor(kyto_killColors[message.deathDamageType], intensity)
   end

   -- use melee cosmetics
   if message.deathDamageType == DAMAGE_TYPE_MELEE then
      if message.deathMeleeDefId ~= nil and useMeleeCosmetics then
         local meleeDefinition = inventoryDefinitions[message.deathMeleeDefId]
         if meleeDefinition ~= nil then
            iconColor = Color(255, 255, 255, 255 * intensity)
            iconSvg = meleeDefinition.asset
         end
      end
   end

   message.killerColor.a = 255 * intensity
   message.victimColor.a = 255 * intensity

   if message.deathSuicide then
      local iconX = x + deathMessageSpacing + iconRadius
      local iconY = y + deathMessageHeight / 2
      if outlineIcon then
         kyto_drawSvgOutline(iconSvg, iconX, iconY, iconRadius, 255 * intensity)
      end
      nvgFillColor(iconColor)
      nvgSvg(iconSvg, iconX, iconY, iconRadius)

      local victimX = iconX + iconRadius + iconSpacing
      if outlineText then
         kyto_drawTextOutline(victimX, y, message.victimName, 255 * intensity)
      end
      nvgFontBlur(0)
      nvgFillColor(message.victimColor)
      nvgText(victimX, y, message.victimName)
      if drawFlag and victimFlagSet then
         local flagX = victimX + nvgTextWidth(message.victimName) + flagSpacing + flagRadius
         local flagY = y + deathMessageHeight / 2
         if outlineFlag then
            kyto_drawSvgOutline(message.victimFlag, flagX, flagY, flagRadius, 255 * intensity)
         end
         nvgFillColor(Color(255, 255, 255, 255 * intensity))
         nvgSvg(message.victimFlag, flagX, flagY, flagRadius)
      end
   else
      local killerX = x + deathMessageSpacing
      if drawFlag and killerFlagSet then
         local flagX = killerX + flagRadius
         local flagY = y + deathMessageHeight / 2
         if outlineFlag then
            kyto_drawSvgOutline(message.killerFlag, flagX, flagY, flagRadius, 255 * intensity)
         end
         nvgFillColor(Color(255, 255, 255, 255 * intensity))
         nvgSvg(message.killerFlag, flagX, flagY, flagRadius)
         killerX = flagX + flagRadius + flagSpacing
      end
      if outlineText then
         kyto_drawTextOutline(killerX, y, message.killerName, 255 * intensity)
      end
      nvgFontBlur(0)
      nvgFillColor(message.killerColor)
      nvgText(killerX, y, message.killerName)

      local iconX = killerX + nvgTextWidth(message.killerName) + iconSpacing + iconRadius
      local iconY = y + deathMessageHeight / 2
      if outlineIcon then
         kyto_drawSvgOutline(iconSvg, iconX, iconY, iconRadius, 255 * intensity)
      end
      nvgFillColor(iconColor)
      nvgSvg(iconSvg, iconX, iconY, iconRadius)

      local victimX = iconX + iconRadius + iconSpacing
      if outlineText then
         kyto_drawTextOutline(victimX, y, message.victimName, 255 * intensity)
      end
      nvgFontBlur(0)
      nvgFillColor(message.victimColor)
      nvgText(victimX, y, message.victimName)
      if drawFlag and victimFlagSet then
         local flagX = victimX + nvgTextWidth(message.victimName) + flagSpacing + flagRadius
         local flagY = y + deathMessageHeight / 2
         if outlineFlag then
            kyto_drawSvgOutline(message.victimFlag, flagX, flagY, flagRadius, 255 * intensity)
         end
         nvgFillColor(Color(255, 255, 255, 255 * intensity))
         nvgSvg(message.victimFlag, flagX, flagY, flagRadius)
      end
   end
end

local function kyto_followingPlayer_drawFlag(flag, flagAlpha, x, y, radius, outlineFlag)
   if outlineFlag then
      kyto_drawSvgOutline(flag, x, y, radius, flagAlpha)
   end

   nvgFillColor(Color(255, 255, 255, flagAlpha))
   nvgSvg(flag, x, y, radius)
end

local function drawText(text, color, x, y, outlineText, textOutlineStyle)
   nvgFontBlur(0)

   if outlineText then
      kyto_drawTextOutline(x, y, text, color.a)
   end

   nvgFillColor(color)
   nvgText(x, y, text)
end

local function drawFragMessage(text, textColor, x, y)
   nvgFontBlur(0)

   nvgFillColor(Color(0, 0, 0, textColor.a))
   nvgText(x - 1, y, text)
   nvgText(x + 1, y, text)
   nvgText(x, y - 1, text)
   nvgText(x, y + 1, text)

   nvgFillColor(textColor)
   nvgText(x, y, text)
end

local function kyto_fragMessage_drawFlag(flag, flagAlpha, x, y, radius, outlineFlag)
   if outlineFlag then
      kyto_drawSvgOutline(flag, x, y, radius, flagAlpha)
   end

   nvgFillColor(Color(255, 255, 255, flagAlpha))
   nvgSvg(flag, x, y, radius)
end

local function drawGameMessage(text, textColor, x, y, outlineText, textOutlineStyle)
   if outlineText then
      kyto_drawTextOutline(x, y, text)
   end

   nvgFontBlur(0)
   nvgFillColor(textColor)
   nvgText(x, y, text)
end

local function drawPowerup(x, y, powerupWidth, powerupHeight, powerupColor, powerupName, powerupTimeRemaining, outlineIcon, outlineText, textOutlineStyle)
   local alpha = clamp(widgetGetConsoleVariable('background'), 0, 255)
   if alpha ~= 0 then
      nvgBeginPath()
      nvgRoundedRect(x, y, powerupWidth, powerupHeight, 2)
      nvgFillColor(Color(0, 0, 0, alpha))
      nvgFill()
   end

   local iconRadius = powerupHeight * 0.40
   local iconX = x + (powerupHeight - iconRadius)
   local iconY = y + (powerupHeight / 2)

   local svgName = 'internal/ui/icons/' .. powerupName
   if outlineIcon then
      kyto_drawSvgOutline(svgName, iconX, iconY, iconRadius)
   end
   nvgFillColor(powerupColor)
   nvgSvg(svgName, iconX, iconY, iconRadius)

   local timeX = x + (iconRadius) + (powerupWidth / 2)
   local timeColor = Color(255, 255, 255)
   if powerupTimeRemaining ~= nil then
      powerupTimeRemaining = round(powerupTimeRemaining / 1000)
      if powerupTimeRemaining <= 5 then
         timeColor = Color(255, 0, 0)
      elseif powerupTimeRemaining <= 10 then
         timeColor = Color(255, 255, 0)
      end
   else
      powerupTimeRemaining = ''
   end

   nvgFontSize(powerupHeight)
   nvgFontFace(kyto_powerups_font)
   nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP)

   if outlineText then
      kyto_drawTextOutline(timeX, y, powerupTimeRemaining)
   end

   nvgFontBlur(0)
   nvgFillColor(timeColor)
   nvgText(timeX, y, powerupTimeRemaining)
end

local function drawScore(x, y, w, h, textX, textColor, score, outlineText)
   if outlineText then
      kyto_drawTextOutline(textX, y, score, textColor.a, KytoHUD.userData.textOutlineStyle)
   end
   nvgFillColor(textColor)
   nvgText(textX, y, score)
end

local function drawColumnDelimiter(x, y, h, delimiterColor)
   nvgBeginPath()
   nvgRect(x, y, 1, h)
   nvgFillColor(delimiterColor)
   nvgFill()
end

local function drawRowDelimiter(x, y, columnSpacing, listWidth)
   nvgBeginPath()
   nvgRect(x, y, listWidth - (columnSpacing * 2), 1)
   nvgFillColor(Color(100, 100, 100, 100))
   nvgFill()
end

local function drawInfoText(text, textColor, x, y, outlineText, textOutlineStyle)
   if outlineText then
      kyto_drawTextOutline(x, y, text)
   end

   nvgFontBlur(0)
   nvgFillColor(textColor)
   nvgText(x, y, text)
end

-- *followingPlayer, *gameModeAndMap, *readyUpStatus
local function drawPlayerText(text, textColor, x, y, outlineText, textOutlineStyle)
   if outlineText then
      kyto_drawTextOutline(x, y, text)
   end

   nvgFontBlur(0)
   nvgFillColor(textColor)
   nvgText(x, y, text)
end

----------------------------------------------------------------------------------------------------
-- initialize()
----------------------------------------------------------------------------------------------------

KytoHUD = {canHide = false, canPosition = false}
registerWidget('KytoHUD')

function KytoHUD:initialize()
   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'enforceViewportHeight', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'useMeleeCosmetics', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'iconOutlineStyle', 'number', 0)
   CheckSetDefaultValue(self.userData, 'textOutlineStyle', 'number', 0)
   -- CheckSetDefaultValue(self.userData, 'autoClearLightmap', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'weaponColor1', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'weaponColor2', 'table', Color(0, 255, 255))
   CheckSetDefaultValue(self.userData, 'weaponColor3', 'table', Color(255, 150, 0))
   CheckSetDefaultValue(self.userData, 'weaponColor4', 'table', Color(99, 221, 74))
   CheckSetDefaultValue(self.userData, 'weaponColor5', 'table', Color(255, 0, 255))
   CheckSetDefaultValue(self.userData, 'weaponColor6', 'table', Color(250, 0, 0))
   CheckSetDefaultValue(self.userData, 'weaponColor7', 'table', Color(0, 128, 255))
   CheckSetDefaultValue(self.userData, 'weaponColor8', 'table', Color(255, 255, 0))
   CheckSetDefaultValue(self.userData, 'weaponColor9', 'table', Color(128, 0, 0))
   CheckSetDefaultValue(self.userData, 'carnageColor', 'table', Color(255, 0, 188))
   CheckSetDefaultValue(self.userData, 'resistColor', 'table', Color(124, 32, 255))
   CheckSetDefaultValue(self.userData, 'megaColor', 'table', Color(60, 80, 255))
   CheckSetDefaultValue(self.userData, 'armorGreenColor', 'table', Color(0, 255, 0))
   CheckSetDefaultValue(self.userData, 'armorYellowColor', 'table', Color(255, 255, 0))
   CheckSetDefaultValue(self.userData, 'armorRedColor', 'table', Color(255, 0, 0))

   kyto_updateGlobalColors()
end

kyto_armor = {}
registerWidget('kyto_armor')

function kyto_armor:initialize()
   widgetCreateConsoleVariable('show', 'int', 3)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'useArmorColors', 'boolean', true)
end

kyto_crosshair = {canPosition = false}
registerWidget('kyto_crosshair')

function kyto_crosshair:initialize()
   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'crosshairWidth', 'number', 16)
   CheckSetDefaultValue(self.userData, 'crosshairHeight', 'number', 16)
   CheckSetDefaultValue(self.userData, 'crosshairStroke', 'number', 1)
   CheckSetDefaultValue(self.userData, 'crosshairThickness', 'number', 2)
   CheckSetDefaultValue(self.userData, 'crosshairGapWidth', 'number', 0)
   CheckSetDefaultValue(self.userData, 'crosshairGapHeight', 'number', 0)
   CheckSetDefaultValue(self.userData, 'crosshairDotWidth', 'number', 0)
   CheckSetDefaultValue(self.userData, 'crosshairDotHeight', 'number', 0)
   CheckSetDefaultValue(self.userData, 'crosshairDotStroke', 'number', 0)
   CheckSetDefaultValue(self.userData, 'crosshairColor', 'table', Color(255, 255, 255, 255))
   CheckSetDefaultValue(self.userData, 'crosshairStrokeColor', 'table', Color(0, 0, 0, 255))
   CheckSetDefaultValue(self.userData, 'crosshairDotColor', 'table', Color(255, 255, 255, 255))
   CheckSetDefaultValue(self.userData, 'crosshairDotStrokeColor', 'table', Color(0, 0, 0, 255))
end

kyto_deathMessages = {}
registerWidget('kyto_deathMessages')

function kyto_deathMessages:initialize()
   widgetCreateConsoleVariable('background', 'int', 65)
   widgetCreateConsoleVariable('debug', 'int', 0)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineFlag', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'outlineIcon', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'printToConsole', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'drawFlag', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'maxMessages', 'number', 5)
   CheckSetDefaultValue(self.userData, 'reverse', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'time', 'number', 10000)
   CheckSetDefaultValue(self.userData, 'selfColor', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'enemyColor', 'table', Color(63, 255, 63))
   CheckSetDefaultValue(self.userData, 'selfTeamColor', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'friendTeamColor', 'table', Color(255, 31, 31))
   CheckSetDefaultValue(self.userData, 'enemyTeamColor', 'table', Color(63, 255, 63))
   CheckSetDefaultValue(self.userData, 'telefragColor', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'lavaColor', 'table', Color(255, 127, 0))
   CheckSetDefaultValue(self.userData, 'drownColor', 'table', Color(127, 255, 255))
   CheckSetDefaultValue(self.userData, 'outOfWorldColor', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'overtimeColor', 'table', Color(204, 204, 204))
   CheckSetDefaultValue(self.userData, 'suicideColor', 'table', Color(255, 255, 255))

   kyto_updateGlobalColors()
end

kyto_fakeIonBeam = {canPosition = false}
registerWidget('kyto_fakeIonBeam')

function kyto_fakeIonBeam:initialize()
   widgetCreateConsoleVariable('extra_crosshair', 'int', 0)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'beamWidth', 'number', '2')
   CheckSetDefaultValue(self.userData, 'beamColor', 'table', Color(255, 255, 255, 255))
end

kyto_followingPlayer = {}
registerWidget('kyto_followingPlayer')

function kyto_followingPlayer:initialize()
   widgetCreateConsoleVariable('flag_offset_y', 'float', 0.0)
   widgetCreateConsoleVariable('override_country', 'string', '')
   widgetCreateConsoleVariable('override_name', 'string', '')
   widgetCreateConsoleVariable('override_reset', 'int', 0)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'outlineFlag', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'drawFlag', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'flagPositionLeft', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'drawPlaying', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'followingText', 'string', 'FOLLOWING')
end

kyto_fragMessage = {}
registerWidget('kyto_fragMessage')

function kyto_fragMessage:initialize()
   widgetCreateConsoleVariable('debug', 'int', 0)
   widgetCreateConsoleVariable('flag_offset_y', 'float', 2.0)
   widgetCreateConsoleVariable('override_country', 'string', '')
   widgetCreateConsoleVariable('override_name', 'string', '')
   widgetCreateConsoleVariable('override_reset', 'int', 0)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineFlag', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'drawFlag', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'time', 'number', 2500)
end

kyto_gameMessages = {}
registerWidget('kyto_gameMessages')

function kyto_gameMessages:initialize()
   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
end

kyto_gameModeAndMap = {}
registerWidget('kyto_gameModeAndMap')

function kyto_gameModeAndMap:initialize()
   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
end

kyto_gameTimer = {}
registerWidget('kyto_gameTimer')

function kyto_gameTimer:initialize()
   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'countUp', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'countUpWarmup', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'hideSeconds', 'number', 0)
   widgetCreateConsoleVariable('reset_warmup', 'int', 0)
end

kyto_health = {}
registerWidget('kyto_health')

function kyto_health:initialize()
   widgetCreateConsoleVariable('show', 'int', 3)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'showNegative', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'megaIndicator', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'healthColor', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'healthColorRocketable', 'table', Color(255, 255, 0))
   CheckSetDefaultValue(self.userData, 'healthColorBoltable', 'table', Color(255, 0, 0))
   CheckSetDefaultValue(self.userData, 'megaColor', 'table', Color(51, 204, 255))
end

kyto_ionBurstAcc = {}
registerWidget('kyto_ionBurstAcc')

function kyto_ionBurstAcc:initialize()
   widgetCreateConsoleVariable('debug', 'int', 0)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'fadeout', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'time', 'number', 2000)
end

kyto_pickupTimers = {}
registerWidget('kyto_pickupTimers')

function kyto_pickupTimers:initialize()
   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineIcon', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'clearItems', 'boolean', false)
end

kyto_powerups = {}
registerWidget('kyto_powerups')

function kyto_powerups:initialize()
   widgetCreateConsoleVariable('background', 'int', 65)
   widgetCreateConsoleVariable('debug', 'int', 0)
   widgetCreateConsoleVariable('show', 'int', 3)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineIcon', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'megaIndicator', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'flagIndicator', 'boolean', true)
end

kyto_readyUpStatus = {}
registerWidget('kyto_readyUpStatus')

function kyto_readyUpStatus:initialize()
   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
end

kyto_scores = {}
registerWidget('kyto_scores')

function kyto_scores:initialize()
   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'showScores', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'showDiff', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'scoreSelfColor', 'table', Color(255, 255, 255, 255))
   CheckSetDefaultValue(self.userData, 'scoreEnemyColor', 'table', Color(63, 255, 63, 255))
   CheckSetDefaultValue(self.userData, 'scoreDiffColor', 'table', Color(127, 127, 127, 255))
end

kyto_teamInfo = {}
registerWidget('kyto_teamInfo')

function kyto_teamInfo:initialize()
   widgetCreateConsoleVariable('name_max_length', 'int', 100)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineIcon', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'showSelf', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'drawWeapons', 'number', 510)
   CheckSetDefaultValue(self.userData, 'useKimiLocations', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'locationConstantWidth', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'drawAmmo', 'number', 1)
   CheckSetDefaultValue(self.userData, 'ammoIconFill', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'ammoCountColor', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'alwaysShowPowerups', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'highlightNamesOnPowerup', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'drawPowerup', 'number', 1)
   CheckSetDefaultValue(self.userData, 'powerupIconFill', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'powerupTimeColor', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'healthColor', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'healthColorRocketable', 'table', Color(255, 255, 0))
   CheckSetDefaultValue(self.userData, 'healthColorBoltable', 'table', Color(255, 0, 0))
   CheckSetDefaultValue(self.userData, 'backgroundColor', 'table', Color(255, 255, 255, 65))
   CheckSetDefaultValue(self.userData, 'delimiterColor', 'table', Color(100, 100, 100, 100))
   CheckSetDefaultValue(self.userData, 'textBaseColor', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'textInactiveColor', 'table', Color(127, 127, 127))
   CheckSetDefaultValue(self.userData, 'textDeadColor', 'table', Color(200, 200, 200))
   CheckSetDefaultValue(self.userData, 'iconBaseColor', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'iconInactiveColor', 'table', Color(127, 127, 127))

   kyto_updateGlobalColors()
   kyto_updateWeaponsTable('kyto_teamInfo_weapons', self.userData.drawWeapons)
end

kyto_toasty = {canPosition = false}
registerWidget('kyto_toasty')

function kyto_toasty:initialize()
   widgetCreateConsoleVariable('toasty', 'int', 0)
end

kyto_verticalBar = {}
registerWidget('kyto_verticalBar')

function kyto_verticalBar:initialize()
   widgetCreateConsoleVariable('show', 'int', 3)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineRect', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'useArmorColors', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'megaIndicator', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'healthColor', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'healthColorRocketable', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'healthColorBoltable', 'table', Color(255, 255, 255))
   CheckSetDefaultValue(self.userData, 'megaColor', 'table', Color(51, 204, 255))
end

kyto_weaponAccuracies = {}
registerWidget('kyto_weaponAccuracies')

function kyto_weaponAccuracies:initialize()
   widgetCreateConsoleVariable('background', 'int', 65)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineIcon', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'drawWeapons', 'number', 510)

   kyto_updateGlobalColors()
   kyto_updateWeaponsTable('kyto_weaponAccuracies_weapons', self.userData.drawWeapons)
end

kyto_weaponList = {}
registerWidget('kyto_weaponList')

function kyto_weaponList:initialize()
   widgetCreateConsoleVariable('show', 'int', 3)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'outlineIcon', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'outlineText', 'boolean', false)
   CheckSetDefaultValue(self.userData, 'drawWeapons', 'number', 510)
   CheckSetDefaultValue(self.userData, 'showUnpickedAmmo', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'showUnpickedNoAmmo', 'boolean', false)

   kyto_updateGlobalColors()
   kyto_updateWeaponsTable('kyto_weaponList_weapons', self.userData.drawWeapons)
end

kyto_weaponOffsets = {canPosition = false}
registerWidget('kyto_weaponOffsets')

function kyto_weaponOffsets:initialize()
   -- widgetCreateConsoleVariable('weaponDefault_cmd', 'string', ')
   -- widgetCreateConsoleVariable('weapon1_cmd', 'string', ')
   -- widgetCreateConsoleVariable('weapon2_cmd', 'string', ')
   -- widgetCreateConsoleVariable('weapon3_cmd', 'string', ')
   -- widgetCreateConsoleVariable('weapon4_cmd', 'string', ')
   -- widgetCreateConsoleVariable('weapon5_cmd', 'string', ')
   -- widgetCreateConsoleVariable('weapon6_cmd', 'string', ')
   -- widgetCreateConsoleVariable('weapon7_cmd', 'string', ')
   -- widgetCreateConsoleVariable('weapon8_cmd', 'string', ')
   -- widgetCreateConsoleVariable('weapon9_cmd', 'string', ')

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'weaponX1', 'string', '6.5')
   CheckSetDefaultValue(self.userData, 'weaponX2', 'string', '6.5')
   CheckSetDefaultValue(self.userData, 'weaponX3', 'string', '6.5')
   CheckSetDefaultValue(self.userData, 'weaponX4', 'string', '6.5')
   CheckSetDefaultValue(self.userData, 'weaponX5', 'string', '6.5')
   CheckSetDefaultValue(self.userData, 'weaponX6', 'string', '6.5')
   CheckSetDefaultValue(self.userData, 'weaponX7', 'string', '6.5')
   CheckSetDefaultValue(self.userData, 'weaponX8', 'string', '6.5')
   CheckSetDefaultValue(self.userData, 'weaponX9', 'string', '6.5')
   CheckSetDefaultValue(self.userData, 'weaponY1', 'string', '-5')
   CheckSetDefaultValue(self.userData, 'weaponY2', 'string', '-5')
   CheckSetDefaultValue(self.userData, 'weaponY3', 'string', '-5')
   CheckSetDefaultValue(self.userData, 'weaponY4', 'string', '-5')
   CheckSetDefaultValue(self.userData, 'weaponY5', 'string', '-5')
   CheckSetDefaultValue(self.userData, 'weaponY6', 'string', '-5')
   CheckSetDefaultValue(self.userData, 'weaponY7', 'string', '-5')
   CheckSetDefaultValue(self.userData, 'weaponY8', 'string', '-5')
   CheckSetDefaultValue(self.userData, 'weaponY9', 'string', '-5')
   CheckSetDefaultValue(self.userData, 'weaponZ1', 'string', '20')
   CheckSetDefaultValue(self.userData, 'weaponZ2', 'string', '20')
   CheckSetDefaultValue(self.userData, 'weaponZ3', 'string', '20')
   CheckSetDefaultValue(self.userData, 'weaponZ4', 'string', '20')
   CheckSetDefaultValue(self.userData, 'weaponZ5', 'string', '20')
   CheckSetDefaultValue(self.userData, 'weaponZ6', 'string', '20')
   CheckSetDefaultValue(self.userData, 'weaponZ7', 'string', '20')
   CheckSetDefaultValue(self.userData, 'weaponZ8', 'string', '20')
   CheckSetDefaultValue(self.userData, 'weaponZ9', 'string', '20')
   CheckSetDefaultValue(self.userData, 'weaponShow1', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponShow2', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponShow3', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponShow4', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponShow5', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponShow6', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponShow7', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponShow8', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponShow9', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponBob1', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponBob2', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponBob3', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponBob4', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponBob5', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponBob6', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponBob7', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponBob8', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponBob9', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponKickback1', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponKickback2', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponKickback3', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponKickback4', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponKickback5', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponKickback6', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponKickback7', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponKickback8', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponKickback9', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponRotation1', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponRotation2', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponRotation3', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponRotation4', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponRotation5', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponRotation6', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponRotation7', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponRotation8', 'boolean', true)
   CheckSetDefaultValue(self.userData, 'weaponRotation9', 'boolean', true)
end

kyto_weaponSwitch = {canPosition = false}
registerWidget('kyto_weaponSwitch')

function kyto_weaponSwitch:initialize()
   widgetCreateConsoleVariable('empty', 'int', 0)
   widgetCreateConsoleVariable('shoot', 'int', 0)
   -- widgetCreateConsoleVariable('low_ammo_warning', 'int', 1)

   self.userData = loadUserData()
   CheckSetDefaultValue(self, 'userData', 'table', {})
   CheckSetDefaultValue(self.userData, 'onEmpty2', 'string', '00000000')
   CheckSetDefaultValue(self.userData, 'onEmpty3', 'string', '00000000')
   CheckSetDefaultValue(self.userData, 'onEmpty4', 'string', '00000000')
   CheckSetDefaultValue(self.userData, 'onEmpty5', 'string', '00000000')
   CheckSetDefaultValue(self.userData, 'onEmpty6', 'string', '00000000')
   CheckSetDefaultValue(self.userData, 'onEmpty7', 'string', '00000000')
   CheckSetDefaultValue(self.userData, 'onEmpty8', 'string', '00000000')
   CheckSetDefaultValue(self.userData, 'onEmpty9', 'string', '00000000')
   -- CheckSetDefaultValue(self.userData, 'bypassEmptyPenalty', 'boolean', false)
   -- CheckSetDefaultValue(self.userData, 'attackBind', 'string', 'mouse1')
end

----------------------------------------------------------------------------------------------------
-- draw()
----------------------------------------------------------------------------------------------------

function KytoHUD:draw()
   if (consoleGetVariable('ui_kyto_gameTimer_reset_warmup') or 0) ~= 0 then
      kyto_warmupTimeElapsed = 0
      consolePerformCommand('ui_kyto_gameTimer_reset_warmup 0')
   end

   if self.userData.enforceViewportHeight then
      local resolution
      if consoleGetVariable('r_fullscreen') ~= 0 then
         resolution = consoleGetVariable('r_resolution_fullscreen')
      else
         resolution = consoleGetVariable('r_resolution_windowed')
      end

      if kyto_preResolutionWidth ~= resolution[1] or kyto_preResolutionHeight ~= resolution[2] then
         consolePrint('KytoHUD: Resolution change detected, forcing ui_viewport_height to ' .. resolution[2])
         consolePerformCommand('ui_viewport_height ' .. resolution[2])
         kyto_preResolutionWidth = resolution[1]
         kyto_preResolutionHeight = resolution[2]
      end
   end

   if kyto_getWidgetVisible('kyto_gameTimer') then
      if world.gameState == GAME_STATE_WARMUP then
         kyto_warmupTimeElapsed = kyto_warmupTimeElapsed + deltaTime
      elseif kyto_warmupTimeElapsed ~= 0 then
         kyto_warmupTimeElapsed = 0
      end
   end

   local worldMapName = world.mapName
   if worldMapName ~= kyto_preMapName then
      kyto_warmupTimeElapsed = 0
      -- if self.userData.autoClearLightmap then
      --    consolePerformCommand('r_lm_clear')
      --    consolePrint('KytoHUD: Lightmap cleared')
      -- end
   end
   kyto_preMapName = worldMapName
end

function kyto_armor:draw()
   if not kyto_shouldShowWidget() then return end

   local player = getPlayer()

   local showOn = widgetGetConsoleVariable('show')
   if not kyto_bitAnd(showOn, 1) and player.health <= 0 then return end
   if not kyto_bitAnd(showOn, 2) and isRaceMode() then return end

   local user = self.userData

   local fontColor = Color(255, 255, 255)
   if user.useArmorColors then
      local playerArmorProtection = player.armorProtection
      if playerArmorProtection == 0 then
         fontColor = KytoHUD.userData.armorGreenColor
      elseif playerArmorProtection == 1 then
         fontColor = KytoHUD.userData.armorYellowColor
      elseif playerArmorProtection == 2 then
         fontColor = KytoHUD.userData.armorRedColor
      end
   end

   local fontSize = 120

   local y
   local textVerticalAlign = kyto_getWidgetVerticalAlignment('kyto_armor')
   if textVerticalAlign == NVG_ALIGN_TOP then
      y = -20
   elseif textVerticalAlign == NVG_ALIGN_MIDDLE then
      y = -60
   elseif textVerticalAlign == NVG_ALIGN_BOTTOM then
      y = -100
   end

   nvgFontSize(fontSize)
   nvgFontFace(kyto_armor_font)
   nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)

   local armorText
   if not player.infoHidden then
      armorText = player.armor
   else
      armorText = '?'
      fontColor = Color(255, 255, 255)
   end

   if user.outlineText then
      kyto_drawTextOutline(0, y, armorText)
   end

   nvgFontBlur(0)
   nvgFillColor(fontColor)
   nvgText(0, y, armorText)
end

function kyto_crosshair:draw()
   if not kyto_shouldShowWidget() then return end

   drawCrosshair(self.userData, 0, 0, 1)
end

function kyto_deathMessages:draw()
   if not kyto_shouldShowWidget() then return end

   local user = self.userData

   local maxMessages = user.maxMessages
   if maxMessages <= 0 then return end

   local messageTime = user.time

   local keepInTime = 2 * deathMessages_messageFadeInOutTime
   if messageTime > keepInTime then
      keepInTime = messageTime - 2 * deathMessages_messageFadeInOutTime
   end

   local messageNumTotal = table.getn(deathMessages_messageTable)

   local debugMode = widgetGetConsoleVariable('debug') ~= 0
   if debugMode then
      if not deathMessages_preDebugMode then
         messageNumTotal = 0
         deathMessages_messageTable = {}
         for i = 1, maxMessages do
            messageNumTotal = messageNumTotal + 1

            local isSuicide = math.random(0, 1) == 1
            local deathDamageType
            if isSuicide then
               local deathDamageTypes = {
                  DAMAGE_TYPE_GRENADE,
                  DAMAGE_TYPE_PLASMA,
                  DAMAGE_TYPE_ROCKET,
                  DAMAGE_TYPE_LAVA,
                  DAMAGE_TYPE_DROWN,
                  DAMAGE_TYPE_OUTOFWORLD,
                  DAMAGE_TYPE_OVERTIME,
                  DAMAGE_TYPE_SUICIDE,
               }

               deathDamageType = deathDamageTypes[math.random(1, 8)]
            else
               local deathDamageTypes = {
                  DAMAGE_TYPE_MELEE,
                  DAMAGE_TYPE_BURST,
                  DAMAGE_TYPE_SHELL,
                  DAMAGE_TYPE_GRENADE,
                  DAMAGE_TYPE_PLASMA,
                  DAMAGE_TYPE_ROCKET,
                  DAMAGE_TYPE_BEAM,
                  DAMAGE_TYPE_BOLT,
                  DAMAGE_TYPE_STAKE,
                  DAMAGE_TYPE_TELEFRAG,
               }

               deathDamageType = deathDamageTypes[math.random(1, 10)]
            end

            local newMessage = {
               debug = true,
               fadeIn = deathMessages_messageFadeInOutTime,
               keepIn = keepInTime,
               fadeOut = deathMessages_messageFadeInOutTime,
               killerColor = kyto_copyColor(user.selfColor),
               victimColor = kyto_copyColor(user.enemyColor),
               killerFlag = 'internal/ui/icons/flags/fi',
               victimFlag = 'internal/ui/icons/flags/gb',
               killerName = 'Kyto',
               victimName = 'Lasker',
               killerIndex = 0,
               victimIndex = 0,
               logEventId = -i,
               deathDamageType = deathDamageType,
               deathMeleeDefId = 0,
               deathSuicide = isSuicide,
            }

            table.insert(deathMessages_messageTable, newMessage)
         end
      end
   elseif deathMessages_preDebugMode then
      messageNumTotal = 0
      deathMessages_messageTable = {}
   else
      for i, logEvent in ipairs(log) do
         if logEvent.type == LOG_TYPE_DEATHMESSAGE and deathMessages_eventsLogged[logEvent.id] == nil then
            local killerPlayer = kyto_getPlayerByNameAndTeam(logEvent.deathKiller, logEvent.deathTeamIndexKiller)
            local victimPlayer = kyto_getPlayerByNameAndTeam(logEvent.deathKilled, logEvent.deathTeamIndexKilled)

            if killerPlayer and victimPlayer then
               messageNumTotal = messageNumTotal + 1

               local killerFlag = ''
               if kyto_validCountries[killerPlayer.country] then
                  killerFlag = 'internal/ui/icons/flags/' .. killerPlayer.country
               end

               local victimFlag = ''
               if kyto_validCountries[victimPlayer.country] then
                  victimFlag = 'internal/ui/icons/flags/' .. victimPlayer.country
               end

               local newMessage = {
                  debug = false,
                  fadeIn = deathMessages_messageFadeInOutTime,
                  keepIn = keepInTime,
                  fadeOut = deathMessages_messageFadeInOutTime,
                  killerColor = getPlayerColor(user, killerPlayer),
                  victimColor = getPlayerColor(user, victimPlayer),
                  killerFlag = killerFlag,
                  victimFlag = victimFlag,
                  killerName = killerPlayer.name,
                  victimName = victimPlayer.name,
                  killerIndex = killerPlayer.index,
                  victimIndex = victimPlayer.index,
                  logEventId = logEvent.id,
                  deathDamageType = logEvent.deathDamageType,
                  deathMeleeDefId = logEvent.deathMeleeDefId,
                  deathSuicide = logEvent.deathSuicide,
                  hasCarnage = killerPlayer.carnageTimer > 0,
                  hasResist = killerPlayer.resistTimer > 0,
               }

               table.insert(deathMessages_messageTable, newMessage)
               deathMessages_eventsLogged[logEvent.id] = true
            end
         end
      end

      -- remove expired/old messages
      for i = messageNumTotal, 1, -1 do
         if deathMessages_messageTable[i].fadeOut <= 0 or messageNumTotal - i + 1 > maxMessages then
            messageNumTotal = messageNumTotal - 1
            table.remove(deathMessages_messageTable, i)
            -- clear these later somehow?
            -- deathMessages_eventsLogged[expiredLogEventId] = nil
            -- deathMessages_eventsPrinted[expiredLogEventId] = nil
         end
      end

      -- update colors if necessary
      if deathMessages_povPlayerChanged then
         for i = 1, messageNumTotal do
            deathMessages_messageTable[i].killerColor = getPlayerColor(user, players[deathMessages_messageTable[i].killerIndex])
            deathMessages_messageTable[i].victimColor = getPlayerColor(user, players[deathMessages_messageTable[i].victimIndex])
         end

         deathMessages_povPlayerChanged = false
      end
   end
   deathMessages_preDebugMode = debugMode

   local printToConsole = user.printToConsole
   local drawFlag = user.drawFlag
   local messageTime = user.time
   local outlineFlag = user.outlineFlag
   local outlineIcon = user.outlineIcon
   local outlineText = user.outlineText
   local useMeleeCosmetics = KytoHUD.userData.useMeleeCosmetics
   local textOutlineStyle = KytoHUD.userData.textOutlineStyle

   -- draw msgs
   local messageNum = 0
   if not user.reverse then
      for i = 1, messageNumTotal do
         messageNum = messageNum + 1
         drawDeathMessage(deathMessages_messageTable[i], messageNum, messageNumTotal, messageTime, printToConsole, drawFlag, outlineFlag, outlineIcon, outlineText, textOutlineStyle, useMeleeCosmetics)
      end
   else
      for i = messageNumTotal, 1, -1 do
         messageNum = messageNum + 1
         drawDeathMessage(deathMessages_messageTable[i], messageNum, messageNumTotal, messageTime, printToConsole, drawFlag, outlineFlag, outlineIcon, outlineText, textOutlineStyle, useMeleeCosmetics)
      end
   end
end

function kyto_fakeIonBeam:draw()
   if isInMenu() or loading.loadScreenVisible or world.timerActive and world.gameState == GAME_STATE_GAMEOVER then return end

   local player = getPlayer()
   if player and player.connected and player.state == PLAYER_STATE_INGAME and player.health > 0 then
      if player.weaponIndexSelected == 7 then
         local user = self.userData

         local extraCrosshairSize = widgetGetConsoleVariable('extra_crosshair')
         if extraCrosshairSize > 0 then
            nvgBeginPath()
            nvgCircle(0, 0, extraCrosshairSize)
            nvgStrokeColor(Color(255, 255, 255))
            nvgStrokeWidth(1)
            nvgStroke()
         end

         if not fakeIonBeam_zFucked then
            consolePerformCommand('cl_weapon_offset_z 9999999999999999999999999')
            fakeIonBeam_zFucked = true
         end

         if player.weapons[7].ammo > 0 and player.weaponSelectionIntensity == 1 and player.buttons.attack and not countdownActive() then
            local beamWidth = user.beamWidth
            local beamX = -beamWidth / 2
            if beamWidth % 2 ~= 0 then
               beamX = beamX - 0.5
            end
            nvgBeginPath()
            nvgRect(beamX, 0, beamWidth, viewport.height)
            nvgFillColor(user.beamColor)
            nvgFill()
         end
      else
         fakeIonBeam_zFucked = false
      end
   end
end

-- function kyto_fakeIonBeam:show()
--    consolePerformCommand('ui_set_widget_zindex kyto_fakeIonBeam 10000')
--    consolePerformCommand('ui_set_widget_offset kyto_fakeIonBeam 0 0')
--    consolePerformCommand('ui_set_widget_anchor kyto_fakeIonBeam 0 0')
--    consolePerformCommand('ui_set_widget_scale kyto_fakeIonBeam 1')
-- end

function kyto_followingPlayer:draw()
   local user = self.userData

   if not kyto_shouldShowWidget() or (not user.drawPlaying and playerIndexCameraAttachedTo == playerIndexLocalPlayer and not replayActive) then return end

   local player = getPlayer()
   if player == nil then return end

   if widgetGetConsoleVariable('override_reset') ~= 0 then
      widgetSetConsoleVariable('override_country', '')
      widgetSetConsoleVariable('override_name', '')
      widgetSetConsoleVariable('override_reset', 0)
   end

   nvgFontFace(kyto_followingPlayer_font)
   nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)

   local followingTextHeight = 30
   local playerNameHeight = 80
   local textHeight = playerNameHeight + followingTextHeight - 10
   local textHorizontalAlign = kyto_getWidgetHorizontalAlignment('kyto_followingPlayer')
   local textVerticalAlign = kyto_getWidgetVerticalAlignment('kyto_followingPlayer')

   local flagRadius = 24

   nvgFontSize(playerNameHeight)
   local flagSpacing = round(nvgTextWidth(' ') * 0.75)

   local drawFlag = user.drawFlag

   local outlineFlag = user.outlineFlag
   local outlineText = user.outlineText

   local countryOverride = widgetGetConsoleVariable('override_country')
   local nameOverride = widgetGetConsoleVariable('override_name')

   local playerFlag = ''
   if countryOverride ~= '' then
      if kyto_validCountries[countryOverride] ~= nil then
         playerFlag = 'internal/ui/icons/flags/' .. countryOverride
      end
   else
      if kyto_validCountries[player.country] ~= nil then
         playerFlag = 'internal/ui/icons/flags/' .. player.country
      end
   end

   local playerName = player.name
   if nameOverride ~= '' then
      playerName = nameOverride
   end

   local followingText = user.followingText

   nvgFontSize(followingTextHeight)
   local followingTextWidth = nvgTextWidth(followingText)

   nvgFontSize(playerNameHeight)
   local playerNameWidth = nvgTextWidth(playerName)
   if user.drawFlag and playerFlag ~= '' then
      playerNameWidth = playerNameWidth + flagRadius * 2 + flagSpacing
   end

   local maxWidth = math.max(followingTextWidth, playerNameWidth)

   local x = 0
   if textHorizontalAlign == NVG_ALIGN_LEFT then
      x = 0
   elseif textHorizontalAlign == NVG_ALIGN_CENTER then
      x = -(maxWidth / 2)
   elseif textHorizontalAlign == NVG_ALIGN_RIGHT then
      x = -maxWidth
   end

   local y = 0
   if textVerticalAlign == NVG_ALIGN_TOP then
      y = 0
   elseif textVerticalAlign == NVG_ALIGN_MIDDLE then
      y = -(textHeight / 2)
   elseif textVerticalAlign == NVG_ALIGN_BOTTOM then
      y = -textHeight
   end

   if followingText ~= '' then
      nvgFontSize(followingTextHeight)

      drawPlayerText(followingText, Color(255, 255, 255), x + (maxWidth - followingTextWidth) / 2, y, outlineText)

      y = y + 20
   end

   nvgFontSize(playerNameHeight)

   x = x + (maxWidth - playerNameWidth) / 2
   if drawFlag and playerFlag ~= '' then
      if user.flagPositionLeft then
         kyto_followingPlayer_drawFlag(playerFlag, 255, x + flagRadius, y + playerNameHeight / 2 + widgetGetConsoleVariable('flag_offset_y'), flagRadius, outlineFlag)
         x = x + flagRadius * 2 + flagSpacing
         drawPlayerText(playerName, Color(255, 255, 255), x, y, outlineText)
      else
         drawPlayerText(playerName, Color(255, 255, 255), x, y, outlineText)
         x = x + nvgTextWidth(playerName) + flagSpacing
         kyto_followingPlayer_drawFlag(playerFlag, 255, x + flagRadius, y + playerNameHeight / 2 + widgetGetConsoleVariable('flag_offset_y'), flagRadius, outlineFlag)
      end
   else
      drawPlayerText(playerName, Color(255, 255, 255), x, y, outlineText)
   end
end

function kyto_fragMessage:draw()
   if not kyto_shouldShowWidget() then return end

   local user = self.userData

   if widgetGetConsoleVariable('override_reset') ~= 0 then
      widgetSetConsoleVariable('override_country', '')
      widgetSetConsoleVariable('override_name', '')
      widgetSetConsoleVariable('override_reset', 0)
   end

   local fragObject
   local player = getPlayer()

   local countryOverride = widgetGetConsoleVariable('override_country')
   local nameOverride = widgetGetConsoleVariable('override_name')

   local fragMessageTime = user.time

   for i, logEvent in ipairs(log) do
      if logEvent.type == LOG_TYPE_DEATHMESSAGE and not logEvent.deathSuicide then
         local killerPlayer = kyto_getPlayerByNameAndTeam(logEvent.deathKiller, logEvent.deathTeamIndexKiller)
         local victimPlayer = kyto_getPlayerByNameAndTeam(logEvent.deathKilled, logEvent.deathTeamIndexKilled)

         if killerPlayer and victimPlayer and player.index == killerPlayer.index then
            local logEventAge = logEvent.age * 1000
            if logEventAge <= fragMessageTime then
               fragObject = {}

               if nameOverride ~= '' then
                  fragObject.name = nameOverride
               else
                  fragObject.name = victimPlayer.name
               end

               if countryOverride ~= '' then
                  fragObject.flag = 'internal/ui/icons/flags/' .. countryOverride
               else
                  if kyto_validCountries[victimPlayer.country] then
                     fragObject.flag = 'internal/ui/icons/flags/' .. victimPlayer.country
                  else
                     fragObject.flag = ''
                  end
               end

               if logEventAge < fragMessage_FadeInOutTime then
                  fragObject.intensity = logEventAge / fragMessage_FadeInOutTime
               elseif logEventAge > fragMessageTime - fragMessage_FadeInOutTime then
                  fragObject.intensity = (fragMessageTime - logEventAge) / fragMessage_FadeInOutTime
               else
                  fragObject.intensity = 1
               end

               break
            end
         end
      end
   end

   -- debug
   if widgetGetConsoleVariable('debug') ~= 0 then
      fragObject = {
         flag = 'internal/ui/icons/flags/gb',
         intensity = 1,
         name = 'Lasker',
      }
   end

   if fragObject ~= nil then
      local youFragged = 'You fragged'

      local textAlpha = 255 * fragObject.intensity
      local textHeight = 36

      nvgFontBlur(0)
      nvgFontSize(textHeight)
      nvgFontFace(kyto_fragMessage_font)

      local flagRadius = round(textHeight / 3)
      local flagSpacing = round(nvgTextWidth(' ') * 0.75)

      local drawFlag = user.drawFlag
      local textWidth = nvgTextWidth(youFragged .. ' ' .. fragObject.name)
      if drawFlag and fragObject.flag ~= '' then
         textWidth = textWidth + flagSpacing + flagRadius * 2
      end
   
      local x
      local fragMessageHorizontalAlignment = kyto_getWidgetHorizontalAlignment('kyto_fragMessage')
      if fragMessageHorizontalAlignment == NVG_ALIGN_LEFT then
         x = 0
      elseif fragMessageHorizontalAlignment == NVG_ALIGN_CENTER then
         x = -textWidth / 2
      elseif fragMessageHorizontalAlignment == NVG_ALIGN_RIGHT then
         x = -textWidth
      end

      local y
      local fragMessageVerticalAlignment = kyto_getWidgetVerticalAlignment('kyto_fragMessage')
      if fragMessageVerticalAlignment == NVG_ALIGN_TOP then
         y = 0
      elseif fragMessageVerticalAlignment == NVG_ALIGN_MIDDLE then
         y = -textHeight / 2
      elseif fragMessageVerticalAlignment == NVG_ALIGN_BOTTOM then
         y = -textHeight
      end

      nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)
      drawText(youFragged .. ' ' .. fragObject.name, Color(255, 255, 255, textAlpha), x, y, user.outlineText)

      if drawFlag then
         x = x + nvgTextWidth(youFragged .. ' ' .. fragObject.name) + flagSpacing + flagRadius
         -- nvgBeginPath()
         -- nvgRect(x - flagSpacing - flagRadius, y, flagRadius * 4, textHeight)
         -- nvgFillColor(Color(127, 127, 127))
         -- nvgFill()
         -- y = y + textHeight / 2 + flagRadius * 0.375 - flagSpacing / 2
         y = y + textHeight / 2 + widgetGetConsoleVariable('flag_offset_y')
         if fragObject.flag ~= '' then
            kyto_fragMessage_drawFlag(fragObject.flag, textAlpha, x, y, flagRadius, user.outlineFlag)
         end
      end
   end
end

function kyto_gameMessages:draw()
   if not kyto_shouldShowWidget('kyto_gameMessages') then return end

   local user = self.userData

   if world.timerActive then
      local text

      if world.gameState == GAME_STATE_WARMUP or world.gameState == GAME_STATE_ROUNDPREPARE then
         local timeRemaining = world.gameTimeLimit - world.gameTime
         local t = FormatTime(timeRemaining)
         text = t.seconds
         if gameMessages_lastTickSeconds ~= t.seconds then
            gameMessages_lastTickSeconds = t.seconds
            playSound('internal/ui/match/match_countdown_tick')
         end
      elseif world.gameState == GAME_STATE_ACTIVE or world.gameState == GAME_STATE_ROUNDACTIVE then
         if world.gameTime < 2000 then
            if world.overTimeCount == 0 then
               local gameMode = gamemodes[world.gameModeIndex].shortName
               if gameMode == 'race' or gameMode == 'training' then
                  text = 'GO'
               else
                  text = 'FIGHT'
               end
            elseif world.overTimeCount == 1 then
               text = 'OVERTIME!'
            else
               text = world.overTimeCount .. 'x OVERTIME!'
            end
         end
      elseif world.gameState == GAME_STATE_ROUNDCOOLDOWN_DRAW then
         text = 'Round Draw'
      elseif world.gameState == GAME_STATE_ROUNDCOOLDOWN_SOMEONEWON then
         text = nil
      elseif world.gameState == GAME_STATE_ROUNDPREPARE then
         text = nil
      end

      if not kyto_shouldShowWidget() then return end

      if text ~= nil then
         local textHeight = 48

         nvgFontSize(textHeight)
         nvgFontFace(kyto_gameMessages_font)

         local textWidth = nvgTextWidth(text)

         local x = 0
         local textHorizontalAlign = kyto_getWidgetHorizontalAlignment('kyto_gameMessages')
         if textHorizontalAlign == NVG_ALIGN_LEFT then
            x = 0
         elseif textHorizontalAlign == NVG_ALIGN_CENTER then
            x = -(textWidth / 2)
         elseif textHorizontalAlign == NVG_ALIGN_RIGHT then
            x = -textWidth
         end

         local y = 0
         local textVerticalAlign = kyto_getWidgetVerticalAlignment('kyto_gameMessages')
         if textVerticalAlign == NVG_ALIGN_TOP then
            y = 0
         elseif textVerticalAlign == NVG_ALIGN_MIDDLE then
            y = -(textHeight / 2)
         elseif textVerticalAlign == NVG_ALIGN_BOTTOM then
            y = -textHeight
         end

         nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)

         drawGameMessage(text, Color(255, 255, 255), x, y, user.outlineText)
      end
   end
end

function kyto_gameModeAndMap:draw()
   if not kyto_shouldShowWidget() or (playerIndexCameraAttachedTo == playerIndexLocalPlayer and world.gameState ~= GAME_STATE_WARMUP and not replayActive) then return end

   local player = getPlayer()
   if player == nil then return end

   local user = self.userData

   local gameMode = gamemodes[world.gameModeIndex]
   local gameInfo = string.format('%s[%s] @ %s', string.upper(gameMode.shortName), world.ruleset, world.mapTitle)
   if world.mapTitle == '' then
      gameInfo = string.upper(gameMode.shortName)
   end

   local textHorizontalAlign = kyto_getWidgetHorizontalAlignment('kyto_gameModeAndMap')
   local textVerticalAlign = kyto_getWidgetVerticalAlignment('kyto_gameModeAndMap')

   local y = 0
   if textVerticalAlign == NVG_ALIGN_TOP then
      y = 0
   elseif textVerticalAlign == NVG_ALIGN_MIDDLE then
      y = -30
   elseif textVerticalAlign == NVG_ALIGN_BOTTOM then
      y = -60
   end

   nvgFontFace(kyto_gameModeAndMap_font)
   nvgFontSize(60)
   nvgTextAlign(textHorizontalAlign, NVG_ALIGN_TOP)

   drawPlayerText(gameInfo, Color(255, 255, 255), 0, y, user.outlineText)
end

function kyto_gameTimer:draw()
   if not kyto_shouldShowWidget() then return end

   local user = self.userData

   local fontColor = Color(255, 255, 255)
   local fontSize = 120

   local delimiterSpacing = 5

   local timeElapsed = 0
   local countUp
   if world.gameState == GAME_STATE_ACTIVE or world.gameState == GAME_STATE_ROUNDACTIVE then
      timeElapsed = world.gameTime
      countUp = user.countUp
   elseif world.gameState == GAME_STATE_WARMUP then
      timeElapsed = kyto_warmupTimeElapsed * 1000
      countUp = user.countUpWarmup
   end

   local time = kyto_formatGameTimer(timeElapsed, world.gameTimeLimit, countUp)
   local minutes = string.format('%d', time.minutes)
   local seconds = string.format('%02d', time.seconds)
   local gameMode = gamemodes[world.gameModeIndex].shortName
   if world.gameState == GAME_STATE_ACTIVE and ((user.hideSeconds == 1 and gameMode == '1v1') or user.hideSeconds > 1) and world.gameTimeLimit - world.gameTime > 30000 then
      seconds = 'XX'
   end

   nvgFontBlur(0)
   nvgFontSize(fontSize)
   nvgFontFace(kyto_gameTimer_font)
   nvgFillColor(fontColor)
   nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)

   local timerMinutesWidth = nvgTextWidth(minutes)
   local timerDelimiterWidth = nvgTextWidth(':')
   local timerSecondsWidth = nvgTextWidth(seconds)

   local x
   local timerAlignmentHorizontal = kyto_getWidgetHorizontalAlignment('kyto_gameTimer')
   if timerAlignmentHorizontal == NVG_ALIGN_LEFT then
      x = 0
   elseif  timerAlignmentHorizontal == NVG_ALIGN_CENTER then
      x = -timerMinutesWidth - timerDelimiterWidth / 2 - delimiterSpacing
   elseif timerAlignmentHorizontal == NVG_ALIGN_RIGHT then
      x = -timerMinutesWidth - timerDelimiterWidth - timerSecondsWidth - delimiterSpacing * 2
   end

   local y
   local timerAlignmentVertical = kyto_getWidgetVerticalAlignment('kyto_gameTimer')
   if timerAlignmentVertical == NVG_ALIGN_TOP then
      y = -20
   elseif  timerAlignmentVertical == NVG_ALIGN_MIDDLE then
      y = -fontSize / 2
   elseif timerAlignmentVertical == NVG_ALIGN_BOTTOM then
      y = -fontSize + 20
   end

   local outlineText = user.outlineText
   local textOutlineStyle = KytoHUD.userData.textOutlineStyle

   if outlineText then
      kyto_drawTextOutline(x, y, minutes)
   end
   nvgFillColor(fontColor)
   nvgText(x, y, minutes)

   x = x + timerMinutesWidth + delimiterSpacing

   -- delimiter
   if outlineText then
      kyto_drawTextOutline(x, y, ':')
   end
   nvgFillColor(fontColor)
   nvgText(x, y, ':')

   x = x + timerDelimiterWidth + delimiterSpacing

   if outlineText then
      kyto_drawTextOutline(x, y, seconds)
   end
   nvgFillColor(fontColor)
   nvgText(x, y, seconds)
end

function kyto_health:draw()
   if not kyto_shouldShowWidget() then return end

   local player = getPlayer()
   local playerHealth = player.health

   local showOn = widgetGetConsoleVariable('show')
   if not kyto_bitAnd(showOn, 1) and playerHealth <= 0 then return end
   if not kyto_bitAnd(showOn, 2) and isRaceMode() then return end

   local user = self.userData

   local fontColor = user.healthColor
   local playerTrueHealth = kyto_getPlayerTrueHealth(player)
   if playerTrueHealth - 80 <= 0 then
      fontColor = user.healthColorBoltable
   elseif playerTrueHealth - 100 <= 0 then
      fontColor = user.healthColorRocketable
   end
   if user.megaIndicator and player.hasMega then
      fontColor = user.megaColor
   end

   local fontSize = 120

   local y
   local textVerticalAlign = kyto_getWidgetVerticalAlignment('kyto_health')
   if textVerticalAlign == NVG_ALIGN_TOP then
      y = -20
   elseif textVerticalAlign == NVG_ALIGN_MIDDLE then
      y = -60
   elseif textVerticalAlign == NVG_ALIGN_BOTTOM then
      y = -100
   end

   nvgFontSize(fontSize)
   nvgFontFace(kyto_health_font)
   nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_TOP)

   local healthText
   if not player.infoHidden then
      if not user.showNegative and playerHealth < 0 then
         healthText = 0
      else
         healthText = playerHealth
      end
   else
      healthText = '?'
      fontColor = Color(255, 255, 255)
   end

   if user.outlineText then
      kyto_drawTextOutline(0, y, healthText)
   end

   nvgFontBlur(0)
   nvgFillColor(fontColor)
   nvgText(0, y, healthText)
end

function kyto_ionBurstAcc:draw()
   if not kyto_shouldShowWidget() then return end

   local debugMode = widgetGetConsoleVariable('debug') ~= 0
   if not debugMode and (world.gameState == GAME_STATE_WARMUP or countdownActive()) then return end

   local user = self.userData

   local player = getPlayer()
   local localPlayer = getLocalPlayer()

   if not debugMode and localPlayer.state ~= PLAYER_STATE_SPECTATOR then return end

   if ionBurstAcc_prePlayerIndex ~= player.index then
      ionBurstAcc_preShootingIC = false

      ionBurstAcc_shotsFiredStart = 0
      ionBurstAcc_shotsFiredCount = 0

      ionBurstAcc_shotsHitStart = 0
      ionBurstAcc_shotsHitCount = 0

      ionBurstAcc_textTimer = 0
   end
   ionBurstAcc_prePlayerIndex = player.index

   local fadeTime = user.time

   -- if localPlayer.state ~= PLAYER_STATE_SPECTATOR then
   --    if gamemodes[world.gameModeIndex].hasTeams then
   --       if player.team ~= localPlayer.team then return end
   --    else
   --       if player.index ~= localPlayer.index then return end
   --    end
   -- end



   if shootingIC(player) then
      if ionBurstAcc_preShootingIC then
         -- still shooting IC
         ionBurstAcc_shotsFiredCount = player.weaponStats[7].shotsFired - ionBurstAcc_shotsFiredStart
         ionBurstAcc_shotsHitCount = player.weaponStats[7].shotsHit - ionBurstAcc_shotsHitStart
      else
         -- started shooting IC
         if ionBurstAcc_textTimer <= 0 then
            ionBurstAcc_shotsFiredStart = player.weaponStats[7].shotsFired
            ionBurstAcc_shotsHitStart = player.weaponStats[7].shotsHit
         end

         ionBurstAcc_textTimer = fadeTime
      end

      ionBurstAcc_preShootingIC = true
   elseif ionBurstAcc_preShootingIC then
      -- stopped shooting IC
      ionBurstAcc_preShootingIC = false
   else
      ionBurstAcc_textTimer = ionBurstAcc_textTimer - deltaTime * 1000
   end

   if ionBurstAcc_textTimer >= 0 or debugMode then
      local intensity = 1
      if user.fadeout then
         intensity = ionBurstAcc_textTimer / fadeTime
      end

      local text
      if ionBurstAcc_shotsFiredCount == 0 then
         text = '0%'
      else
         text = round(100 * ionBurstAcc_shotsHitCount / ionBurstAcc_shotsFiredCount) .. '%'
      end

      if debugMode then
         intensity = 1
         text = '69%'
      end

      local textHeight = 28.8
      local textHorizontalAlign = kyto_getWidgetHorizontalAlignment('kyto_ionBurstAcc')
      local textVerticalAlign = kyto_getWidgetVerticalAlignment('kyto_ionBurstAcc')

      local y = 0
      if textVerticalAlign == NVG_ALIGN_TOP then
         y = 0
      elseif textVerticalAlign == NVG_ALIGN_MIDDLE then
         y = -(textHeight / 2)
      elseif textVerticalAlign == NVG_ALIGN_BOTTOM then
         y = -textHeight
      end

      nvgFontSize(textHeight)
      nvgFontFace(kyto_ionBurstAcc_font)
      nvgTextAlign(textHorizontalAlign, NVG_ALIGN_TOP)

      if user.outlineText then
         kyto_drawTextOutline(0, y, text)
      end

      nvgFontBlur(0)
      nvgFillColor(Color(255, 255, 255, 255 * intensity))
      nvgText(0, y, text)
   end
end

function kyto_pickupTimers:draw()
   if not kyto_shouldShowWidget() then return end

   local user = self.userData

   local clearItems = user.clearItems

   local timerSpacing = 5
   local timerHeight = 50
   local timerWidth = 50

   local listHeight = timerHeight
   local listWidth = 0

   for k, v in ipairs(pickupTimers) do
      local vType = v.type
      if ((clearItems and (v.timeUntilRespawn > 0 or v.isHeldByPlayer)) or not clearItems) and
         (vType == PICKUP_TYPE_ARMOR50 or vType == PICKUP_TYPE_ARMOR100 or vType == PICKUP_TYPE_ARMOR150 or vType == PICKUP_TYPE_HEALTH100 or vType == PICKUP_TYPE_POWERUPCARNAGE or vType == PICKUP_TYPE_POWERUPRESIST) then
         listHeight = listHeight + timerHeight + timerSpacing
         listWidth = listWidth + timerWidth + timerSpacing
      end
   end
   listHeight = listHeight - timerSpacing
   listWidth = listWidth - timerSpacing

   local timerX
   local timerAlignmentHorizontal = kyto_getWidgetHorizontalAlignment('kyto_pickupTimers')
   if timerAlignmentHorizontal == NVG_ALIGN_LEFT then
      timerX = 0
   elseif  timerAlignmentHorizontal == NVG_ALIGN_CENTER then
      timerX = -listWidth / 2
   elseif timerAlignmentHorizontal == NVG_ALIGN_RIGHT then
      timerX = -listWidth
   end

   local timerY
   local timerAlignmentVertical = kyto_getWidgetVerticalAlignment('kyto_pickupTimers')
   if timerAlignmentVertical == NVG_ALIGN_TOP then
      timerY = timerHeight / 1.5
   elseif  timerAlignmentVertical == NVG_ALIGN_MIDDLE then
      timerY = 0
   elseif timerAlignmentVertical == NVG_ALIGN_BOTTOM then
      timerY = -timerHeight
   end

   local outlineIcon = user.outlineIcon
   local outlineText = user.outlineText
   local textOutlineStyle = KytoHUD.userData.textOutlineStyle

   for k, v in ipairs(pickupTimers) do
      local vTimeUntilRespawn = v.timeUntilRespawn
      local vIsHeldByPlayer = v.isHeldByPlayer
      local vType = v.type
      if ((clearItems and (vTimeUntilRespawn > 0 or vIsHeldByPlayer)) or not clearItems) and
         (vType == PICKUP_TYPE_ARMOR50 or vType == PICKUP_TYPE_ARMOR100 or vType == PICKUP_TYPE_ARMOR150 or vType == PICKUP_TYPE_HEALTH100 or vType == PICKUP_TYPE_POWERUPCARNAGE or vType == PICKUP_TYPE_POWERUPRESIST) then
         local iconRadius = timerHeight * 0.40
         local iconX = timerX + iconRadius + 5
         local iconY = timerY + (timerHeight / 2)

         local respawnTime = FormatTime(vTimeUntilRespawn)

         local iconColor = Color(255, 255, 255)
         local iconSvg = 'internal/ui/icons/armor'

         if vType == PICKUP_TYPE_ARMOR50 then
            iconSvg = 'internal/ui/icons/armor'
            iconColor = KytoHUD.userData.armorGreenColor
         elseif vType == PICKUP_TYPE_ARMOR100 then
            iconSvg = 'internal/ui/icons/armor'
            iconColor = KytoHUD.userData.armorYellowColor
         elseif vType == PICKUP_TYPE_ARMOR150 then
            iconSvg = 'internal/ui/icons/armor'
            iconColor = KytoHUD.userData.armorRedColor
         elseif vType == PICKUP_TYPE_HEALTH100 then
            iconSvg = 'internal/ui/icons/health'
            iconColor = KytoHUD.userData.megaColor
         elseif vType == PICKUP_TYPE_POWERUPCARNAGE then
            iconSvg = 'internal/ui/icons/carnage'
            iconColor = KytoHUD.userData.carnageColor
         elseif vType == PICKUP_TYPE_POWERUPRESIST then
            iconSvg = 'internal/ui/icons/resist'
            iconColor = KytoHud.userData.resistColor
         end

         if outlineIcon then
            kyto_drawSvgOutline(iconSvg, iconX, iconY + 1, iconRadius)
         end

         nvgFillColor(iconColor)
         nvgSvg(iconSvg, iconX, iconY, iconRadius)

         nvgFontFace(kyto_pickupTimers_font)
         nvgFontSize(timerHeight / 1.5)
         nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP)

         local textColor = Color(255, 255, 255)
         if vTimeUntilRespawn > 10000 then
            textColor = Color(255, 255, 255)
         elseif vTimeUntilRespawn > 5000 then
            textColor = Color(255, 255, 0)
         elseif not vIsHeldByPlayer then
            textColor = Color(255, 0, 0)
         end

         local textTime = ''
         if not vIsHeldByPlayer and vTimeUntilRespawn > 0 then
            textTime = string.format('%d', respawnTime.seconds)
         elseif vIsHeldByPlayer then
            textTime = '...'
         end

         if outlineText then
            kyto_drawTextOutline(iconX, timerY - timerHeight / 1.5, textTime)
         end

         nvgFontBlur(0)
         nvgFillColor(textColor)
         nvgText(iconX, timerY - timerHeight / 1.5, textTime)

         timerX = timerX + timerWidth + timerSpacing
      end
   end
end

function kyto_powerups:draw()
   if not kyto_shouldShowWidget() then return end

   local user = self.userData

   local player = getPlayer()
   local localPlayer = getLocalPlayer()

   local playerMegaRemaining = 0
   if localPlayer.state ~= PLAYER_STATE_INGAME then
      for i, p in ipairs(players) do
         if p.connected and p.state == PLAYER_STATE_INGAME and not p.infoHidden then
            if p.index == player.index then
               playerMegaRemaining = trackMegaHealth(p)
            else
               trackMegaHealth(p)
            end
         end
      end

      -- changed pov, reset variables
      if powerups_prePlayerIndex ~= player.index then
         powerups_hadCarnage = false
         powerups_hadResist = false
         powerups_hadMegaHealth = false

         powerups_carnageFadeout = 0
         powerups_resistFadeout = 0
         powerups_megaHealthFadeout = 0
      end
      powerups_prePlayerIndex = player.index
   else
      playerMegaRemaining = trackMegaHealth(player)
   end

   -- start fadeout
   if powerups_hadCarnage and player.carnageTimer <= 0 then
      powerups_carnageFadeout = 1000
   end

   if powerups_hadResist and player.resistTimer <= 0 then
      powerups_resistFadeout = 1000
   end

   if powerups_hadMegaHealth and playerMegaRemaining <= 0 then
      powerups_megaHealthFadeout = 1000
   end

   -- show powerup
   local hasCarnage = player.carnageTimer > 0 or powerups_carnageFadeout > 0
   local hasResist = player.resistTimer > 0 or powerups_resistFadeout > 0
   local hasMegaHealth = playerMegaRemaining > 0 or powerups_megaHealthFadeout > 0
   local hasFlag = player.hasFlag

   -- decrement fadeout
   if powerups_carnageFadeout > 0 then
      powerups_carnageFadeout = powerups_carnageFadeout - deltaTime * 1000
   else
      powerups_carnageFadeout = 0
   end

   if powerups_resistFadeout > 0 then
      powerups_resistFadeout = powerups_resistFadeout - deltaTime * 1000
   else
      powerups_resistFadeout = 0
   end

   if powerups_megaHealthFadeout > 0 then
      powerups_megaHealthFadeout = powerups_megaHealthFadeout - deltaTime * 1000
   else
      powerups_megaHealthFadeout = 0
   end

   -- debug
   local debugMode = widgetGetConsoleVariable('debug')
   if debugMode ~= 0 then
      hasCarnage = kyto_bitAnd(debugMode, 1)
      hasResist = kyto_bitAnd(debugMode, 2)
      hasMegaHealth = kyto_bitAnd(debugMode, 4)
      hasFlag = kyto_bitAnd(debugMode, 8)
   end

   powerups_hadCarnage = player.carnageTimer > 0
   powerups_hadResist = player.resistTimer > 0
   powerups_hadMegaHealth = playerMegaRemaining > 0
   powerups_hadFlag = player.hasFlag

   if not user.megaIndicator then
      hasMegaHealth = false
   end

   if not user.flagIndicator then
      hasFlag = false
   end

   local showOn = widgetGetConsoleVariable('show')
   if not kyto_bitAnd(showOn, 1) and player.health <= 0 then return end
   if not kyto_bitAnd(showOn, 2) and isRaceMode() then return end

   if not hasCarnage and not hasResist and not hasMegaHealth and not hasFlag then return end

   local powerupHeight = 36
   local powerupWidth = 90
   local powerupSpacing = 6

   local x
   local powerupAlignmentHorizontal = kyto_getWidgetHorizontalAlignment('kyto_powerups')
   if powerupAlignmentHorizontal == NVG_ALIGN_LEFT then
      x = 0
   elseif  powerupAlignmentHorizontal == NVG_ALIGN_CENTER then
      x = -powerupWidth / 2
   elseif powerupAlignmentHorizontal == NVG_ALIGN_RIGHT then
      x = -powerupWidth
   end

   local powerupHeightTotal = 0
   if hasCarnage then
      powerupHeightTotal = powerupHeightTotal + powerupHeight + powerupSpacing
   end
   if hasResist then
      powerupHeightTotal = powerupHeightTotal + powerupHeight + powerupSpacing
   end
   if hasMegaHealth then
      powerupHeightTotal = powerupHeightTotal + powerupHeight + powerupSpacing
   end
   if hasFlag then
      powerupHeightTotal = powerupHeightTotal + powerupHeight + powerupSpacing
   end
   powerupHeightTotal = powerupHeightTotal - powerupSpacing

   local y
   local powerupAlignmentVertical = kyto_getWidgetVerticalAlignment('kyto_powerups')
   if powerupAlignmentVertical == NVG_ALIGN_TOP then
      y = 0
   elseif powerupAlignmentVertical == NVG_ALIGN_MIDDLE then
      y = -powerupHeightTotal / 2
   elseif powerupAlignmentVertical == NVG_ALIGN_BOTTOM then
      y = -powerupHeightTotal
   end

   local carnageTimeRemaining = player.carnageTimer
   local resistTimeRemaining = player.resistTimer
   local megaHealthTimeRemaining = math.max(0, playerMegaRemaining) * 1000
   if not player.hasMega then
      megaHealthTimeRemaining = 0
   end

   local powerupTimeRemaining = {
      carnageTimeRemaining,
      resistTimeRemaining,
      megaHealthTimeRemaining
   }

   local powerupOrder
   if carnageTimeRemaining <= resistTimeRemaining and carnageTimeRemaining <= megaHealthTimeRemaining then
      if resistTimeRemaining <= megaHealthTimeRemaining then
         powerupOrder = {1, 2, 3} -- carnage, resist, mega
      else
         powerupOrder = {1, 3, 2} -- carnage, mega, resist
      end
   elseif resistTimeRemaining <= carnageTimeRemaining and resistTimeRemaining <= megaHealthTimeRemaining then
      if carnageTimeRemaining <= megaHealthTimeRemaining then
         powerupOrder = {2, 1, 3} -- resist, carnage, mega
      else
         powerupOrder = {2, 3, 1} -- resist, mega, carnage
      end
   elseif megaHealthTimeRemaining <= carnageTimeRemaining and megaHealthTimeRemaining <= resistTimeRemaining then
      if carnageTimeRemaining <= resistTimeRemaining then
         powerupOrder = {3, 1, 2} -- mega, carnage, resist
      else
         powerupOrder = {3, 2, 1} -- mega, resist, carnage
      end
   end

   local outlineIcon = user.outlineIcon
   local outlineText = user.outlineText

   for i, n in ipairs(powerupOrder) do
      if n == 1 and hasCarnage then
         drawPowerup(x, y, powerupWidth, powerupHeight, KytoHUD.userData.carnageColor, 'carnage', powerupTimeRemaining[n], outlineIcon, outlineText)
         y = y + powerupHeight + powerupSpacing
      elseif n == 2 and hasResist then
         drawPowerup(x, y, powerupWidth, powerupHeight, KytoHud.userData.resistColor, 'resist', powerupTimeRemaining[n], outlineIcon, outlineText)
         y = y + powerupHeight + powerupSpacing
      elseif n == 3 and hasMegaHealth then
         drawPowerup(x, y, powerupWidth, powerupHeight, KytoHUD.userData.megaColor, 'health', powerupTimeRemaining[n], outlineIcon, outlineText)
         y = y + powerupHeight + powerupSpacing
      end
   end

   if hasFlag then
      drawPowerup(x, y, powerupWidth, powerupHeight, teamColors[player.team % 2 + 1], 'CTFflag', nil, outlineIcon, outlineText)
   end
end

function kyto_readyUpStatus:draw()
   if not kyto_shouldShowWidget() or world.gameState ~= GAME_STATE_WARMUP then return end

   local user = self.userData

   local playersReady = 0
   local playersInGame = 0
   for i, p in ipairs(players) do
      if p.state == PLAYER_STATE_INGAME and p.connected then
         playersInGame = playersInGame + 1
         if p.ready then
            playersReady = playersReady + 1
         end
      end
   end

   local textHorizontalAlign = kyto_getWidgetHorizontalAlignment('kyto_readyUpStatus')
   local textVerticalAlign = kyto_getWidgetVerticalAlignment('kyto_readyUpStatus')

   local y = 0
   if textVerticalAlign == NVG_ALIGN_TOP then
      y = 0
   elseif textVerticalAlign == NVG_ALIGN_MIDDLE then
      y = -16
   elseif textVerticalAlign == NVG_ALIGN_BOTTOM then
      y = -32
   end

   local gameReadyUpText = string.format('%s/%s ready', playersReady, playersInGame)

   nvgFontFace(kyto_readyUpStatus_font)
   nvgFontSize(32)
   nvgTextAlign(textHorizontalAlign, NVG_ALIGN_TOP)

   drawPlayerText(gameReadyUpText, Color(255, 255, 255), 0, y, user.outlineText)
end

function kyto_scores:draw()
   if not kyto_shouldShowWidget() then return end

   local player = getPlayer()

   nvgFontFace(kyto_scores_font)
   nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP)

   local activePlayers = {}
   for _, p in ipairs(players) do
      if p.state == PLAYER_STATE_INGAME and p.connected then
         table.insert(activePlayers, p)
      end
   end

   local teamScore = 0
   local enemyScore = 0

   local gameMode = gamemodes[world.gameModeIndex].shortName
   if gameMode == 'ctf' then
      teamScore = world.teams[player.team].score
      enemyScore = world.teams[player.team % 2 + 1].score
   elseif gameMode == '1v1' or gameMode == 'tdm' or gameMode == '2v2' then
      teamScore = player.score
      for _, activePlayer in ipairs(activePlayers) do
         if player ~= activePlayer then
            enemyScore = enemyScore + activePlayer.score
         end
      end
   elseif gameMode == 'ffa' then
      teamScore = player.score
      local greatestEnemyScore = 0
      for _, activePlayer in ipairs(activePlayers) do
         if player ~= activePlayer and greatestEnemyScore < activePlayer.score then
            greatestEnemyScore = activePlayer.score
            enemyScore = activePlayer.score
         end
      end
   elseif gameMode == 'race' then
      return -- TODO
   elseif gameMode == 'training' then
      return -- TODO
   else
      return
   end
   local diffScore = teamScore - enemyScore

   local scoreHeight = 32
   local scoreSpacing = 8

   nvgFontSize(scoreHeight)

   local user = self.userData

   local scoreTextCount = 0
   local scoreTextWidth = 0
   if user.showScores then
      scoreTextWidth = math.max(scoreTextWidth, nvgTextWidth(teamScore))
      scoreTextWidth = math.max(scoreTextWidth, nvgTextWidth(enemyScore))
      scoreTextCount = scoreTextCount + 2
   end
   if user.showDiff then
      scoreTextWidth = math.max(scoreTextWidth, nvgTextWidth(diffScore))
      scoreTextCount = scoreTextCount + 1
   end
   local scoreWidth = scoreTextWidth + scoreSpacing * 2
   local scoreWidthTotal = scoreTextCount * scoreWidth

   local textHorizontalAlign = kyto_getWidgetHorizontalAlignment('kyto_scores')
   local x = 0
   if textHorizontalAlign == NVG_ALIGN_LEFT then
      x = 0
   elseif textHorizontalAlign == NVG_ALIGN_CENTER then
      x = -scoreWidthTotal / 2
   elseif textHorizontalAlign == NVG_ALIGN_RIGHT then
      x = -scoreWidthTotal
   end

   local textVerticalAlign = kyto_getWidgetVerticalAlignment('kyto_scores')
   local y = 0
   if textVerticalAlign == NVG_ALIGN_TOP then
      y = 0
   elseif textVerticalAlign == NVG_ALIGN_MIDDLE then
      y = -scoreHeight / 2
   elseif textVerticalAlign == NVG_ALIGN_BOTTOM then
      y = -scoreHeight
   end

   x = x - scoreWidth
   local textX

   -- teamScore
   if user.showScores then
      x = x + scoreWidth
      textX = x + scoreWidth / 2
      drawScore(x, y, scoreWidth, scoreHeight, textX, user.scoreSelfColor, teamScore, user.outlineText)
   end

   -- score difference
   if user.showDiff then
      x = x + scoreWidth
      textX = x + scoreWidth / 2
      drawScore(x, y, scoreWidth, scoreHeight, textX, user.scoreDiffColor, teamScore - enemyScore, user.outlineText)
   end

   -- enemyScore
   if user.showScores then
      x = x + scoreWidth
      textX = x + scoreWidth / 2
      drawScore(x, y, scoreWidth, scoreHeight, textX, user.scoreEnemyColor, enemyScore, user.outlineText)
   end
end

function kyto_teamInfo:draw()
   if not kyto_shouldShowWidget() then return end

   local gameMode = gamemodes[world.gameModeIndex].shortName
   if not gamemodes[world.gameModeIndex].hasTeams then return end

   local user = self.userData

   local localPlayer = getLocalPlayer()

   local player = getPlayer()

   local outlineIcon = user.outlineIcon
   local outlineText = user.outlineText

   local teamMateCount = 0
   local longestNameWidth = 0
   local maxNameWidth = widgetGetConsoleVariable('name_max_length')

   local rowHeight = 24
   local rowSpacing = 2
   local rowInnerSpacing = 4

   local columnSpacing = 5
   local columnInnerSpacing = 10

   local iconRadius = rowHeight * 0.3125

   nvgFontFace(kyto_teamInfo_font)
   nvgFontSize(rowHeight)
   nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)

   teamInfo_teamHasCarnage = false
   teamInfo_teamHasResist = false

   local showSelf = user.showSelf
   local alwaysShowPowerups = user.alwaysShowPowerups
   local highlightNamesOnPowerup = user.highlightNamesOnPowerup

   -- locations
   local locationConstantWidth = user.locationConstantWidth
   local useKimiLocations = user.useKimiLocations and KimiLocations ~= nil and KimiLocations.getLocation ~= nil and KimiLocations.nvgColorText ~= nil and map_locations ~= nil and map_locations[world.mapTitle] ~= nil
   local longestLocationWidth = 0

   for i, p in ipairs(players) do
      local pIndex = p.index
      if p.connected and p.state == PLAYER_STATE_INGAME and p.team == player.team and (pIndex ~= player.index or showSelf) then
         teamMateCount = teamMateCount + 1

         longestNameWidth = math.max(longestNameWidth, nvgTextWidth(p.name))

         if useKimiLocations and not locationConstantWidth then
            longestLocationWidth = math.max(longestLocationWidth, nvgTextWidth(KimiLocations:getLocation(pIndex):gsub('%^[0-9]', '')))
         end

         local carnageRemaining = FormatTime(p.carnageTimer)
         local resistRemaining = FormatTime(p.resistTimer)

         if not teamInfo_carnageTable[pIndex] then
            teamInfo_carnageTable[pIndex] = {has = false, fadeOut = 1000}
         end
         if carnageRemaining.seconds > 0 then
            teamInfo_teamHasCarnage = true
            teamInfo_carnageTable[pIndex].has = true
         elseif teamInfo_carnageTable[pIndex].fadeOut > 0 and teamInfo_carnageTable[pIndex].has then
            teamInfo_teamHasCarnage = true
            teamInfo_carnageTable[pIndex].has = true
            teamInfo_carnageTable[pIndex].fadeOut = teamInfo_carnageTable[pIndex].fadeOut - deltaTime * 1000
         else
            teamInfo_carnageTable[pIndex].has = false
            teamInfo_carnageTable[pIndex].fadeOut = 1000
         end

         if not teamInfo_resistTable[pIndex] then
            teamInfo_resistTable[pIndex] = {has = false, fadeOut = 1000}
         end
         if resistRemaining.seconds > 0 then
            teamInfo_teamHasResist = true
            teamInfo_resistTable[pIndex].has = true
         elseif teamInfo_resistTable[pIndex].fadeOut > 0 and teamInfo_resistTable[pIndex].has then
            teamInfo_teamHasResist = true
            teamInfo_resistTable[pIndex].has = true
            teamInfo_resistTable[pIndex].fadeOut = teamInfo_resistTable[pIndex].fadeOut - deltaTime * 1000
         else
            teamInfo_resistTable[pIndex].has = false
            teamInfo_resistTable[pIndex].fadeOut = 1000
         end
      end
   end

   -- clamp long names
   if maxNameWidth >= 0 and longestNameWidth > maxNameWidth then
      longestNameWidth = maxNameWidth
   end

   -- nothing to draw
   if teamMateCount <= 0 then return end

   -- get options
   local drawAmmo = user.drawAmmo
   local drawWeapons = user.drawWeapons
   local drawPowerup = user.drawPowerup
   local ammoIconFill = user.ammoIconFill
   local ammoCountColor = user.ammoCountColor
   local powerupIconFill = user.powerupIconFill
   local powerupTimeColor = user.powerupTimeColor
   local useMeleeCosmetics = KytoHUD.userData.useMeleeCosmetics
   local textOutlineStyle = KytoHUD.userData.textOutlineStyle

   local listWidth = columnSpacing * 2 + longestNameWidth + nvgTextWidth('999') * 2 + columnInnerSpacing * 3

   -- locations
   if useKimiLocations then
      if locationConstantWidth then
         for i, c in pairs(map_locations[world.mapTitle]) do
            longestLocationWidth = math.max(longestLocationWidth, nvgTextWidth(i:gsub('%^[0-9]', '')))
         end
      end
      listWidth = listWidth + longestLocationWidth + columnInnerSpacing
   end

   -- weapons
   if drawWeapons < 0 then
      if kyto_bitAnd(drawAmmo, 1) and kyto_bitAnd(drawAmmo, 2) then -- icon + count
         listWidth = listWidth + iconRadius * 2 + nvgTextWidth('999') + 4 + columnInnerSpacing
      elseif kyto_bitAnd(drawAmmo, 2) then -- count
         listWidth = listWidth + nvgTextWidth('999') + columnInnerSpacing
      elseif kyto_bitAnd(drawAmmo, 1) then -- icon
         listWidth = listWidth + iconRadius * 2 + columnInnerSpacing
      end
   elseif drawWeapons > 0 then
      if kyto_bitAnd(drawAmmo, 1) and kyto_bitAnd(drawAmmo, 2) then -- icon + count
         listWidth = listWidth + table.getn(kyto_teamInfo_weapons) * (iconRadius * 2 + nvgTextWidth('999') + 4 + columnInnerSpacing)
      elseif kyto_bitAnd(drawAmmo, 2) then -- count
         listWidth = listWidth + table.getn(kyto_teamInfo_weapons) * (nvgTextWidth('999') + columnInnerSpacing)
      elseif kyto_bitAnd(drawAmmo, 1) then -- icon
         listWidth = listWidth + table.getn(kyto_teamInfo_weapons) * (iconRadius * 2 + columnInnerSpacing)
      end
   end

   -- powerups
   if kyto_bitAnd(drawPowerup, 1) and kyto_bitAnd(drawPowerup, 2) then -- icon + count
      if teamInfo_teamHasCarnage or alwaysShowPowerups then
         listWidth = listWidth + iconRadius * 2 + nvgTextWidth('99') + 4 + columnInnerSpacing
      end
      if teamInfo_teamHasResist or alwaysShowPowerups then
         listWidth = listWidth + iconRadius * 2 + nvgTextWidth('99') + 4 + columnInnerSpacing
      end
   elseif kyto_bitAnd(drawPowerup, 2) then -- count
      if teamInfo_teamHasCarnage or alwaysShowPowerups then
         listWidth = listWidth + nvgTextWidth('99') + columnInnerSpacing
      end
      if teamInfo_teamHasResist or alwaysShowPowerups then
         listWidth = listWidth + nvgTextWidth('99') + columnInnerSpacing
      end
   elseif kyto_bitAnd(drawPowerup, 1) then -- icon
      if teamInfo_teamHasCarnage or alwaysShowPowerups then
         listWidth = listWidth + iconRadius * 2 + columnInnerSpacing
      end
      if teamInfo_teamHasResist or alwaysShowPowerups then
         listWidth = listWidth + iconRadius * 2 + columnInnerSpacing
      end
   end
   -- flag
   if gameMode == 'ctf' then
      listWidth = listWidth + iconRadius * 2 + columnInnerSpacing
   end
   -- mega
   if gameMode ~= 'atdm' then
      listWidth = listWidth + iconRadius * 2 + columnInnerSpacing
   end
   local listHeight = rowSpacing * 2 + teamMateCount * rowHeight + (teamMateCount - 1) * rowInnerSpacing

   local listX
   local listHorizontalAlignment = kyto_getWidgetHorizontalAlignment('kyto_teamInfo')
   if listHorizontalAlignment == NVG_ALIGN_LEFT then
      listX = 0
   elseif listHorizontalAlignment == NVG_ALIGN_CENTER then
      listX = -listWidth / 2
   elseif listHorizontalAlignment == NVG_ALIGN_RIGHT then
      listX = -listWidth
   end

   local listY = 0
   local listVerticalAlignment = kyto_getWidgetVerticalAlignment('kyto_teamInfo')
   if listVerticalAlignment == NVG_ALIGN_TOP then
      listY = 0
   elseif listVerticalAlignment == NVG_ALIGN_MIDDLE then
      listY = -listHeight / 2
   elseif listVerticalAlignment == NVG_ALIGN_BOTTOM then
      listY = -listHeight
   end

   -- draw background
   nvgBeginPath()
   nvgRect(listX, listY, listWidth, listHeight)
   nvgFillColor(user.backgroundColor)
   nvgFill()

   local delimiterColor = user.delimiterColor
   local textInactiveColor = user.textInactiveColor
   local iconInactiveColor = user.iconInactiveColor

   -- draw rows
   local lineY = listY + rowSpacing
   local teamMateNum = 0
   for i, p in ipairs(players) do
      local pIndex = p.index
      if p.connected and p.state == PLAYER_STATE_INGAME and p.team == player.team and (pIndex ~= player.index or showSelf) then
         local pArmor = p.armor
         local pArmorProtection = p.armorProtection
         local pHealth = p.health

         local pWeaponIndexSelected = p.weaponIndexSelected

         local pCarnageTimer = p.carnageTimer
         local pResistTimer = p.resistTimer

         local fontColor = user.textBaseColor
         local iconColor = user.iconBaseColor
         local iconSvg
         local powerupTimeRemaining
         local text
         teamMateNum = teamMateNum + 1

         local columnDelimiterY = lineY
         local columnDelimiterHeight = rowHeight + (rowInnerSpacing / 2)
         if teamMateNum == teamMateCount then
            columnDelimiterY = columnDelimiterY - (rowInnerSpacing / 2) + 1
            columnDelimiterHeight = columnDelimiterHeight - 1
         end

         -- draw name
         local lineX = listX + columnSpacing

         if maxNameWidth >= 0 then
            nvgScissor(lineX, lineY, maxNameWidth, rowHeight)
         end

         nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)
         if highlightNamesOnPowerup then
            if teamInfo_carnageTable[pIndex].has and teamInfo_resistTable[pIndex].has then
               fontColor = Color(
                  lerp(KytoHUD.userData.carnageColor.r, KytoHud.userData.resistColor.r, 0.5),
                  lerp(KytoHUD.userData.carnageColor.g, KytoHud.userData.resistColor.g, 0.5),
                  lerp(KytoHUD.userData.carnageColor.b, KytoHud.userData.resistColor.b, 0.5)
               )
            elseif teamInfo_carnageTable[pIndex].has then
               fontColor = Color(KytoHUD.userData.carnageColor.r, KytoHUD.userData.carnageColor.g, KytoHUD.userData.carnageColor.b)
            elseif teamInfo_resistTable[pIndex].has then
               fontColor = Color(KytoHud.userData.resistColor.r, KytoHud.userData.resistColor.g, KytoHud.userData.resistColor.b)
            end
         end
         if pHealth <= 0 then
            fontColor = user.textDeadColor
         end
         drawInfoText(p.name, fontColor, lineX, lineY, outlineText)

         if maxNameWidth >= 0 then
            nvgResetScissor()
         end

         local afterNameDrawn = false
         local afterLocationDrawn = false

         -- draw location
         if useKimiLocations and KimiLocations ~= nil and KimiLocations.getLocation ~= nil and KimiLocations.nvgColorText ~= nil and map_locations ~= nil and map_locations[world.mapTitle] ~= nil then
            lineX = lineX + longestNameWidth + columnInnerSpacing
            afterNameDrawn = true
            drawColumnDelimiter(lineX - (columnInnerSpacing / 2), columnDelimiterY, columnDelimiterHeight, delimiterColor)
            KimiLocations:nvgColorText(lineX, lineY, KimiLocations:getLocation(pIndex))
         end

         -- draw carnage
         if teamInfo_teamHasCarnage or alwaysShowPowerups then
            if not afterNameDrawn then
               lineX = lineX + longestNameWidth + columnInnerSpacing
               afterNameDrawn = true
            else
               if useKimiLocations and not afterLocationDrawn then
                  lineX = lineX + longestLocationWidth + columnInnerSpacing
                  afterLocationDrawn = true
               else
                  lineX = lineX + iconRadius + columnInnerSpacing
               end
            end
            drawColumnDelimiter(lineX - (columnInnerSpacing / 2), columnDelimiterY, columnDelimiterHeight, delimiterColor)

            if kyto_bitAnd(drawPowerup, 1) then
               iconColor = Color(KytoHUD.userData.carnageColor.r, KytoHUD.userData.carnageColor.g, KytoHUD.userData.carnageColor.b)
               iconSvg = 'internal/ui/icons/carnage'

               lineX = lineX + iconRadius
               local iconY = lineY + rowHeight / 2
               if outlineIcon then
                  kyto_drawSvgOutline(iconSvg, lineX, iconY, iconRadius)
               end

               if teamInfo_carnageTable[pIndex].has then
                  if powerupIconFill then
                     local powerupRatio = pCarnageTimer / 30000
                     local noPowerupRatio = (30000 - pCarnageTimer) / 30000
                     local backgroundColor = Color(
                        lerp(0, iconColor.r, 0.5),
                        lerp(0, iconColor.g, 0.5),
                        lerp(0, iconColor.b, 0.5)
                     )

                     local backgroundScissorY = iconY - iconRadius
                     local backgroundScissorHeight = iconRadius * 2 * noPowerupRatio

                     nvgScissor(lineX - iconRadius, backgroundScissorY, iconRadius * 2, backgroundScissorHeight)
                     nvgFillColor(backgroundColor)
                     nvgSvg(iconSvg, lineX, iconY, iconRadius)
                     nvgResetScissor()

                     local iconScissorY = backgroundScissorY + iconRadius * 2 * noPowerupRatio
                     local iconScissorHeight = iconRadius * 2 * powerupRatio

                     nvgScissor(lineX - iconRadius, iconScissorY, iconRadius * 2, iconScissorHeight)
                     nvgFillColor(iconColor)
                     nvgSvg(iconSvg, lineX, iconY, iconRadius)
                     nvgResetScissor()
                  else
                     nvgFillColor(iconColor)
                     nvgSvg(iconSvg, lineX, iconY, iconRadius)
                  end
               else
                  nvgFillColor(iconInactiveColor)
                  nvgSvg(iconSvg, lineX, iconY, iconRadius)
               end
            end

            if kyto_bitAnd(drawPowerup, 2) then -- count
               if kyto_bitAnd(drawPowerup, 1) then
                  lineX = lineX + iconRadius + nvgTextWidth('99') / 2 + 4
               else
                  lineX = lineX + nvgTextWidth('99') / 2
               end

               if teamInfo_carnageTable[pIndex].has then
                  powerupTimeRemaining = FormatTime(pCarnageTimer)
                  powerupTimeRemaining = powerupTimeRemaining.seconds
                  if powerupTimeRemaining <= 5 then
                     fontColor = Color(255, 0, 0)
                  elseif powerupTimeRemaining <= 10 then
                     fontColor = Color(255, 255, 0)
                  else
                     fontColor = Color(255, 255, 255)
                  end

                  if powerupTimeColor then
                     fontColor = Color(KytoHUD.userData.carnageColor.r, KytoHUD.userData.carnageColor.g, KytoHUD.userData.carnageColor.b)
                  end
               else
                  powerupTimeRemaining = '-'
                  fontColor = textInactiveColor
               end

               nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP)
               drawInfoText(powerupTimeRemaining, fontColor, lineX, lineY, outlineText)
            end
         end

         -- draw resist
         if teamInfo_teamHasResist or alwaysShowPowerups then
            if not afterNameDrawn then
               lineX = lineX + longestNameWidth + columnInnerSpacing
               afterNameDrawn = true
            else
               if useKimiLocations and not afterLocationDrawn then
                  lineX = lineX + longestLocationWidth + columnInnerSpacing
                  afterLocationDrawn = true
               else
                  lineX = lineX + iconRadius + columnInnerSpacing
               end
            end
            drawColumnDelimiter(lineX - (columnInnerSpacing / 2), columnDelimiterY, columnDelimiterHeight, delimiterColor)

            if kyto_bitAnd(drawPowerup, 1) then
               iconColor = Color(KytoHud.userData.resistColor.r, KytoHud.userData.resistColor.g, KytoHud.userData.resistColor.b)
               iconSvg = 'internal/ui/icons/resist'

               lineX = lineX + iconRadius
               local iconY = lineY + rowHeight / 2
               if outlineIcon then
                  kyto_drawSvgOutline(iconSvg, lineX, iconY, iconRadius)
               end

               if teamInfo_resistTable[pIndex].has then
                  if powerupIconFill then
                     local powerupRatio = pResistTimer / 30000
                     local noPowerupRatio = (30000 - pResistTimer) / 30000
                     local backgroundColor = Color(
                        lerp(0, iconColor.r, 0.5),
                        lerp(0, iconColor.g, 0.5),
                        lerp(0, iconColor.b, 0.5)
                     )

                     local backgroundScissorY = iconY - iconRadius
                     local backgroundScissorHeight = iconRadius * 2 * noPowerupRatio

                     nvgScissor(lineX - iconRadius, backgroundScissorY, iconRadius * 2, backgroundScissorHeight)
                     nvgFillColor(backgroundColor)
                     nvgSvg(iconSvg, lineX, iconY, iconRadius)
                     nvgResetScissor()

                     local iconScissorY = backgroundScissorY + iconRadius * 2 * noPowerupRatio
                     local iconScissorHeight = iconRadius * 2 * powerupRatio

                     nvgScissor(lineX - iconRadius, iconScissorY, iconRadius * 2, iconScissorHeight)
                     nvgFillColor(iconColor)
                     nvgSvg(iconSvg, lineX, iconY, iconRadius)
                     nvgResetScissor()
                  else
                     nvgFillColor(iconColor)
                     nvgSvg(iconSvg, lineX, iconY, iconRadius)
                  end
               else
                  nvgFillColor(iconInactiveColor)
                  nvgSvg(iconSvg, lineX, iconY, iconRadius)
               end
            end

            if kyto_bitAnd(drawPowerup, 2) then -- count
               if kyto_bitAnd(drawPowerup, 1) then
                  lineX = lineX + iconRadius + nvgTextWidth('99') / 2 + 4
               else
                  lineX = lineX + nvgTextWidth('99') / 2
               end

               if teamInfo_resistTable[pIndex].has then
                  powerupTimeRemaining = FormatTime(pResistTimer)
                  powerupTimeRemaining = powerupTimeRemaining.seconds
                  if powerupTimeRemaining <= 5 then
                     fontColor = Color(255, 0, 0)
                  elseif powerupTimeRemaining <= 10 then
                     fontColor = Color(255, 255, 0)
                  else
                     fontColor = Color(255, 255, 255)
                  end

                  if powerupTimeColor then
                     fontColor = Color(KytoHud.userData.resistColor.r, KytoHud.userData.resistColor.g, KytoHud.userData.resistColor.b)
                  end
               else
                  powerupTimeRemaining = '-'
                  fontColor = textInactiveColor
               end

               nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP)
               drawInfoText(powerupTimeRemaining, fontColor, lineX, lineY, outlineText)
            end
         end

         -- draw flag
         local flagDrawn = false
         if gameMode == 'ctf' then
            flagDrawn = true
            if not afterNameDrawn then
               lineX = lineX + longestNameWidth + columnInnerSpacing
               afterNameDrawn = true
            else
               if useKimiLocations and not afterLocationDrawn then
                  lineX = lineX + longestLocationWidth + columnInnerSpacing
                  afterLocationDrawn = true
               else
                  if kyto_bitAnd(drawPowerup, 1) and kyto_bitAnd(drawPowerup, 2) then -- icon + count
                     lineX = lineX + nvgTextWidth('99') / 2 + columnInnerSpacing
                  elseif kyto_bitAnd(drawPowerup, 2) then -- count
                     lineX = lineX + nvgTextWidth('99') / 2 + columnInnerSpacing
                  elseif kyto_bitAnd(drawPowerup, 1) then -- icon
                     lineX = lineX + iconRadius + columnInnerSpacing
                  end
               end
            end
            drawColumnDelimiter(lineX - (columnInnerSpacing / 2), columnDelimiterY, columnDelimiterHeight, delimiterColor)

            if outlineIcon then
               kyto_drawSvgOutline('internal/ui/icons/CTFflag', lineX + iconRadius, lineY + rowHeight / 2, iconRadius)
            end

            local flagColor = iconInactiveColor
            if p.hasFlag then
               flagColor = teamColors[p.team % 2 + 1]
            end
            nvgFillColor(flagColor)
            nvgSvg('internal/ui/icons/CTFflag', lineX + iconRadius, lineY + rowHeight / 2, iconRadius)
         end

         -- draw mega
         if gameMode ~= 'atdm' then
            if not afterNameDrawn then
               lineX = lineX + longestNameWidth + columnInnerSpacing
               afterNameDrawn = true
            else
               if useKimiLocations and not afterLocationDrawn then
                  lineX = lineX + longestLocationWidth + columnInnerSpacing
                  afterLocationDrawn = true
               else
                  if flagDrawn then
                     lineX = lineX + iconRadius * 2 + columnInnerSpacing
                  else
                     if kyto_bitAnd(drawPowerup, 1) and kyto_bitAnd(drawPowerup, 2) then -- icon + count
                        lineX = lineX + nvgTextWidth('99') / 2 + columnInnerSpacing
                     elseif kyto_bitAnd(drawPowerup, 2) then -- count
                        lineX = lineX + nvgTextWidth('99') / 2 + columnInnerSpacing
                     elseif kyto_bitAnd(drawPowerup, 1) then -- icon
                        lineX = lineX + iconRadius + columnInnerSpacing
                     end
                  end
               end
            end
            drawColumnDelimiter(lineX - (columnInnerSpacing / 2), columnDelimiterY, columnDelimiterHeight, delimiterColor)

            if outlineIcon then
               kyto_drawSvgOutline('internal/ui/icons/health', lineX + iconRadius, lineY + rowHeight / 2, iconRadius)
            end

            local megaColor = iconInactiveColor
            if p.hasMega then
               megaColor = KytoHUD.userData.megaColor
            end
            nvgFillColor(megaColor)
            nvgSvg('internal/ui/icons/health', lineX + iconRadius, lineY + rowHeight / 2, iconRadius)
         end

         -- draw health
         if not afterNameDrawn then
            lineX = lineX + longestNameWidth + columnInnerSpacing
            afterNameDrawn = true
         else
            if useKimiLocations and not afterLocationDrawn then
               lineX = lineX + longestLocationWidth + columnInnerSpacing
               afterLocationDrawn = true
            else
               lineX = lineX + iconRadius * 2 + columnInnerSpacing
            end
         end
         drawColumnDelimiter(lineX - (columnInnerSpacing / 2), columnDelimiterY, columnDelimiterHeight, delimiterColor)

         local playerTrueHealth = kyto_getPlayerTrueHealth(p)
         if playerTrueHealth - 80 <= 0 then
            fontColor = user.healthColorBoltable
         elseif playerTrueHealth - 100 <= 0 then
            fontColor = user.healthColorRocketable
         else
            fontColor = user.healthColor
         end

         if pHealth > 0 then
            text = pHealth
         else
            text = '0'
            fontColor = Color(200, 200, 200)
         end

         lineX = lineX + nvgTextWidth('999') / 2
         nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP)
         drawInfoText(text, fontColor, lineX, lineY, outlineText)

         -- draw armor
         lineX = lineX + nvgTextWidth('999') / 2 + columnInnerSpacing
         drawColumnDelimiter(lineX - (columnInnerSpacing / 2), columnDelimiterY, columnDelimiterHeight, delimiterColor)

         local fontColor
         if pArmorProtection == 0 then
            fontColor = KytoHUD.userData.armorGreenColor
         elseif pArmorProtection == 1 then
            fontColor = KytoHUD.userData.armorYellowColor
         elseif pArmorProtection == 2 then
            fontColor = KytoHUD.userData.armorRedColor
         end

         if pArmor >= 0 then
            text = pArmor
         else
            text = '0'
         end

         if p.health <= 0 then
            fontColor = Color(200, 200, 200)
         end

         lineX = lineX + nvgTextWidth('999') / 2
         drawInfoText(text, fontColor, lineX, lineY, outlineText)

         -- draw weapons
         lineX = lineX + nvgTextWidth('999') / 2 + columnInnerSpacing
         drawColumnDelimiter(lineX - (columnInnerSpacing / 2), columnDelimiterY, columnDelimiterHeight, delimiterColor)

         if drawAmmo > 0 and drawWeapons ~= 0 then
            if drawWeapons < 0 then
               kyto_teamInfo_weapons = {pWeaponIndexSelected}
            end

            for i, weaponIndex in ipairs(kyto_teamInfo_weapons) do
               local ammoCount = p.weapons[weaponIndex].ammo
               local ammoCountMax = p.weapons[weaponIndex].maxAmmo
               local weaponPickedUp = p.weapons[weaponIndex].pickedup

               iconColor = KytoHUD.userData['weaponColor' .. weaponIndex]
               if not weaponPickedUp then
                  iconColor = iconInactiveColor
               end
               iconSvg = 'internal/ui/icons/weapon' .. weaponIndex

               -- use melee cosmetics
               if weaponIndex == 1 then
                  iconColor = Color(255, 255, 255)
                  iconSvg = kyto_getPlayerMeleeCosmetic(p, useMeleeCosmetics)
               end

               -- draw highlight
               if pWeaponIndexSelected == weaponIndex then
                  nvgBeginPath()
                  if kyto_bitAnd(drawAmmo, 1) and kyto_bitAnd(drawAmmo, 2) then -- icon + count
                     nvgRect(lineX - (columnInnerSpacing / 2) + 1, columnDelimiterY, iconRadius * 2 + nvgTextWidth('999') + 4 + columnInnerSpacing - 1, columnDelimiterHeight)
                  elseif kyto_bitAnd(drawAmmo, 2) then -- count
                     nvgRect(lineX - (columnInnerSpacing / 2) + 1, columnDelimiterY, nvgTextWidth('999') + columnInnerSpacing - 1, columnDelimiterHeight)
                  elseif kyto_bitAnd(drawAmmo, 1) then -- icon
                     nvgRect(lineX - (columnInnerSpacing / 2) + 1, columnDelimiterY, iconRadius * 2 + columnInnerSpacing - 1, columnDelimiterHeight)
                  end
                  nvgFillColor(Color(255, 255, 255, 65))
                  nvgFill()
               end

               -- draw icon
               if kyto_bitAnd(drawAmmo, 1) then
                  lineX = lineX + iconRadius
                  local iconY = lineY + rowHeight / 2
                  if outlineIcon then
                     kyto_drawSvgOutline(iconSvg, lineX, iconY, iconRadius)
                  end

                  if ammoIconFill then
                     if weaponIndex ~= 1 then
                        local ammoRatio = ammoCount / ammoCountMax
                        local noAmmoRatio = (ammoCountMax - ammoCount) / ammoCountMax
                        local backgroundColor = Color(
                           lerp(0, iconColor.r, 0.5),
                           lerp(0, iconColor.g, 0.5),
                           lerp(0, iconColor.b, 0.5)
                        )

                        local backgroundScissorY = iconY - iconRadius
                        local backgroundScissorHeight = iconRadius * 2 * noAmmoRatio

                        nvgScissor(lineX - iconRadius, backgroundScissorY, iconRadius * 2, backgroundScissorHeight)
                        nvgFillColor(backgroundColor)
                        nvgSvg(iconSvg, lineX, iconY, iconRadius)
                        nvgResetScissor()

                        local iconScissorY = backgroundScissorY + iconRadius * 2 * noAmmoRatio
                        local iconScissorHeight = iconRadius * 2 * ammoRatio

                        nvgScissor(lineX - iconRadius, iconScissorY, iconRadius * 2, iconScissorHeight)
                        nvgFillColor(iconColor)
                        nvgSvg(iconSvg, lineX, iconY, iconRadius)
                        nvgResetScissor()
                     else
                        nvgFillColor(iconColor)
                        nvgSvg(iconSvg, lineX, iconY, iconRadius)
                     end
                  else
                     -- debug
                     -- nvgBeginPath()
                     -- nvgRect(lineX - iconRadius, iconY - iconRadius, iconRadius * 2, iconRadius * 2)
                     -- nvgFillColor(iconColor)
                     -- nvgFill()

                     nvgFillColor(iconColor)
                     nvgSvg(iconSvg, lineX, iconY, iconRadius)
                  end
               end

               -- draw ammo
               if kyto_bitAnd(drawAmmo, 1) and kyto_bitAnd(drawAmmo, 2) then -- icon + count
                  lineX = lineX + iconRadius + nvgTextWidth('999') / 2 + 4
               elseif kyto_bitAnd(drawAmmo, 2) then -- count
                  lineX = lineX + nvgTextWidth('999') / 2
               elseif kyto_bitAnd(drawAmmo, 1) then -- icon
                  lineX = lineX + iconRadius
               end

               if kyto_bitAnd(drawAmmo, 2) then
                  if not weaponPickedUp then
                     fontColor = Color(100, 100, 100)
                  else
                     if ammoCountColor then
                        fontColor = KytoHUD.userData['weaponColor' .. weaponIndex]
                     else
                        if ammoCount <= kyto_ammoCountLow[weaponIndex] then
                           fontColor = Color(255, 0, 0)
                        elseif ammoCount <= kyto_ammoCountMed[weaponIndex] then
                           fontColor = Color(255, 255, 0)
                        else
                           fontColor = Color(255, 255, 255)
                        end
                     end
                  end

                  if weaponIndex == 1 then
                     ammoCount = '-'
                  end

                  nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP)
                  drawInfoText(ammoCount, fontColor, lineX, lineY, outlineText)
               end

               if kyto_bitAnd(drawAmmo, 1) and kyto_bitAnd(drawAmmo, 2) then -- icon + count
                  lineX = lineX + nvgTextWidth('999') / 2 + columnInnerSpacing
               elseif kyto_bitAnd(drawAmmo, 2) then -- count
                  lineX = lineX + nvgTextWidth('999') / 2 + columnInnerSpacing
               elseif kyto_bitAnd(drawAmmo, 1) then -- icon
                  lineX = lineX + columnInnerSpacing
               end

               drawColumnDelimiter(lineX - (columnInnerSpacing / 2), columnDelimiterY, columnDelimiterHeight, delimiterColor)
            end
         end

         -- draw powerups
         lineX = lineX + columnInnerSpacing

         --
         if teamMateNum < teamMateCount then
            lineY = lineY + rowHeight + rowInnerSpacing
            drawRowDelimiter(listX + columnSpacing, lineY - (rowInnerSpacing / 2), columnSpacing, listWidth)
         end
      end
   end
end

function kyto_toasty:draw()
   if not kyto_shouldShowWidget() then return end

   local player = getPlayer()

   local debugMode = widgetGetConsoleVariable('debug')

   local fadeInTime = 250
   local fadeOutTime = 500
   local keepInTime = 250

   local danFordenRadius = 140
   local danFordenX = viewport.width / 2 + danFordenRadius + 1
   local danFordenY = viewport.height / 2 + -danFordenRadius + 5
   local moveDistance = -danFordenRadius * 2 - 1

   for i, log in pairs(toasty_log) do
      if log.timeUntilToasty <= 0 then
         log.timeUntilToasty = 0
         table.remove(toasty_log, i)
      else
         log.timeUntilToasty = log.timeUntilToasty - deltaTime * 1000
      end
   end

   for i, logEvent in ipairs(log) do
      if not logEvent.deathSuicide and logEvent.deathTeamIndexKiller ~= logEvent.deathTeamIndexVictim and toasty_loggedEvents[logEvent.id] == nil then
         toasty_loggedEvents[logEvent.id] = true

         local killerPlayer = kyto_getPlayerByNameAndTeam(logEvent.deathKiller, logEvent.deathTeamIndexKiller)
         if killerPlayer ~= nil then
            local killerIndex = killerPlayer.index
            local killerName = killerPlayer.name

            if toasty_log[killerIndex] == nil then
               toasty_log[killerIndex] = {
                  playerName = killerName,
                  timeUntilToasty = 0,
               }
            end

            if toasty_log[killerIndex].timeUntilToasty <= 0 then
               toasty_log[killerIndex].timeUntilToasty = toastyWindow
            else
               if killerIndex == playerIndexCameraAttachedTo then -- only do TOASTY if we're spectating the dude
                  toasty_TOASTYYY = true
               end
               toasty_log[killerIndex].timeUntilToasty = toastyWindow
            end
         end
      end
   end

   if widgetGetConsoleVariable('toasty') ~= 0 then
      toasty_TOASTYYY = true
      widgetSetConsoleVariable('toasty', 0)
   end

   local animDuration = fadeInTime + keepInTime + fadeOutTime
   if toasty_animTime ~= 0 then
      if toasty_animTime < 0 then
         toasty_animTime = 0
         toasty_soundPlayed = false
         toasty_TOASTYYY = false
      else
         toasty_animTime = toasty_animTime - deltaTime * 1000
      end
   elseif toasty_TOASTYYY then
      toasty_animTime = animDuration
   end

   if toasty_TOASTYYY then
      local xMove = 0

      local animTimeReverse = animDuration - toasty_animTime

      if animTimeReverse < fadeInTime then
         xMove = animTimeReverse / fadeInTime * moveDistance
      elseif animTimeReverse < fadeInTime + keepInTime then
         xMove = moveDistance
         if toasty_soundPlayed == false then
            playSound('internal/ui/widgets/kytohud/sfx/toasty')
            consolePrint('TOASTYYY!')
            toasty_soundPlayed = true
         end
      elseif animTimeReverse < fadeInTime + keepInTime + fadeOutTime then
         xMove = moveDistance - (animTimeReverse - keepInTime - fadeInTime) / fadeOutTime * moveDistance
      end

      nvgSvg('internal/ui/widgets/kytohud/gfx/danForden', danFordenX + xMove, danFordenY, danFordenRadius)
   else
      nvgSvg('internal/ui/widgets/kytohud/gfx/danForden', danFordenX, danFordenY, danFordenRadius)
   end
end

function kyto_verticalBar:draw()
   if not kyto_shouldShowWidget() then return end

   local player = getPlayer()

   local showOn = widgetGetConsoleVariable('show')
   if not kyto_bitAnd(showOn, 1) and player.health <= 0 then return end
   if not kyto_bitAnd(showOn, 2) and isRaceMode() then return end

   local user = self.userData

   local barColor = user.healthColor
   local playerTrueHealth = kyto_getPlayerTrueHealth(player)
   if playerTrueHealth - 80 <= 0 then
      barColor = user.healthColorBoltable
   elseif playerTrueHealth - 100 <= 0 then
      barColor = user.healthColorRocketable
   end
   if user.useArmorColors then
      local playerArmorProtection = player.armorProtection
      if playerArmorProtection == 0 then
         barColor = KytoHUD.userData.armorGreenColor
      elseif playerArmorProtection == 1 then
         barColor = KytoHUD.userData.armorYellowColor
      elseif playerArmorProtection == 2 then
         barColor = KytoHUD.userData.armorRedColor
      end
   end
   if user.megaIndicator and player.hasMega then
      barColor = user.megaColor
   end

   local barWidth = 4
   local barHeight = 70

   local x
   local barHorizontalAlign = kyto_getWidgetHorizontalAlignment('kyto_verticalBar')
   if barHorizontalAlign == NVG_ALIGN_LEFT then
      x = 0
   elseif barHorizontalAlign == NVG_ALIGN_CENTER then
      x = -barWidth / 2
   elseif barHorizontalAlign == NVG_ALIGN_RIGHT then
      x = -barWidth
   end

   local y
   local barVerticalAlign = kyto_getWidgetVerticalAlignment('kyto_verticalBar')
   if barVerticalAlign == NVG_ALIGN_TOP then
      y = 5
   elseif barVerticalAlign == NVG_ALIGN_MIDDLE then
      y = -barHeight / 2
   elseif barVerticalAlign == NVG_ALIGN_BOTTOM then
      y = -barHeight - 5
   end

   nvgBeginPath()
   nvgRect(x, y, barWidth, barHeight)
   if user.outlineRect then
      kyto_drawRectOutline()
   end
   nvgFillColor(barColor)
   nvgFill()
end

function kyto_weaponAccuracies:draw()
   if not kyto_shouldShowWidget() then return end

   local user = self.userData

   local localPlayer = getLocalPlayer()
   local player = getPlayer()

   local drawWeapons = user.drawWeapons
   if drawWeapons == 0 then return end

   local weaponAccuracyHeight = 36
   local weaponAccuracySpacing = 6

   local weaponIndexSelected = player.weaponIndexSelected

   local iconRadius = weaponAccuracyHeight * 0.25
   local textHeight = weaponAccuracyHeight * 0.8

   nvgFontSize(textHeight)
   nvgFontFace(kyto_weaponAccuracies_font)
   nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)

   local weaponCount = table.getn(kyto_weaponAccuracies_weapons)
   local weaponAccuracyHeightTotal = weaponCount * weaponAccuracyHeight + (weaponCount - 1) * weaponAccuracySpacing
   local weaponAccuracyWidth = weaponAccuracySpacing * 3 + iconRadius * 2 + nvgTextWidth('100%')

   local x
   local weaponAccuracyAlignmentHorizontal = kyto_getWidgetHorizontalAlignment('kyto_weaponAccuracies')
   if weaponAccuracyAlignmentHorizontal == NVG_ALIGN_LEFT then
      x = 0
   elseif  weaponAccuracyAlignmentHorizontal == NVG_ALIGN_CENTER then
      x = -weaponAccuracyWidth / 2
   elseif weaponAccuracyAlignmentHorizontal == NVG_ALIGN_RIGHT then
      x = -weaponAccuracyWidth
   end

   local y
   local weaponAccuracyAlignmentVertical = kyto_getWidgetVerticalAlignment('kyto_weaponAccuracies')
   if weaponAccuracyAlignmentVertical == NVG_ALIGN_TOP then
      y = 0
   elseif weaponAccuracyAlignmentVertical == NVG_ALIGN_MIDDLE then
      y = -weaponAccuracyHeightTotal / 2
   elseif weaponAccuracyAlignmentVertical == NVG_ALIGN_BOTTOM then
      y = -weaponAccuracyHeightTotal
   end

   local alpha = clamp(widgetGetConsoleVariable('background'), 0, 255)
   if drawWeapons < 0 then
      kyto_weaponAccuracies_weapons = {weaponIndexSelected}
   end

   local outlineIcon = user.outlineIcon
   local outlineText = user.outlineText
   local useMeleeCosmetics = KytoHUD.userData.useMeleeCosmetics
   local textOutlineStyle = KytoHUD.userData.textOutlineStyle

   for i, weaponIndex in ipairs(kyto_weaponAccuracies_weapons) do
      if alpha ~= 0 then
         nvgBeginPath()
         nvgRoundedRect(x, y, weaponAccuracyWidth, weaponAccuracyHeight, 2)
         nvgFillColor(Color(0, 0, 0, alpha))
         nvgFill()
      end

      local iconX = x + weaponAccuracySpacing + iconRadius
      local iconY = y + (weaponAccuracyHeight / 2)

      local iconSvg = 'internal/ui/icons/weapon' .. weaponIndex
      local iconColor = player.weapons[weaponIndex].color

      -- use melee cosmetics
      if weaponIndex == 1 then
         iconColor = Color(255, 255, 255)
         iconSvg = kyto_getPlayerMeleeCosmetic(player, useMeleeCosmetics)
      end

      if outlineIcon then
         kyto_drawSvgOutline(iconSvg, iconX, iconY, iconRadius)
      end

      nvgFillColor(iconColor)
      nvgSvg(iconSvg, iconX, iconY, iconRadius)

      local weaponAccuracy
      local weaponAccuracyColor
      if accuracyHidden(player) then
         -- weaponAccuracy = round(100 * getWeaponAccuracyLatched(player, weaponIndex)) .. '%'
         -- weaponAccuracyColor = Color(127, 127, 127)
         weaponAccuracy = 'N/A'
         weaponAccuracyColor = Color(255, 255, 255)
      else
         weaponAccuracy = round(100 * getWeaponAccuracy(player, weaponIndex)) .. '%'
         weaponAccuracyColor = Color(255, 255, 255)
      end

      local weaponAccuracyX = iconX + iconRadius + weaponAccuracySpacing + (nvgTextWidth('100%') - nvgTextWidth(weaponAccuracy))
      local weaponAccuracyY = y + (weaponAccuracyHeight / 2) - (textHeight / 2)

      if accuracyHidden(player) or world.gameState == GAME_STATE_WARMUP then
         weaponAccuracy = 'N/A'
         weaponAccuracyX = iconX + iconRadius + weaponAccuracySpacing + nvgTextWidth('100%') / 2 - nvgTextWidth('N/A') / 2
      end

      if outlineText then
         kyto_drawTextOutline(weaponAccuracyX, weaponAccuracyY, weaponAccuracy)
      end

      nvgFontBlur(0)
      nvgFillColor(weaponAccuracyColor)
      nvgText(weaponAccuracyX, weaponAccuracyY, weaponAccuracy)
      y = y + weaponAccuracyHeight + weaponAccuracySpacing
   end
end

function kyto_weaponList:draw()
   if not kyto_shouldShowWidget() then return end

   local user = self.userData

   local player = getPlayer()

   local showOn = widgetGetConsoleVariable('show')
   if not kyto_bitAnd(showOn, 1) and player.health <= 0 then return end
   if not kyto_bitAnd(showOn, 2) and isRaceMode() then return end

   local drawWeapons = user.drawWeapons
   if drawWeapons == 0 then return end

   local weaponWidth = 120
   local weaponHeight = 48
   local weaponSpacing = 6

   local listWidth = -weaponSpacing
   if drawWeapons < 0 then
      listWidth = listWidth + weaponWidth + weaponSpacing
   else
      for i, weaponIndex in ipairs(kyto_weaponList_weapons) do
         if kyto_shouldShowWeapon(player.weapons[weaponIndex], user.showUnpickedAmmo, user.showUnpickedNoAmmo) then
            listWidth = listWidth + weaponWidth + weaponSpacing
         end
      end
   end

   local weaponX
   local listHorizontalAlignment = kyto_getWidgetHorizontalAlignment('kyto_weaponList')
   if listHorizontalAlignment == NVG_ALIGN_LEFT then
      weaponX = 0
   elseif listHorizontalAlignment == NVG_ALIGN_CENTER then
      weaponX = -listWidth / 2
   elseif listHorizontalAlignment == NVG_ALIGN_RIGHT then
      weaponX = -listWidth
   end

   local weaponY
   local listVerticalAlignment = kyto_getWidgetVerticalAlignment('kyto_weaponList')
   if listVerticalAlignment == NVG_ALIGN_TOP then
      weaponY = 0
   elseif listVerticalAlignment == NVG_ALIGN_MIDDLE then
      weaponY = -weaponHeight / 2
   elseif listVerticalAlignment == NVG_ALIGN_BOTTOM then
      weaponY = -weaponHeight
   end

   if drawWeapons < 0 then
      kyto_weaponList_weapons = {player.weaponIndexSelected}
   end

   local outlineIcon = user.outlineIcon
   local outlineText = user.outlineText
   local useMeleeCosmetics = KytoHUD.userData.useMeleeCosmetics
   local textOutlineStyle = KytoHUD.userData.textOutlineStyle

   local weaponIndexSelected = player.weaponIndexSelected
   local weaponSelectionIntensity = player.weaponSelectionIntensity
   for _, weaponIndex in ipairs(kyto_weaponList_weapons) do
      local weapon = player.weapons[weaponIndex]

      if kyto_shouldShowWeapon(weapon, user.showUnpickedAmmo, user.showUnpickedNoAmmo) then
         local iconColor = kyto_copyColor(KytoHUD.userData['weaponColor' .. weaponIndex])
         local iconSvg = 'internal/ui/icons/weapon' .. weaponIndex

         -- use melee cosmetics
         if weaponIndex == 1 then
            iconColor = Color(255, 255, 255)
            iconSvg = kyto_getPlayerMeleeCosmetic(player, useMeleeCosmetics)
         end

         local backgroundColor = Color(0, 0, 0, 65)

         nvgBeginPath()
         nvgRect(weaponX, weaponY, weaponWidth, weaponHeight)

         if weaponIndexSelected == weaponIndex then
            backgroundColor = Color(
               lerp(backgroundColor.r, iconColor.r, weaponSelectionIntensity),
               lerp(backgroundColor.g, iconColor.g, weaponSelectionIntensity),
               lerp(backgroundColor.b, iconColor.b, weaponSelectionIntensity),
               lerp(backgroundColor.a, 127, weaponSelectionIntensity)
            )

            local strokeColor = Color(iconColor.r, iconColor.g, iconColor.b, lerp(0, 255, weaponSelectionIntensity))

            nvgStrokeWidth(2)
            nvgStrokeColor(strokeColor)
            nvgStroke()

            iconColor = Color(
               lerp(iconColor.r, 255, weaponSelectionIntensity),
               lerp(iconColor.g, 255, weaponSelectionIntensity),
               lerp(iconColor.b, 255, weaponSelectionIntensity),
               lerp(iconColor.a, 255, weaponSelectionIntensity)
            )
         end

         if not weapon.pickedup then
            backgroundColor = Color(127, 127, 127, 65)

            iconColor = Color(
               127,
               127,
               127,
               iconColor.a
            )
         end

         local iconRadius = weaponHeight * 0.40
         local iconX = weaponX + (weaponHeight - iconRadius)
         local iconY = weaponY + (weaponHeight / 2)

         nvgFillColor(backgroundColor)
         nvgFill()

         if outlineIcon then
            kyto_drawSvgOutline(iconSvg, iconX, iconY, iconRadius)
         end
         nvgFillColor(iconColor)
         nvgSvg(iconSvg, iconX, iconY, iconRadius)

         if weaponIndex ~= 1 then
            local ammoCount = weapon.ammo
            local ammoX = weaponX + (iconRadius) + (weaponWidth / 2)
            local ammoColor = Color(255, 255, 255)
            if ammoCount <= kyto_ammoCountLow[weaponIndex] then
               ammoColor = Color(255, 0, 0)
            elseif ammoCount <= kyto_ammoCountMed[weaponIndex] then
               ammoColor = Color(255, 255, 0)
            end

            if not weapon.pickedup then
               ammoColor = Color(
                  127,
                  127,
                  127,
                  ammoColor.a
               )
            end

            nvgFontFace(kyto_weaponList_font)
            nvgFontSize(weaponHeight)
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP)

            if outlineText then
               kyto_drawTextOutline(ammoX, weaponY, ammoCount)
            end

            nvgFontBlur(0)
            nvgFillColor(ammoColor)
            nvgText(ammoX, weaponY, ammoCount)
         end

         weaponX = weaponX + weaponWidth + weaponSpacing
      end
   end
end

function kyto_weaponOffsets:draw()
   local player = getPlayer()
   if player and player.connected and player.state == PLAYER_STATE_INGAME and player.health > 0 then
      local user = self.userData
      local weaponIndex = player.weaponIndexSelected
      if weaponOffsets_offsetSetFor ~= weaponIndex then
         consolePerformCommand('cl_show_gun ' .. (user['weaponShow' .. weaponIndex] and 1 or 0))
         consolePerformCommand('cl_weapon_offset_x ' .. user['weaponX' .. weaponIndex])
         consolePerformCommand('cl_weapon_offset_y ' .. user['weaponY' .. weaponIndex])
         consolePerformCommand('cl_weapon_offset_z ' .. user['weaponZ' .. weaponIndex])
         consolePerformCommand('cl_weapon_bob ' .. (user['weaponBob' .. weaponIndex] and 1 or 0))
         consolePerformCommand('cl_weapon_kickback ' .. (user['weaponKickback' .. weaponIndex] and 1 or 0))
         consolePerformCommand('cl_weapon_rotation ' .. (user['weaponRotation' .. weaponIndex] and 1 or 0))
         -- local weaponCmd = widgetGetConsoleVariable('weapon' .. weaponIndex .. '_cmd')
         -- local weaponDefaultCmd = widgetGetConsoleVariable('weaponDefault_cmd')
         -- if weaponCmd ~= ' then
         --    consolePerformCommand(weaponCmd)
         -- elseif weaponDefaultCmd ~= ' then
         --    consolePerformCommand(weaponDefaultCmd)
         -- end
         weaponOffsets_offsetSetFor = weaponIndex
      end
   end
end

function kyto_weaponSwitch:draw()
   local localPlayer = getLocalPlayer()

   if weaponSwitch_noSwitchSoundDelay > 0 then
      weaponSwitch_noSwitchSoundDelay = weaponSwitch_noSwitchSoundDelay - deltaTime * 1000
   end

   -- if weaponSwitch_emptyClickSoundDelay > 0 then
   --    weaponSwitch_emptyClickSoundDelay = weaponSwitch_emptyClickSoundDelay - deltaTime * 1000
   -- end

   if localPlayer ~= nil and localPlayer.state == PLAYER_STATE_INGAME and localPlayer.health > 0 and world.gameState ~= GAME_STATE_GAMEOVER then
      local user = self.userData
      local emptyWeaponIndex = widgetGetConsoleVariable('empty')
      local weaponIndex = localPlayer.weaponIndexSelected

      if emptyWeaponIndex ~= 0 then
         local weapon = localPlayer.weapons[emptyWeaponIndex]

         if (not weapon.pickedup or weapon.ammo == 0) and weaponSwitch_noSwitchSoundDelay <= 0 then
            playSound('internal/ui/widgets/kytohud/sfx/noswitch')
            weaponSwitch_noSwitchSoundDelay = 150
         end

         widgetSetConsoleVariable('empty', 0)
      end

      if weaponIndex > 1 then
         local weapon = localPlayer.weapons[weaponIndex]
         -- if user.bypassEmptyPenalty then
         --    if widgetGetConsoleVariable('shoot') ~= 0 then
         --       if weapon.ammo == 0 and weaponSwitch_emptyClickSoundDelay <= 0 then
         --          playSound('internal/weapons/weapon_noammo')
         --          weaponSwitch_emptyClickSoundDelay = 150
         --       end

         --       widgetSetConsoleVariable('shoot', 0)
         --    end

         --    if weapon.ammo == 0 and not weaponSwitch_attackRebound then
         --       consolePerformCommand('unbind game ' .. user.attackBind)
         --       consolePerformCommand('-attack')
         --       consolePerformCommand('bind game ' .. user.attackBind .. ' ui_kyto_weaponSwitch_shoot 1')
         --       weaponSwitch_attackRebound = true
         --    elseif weapon.ammo ~= 0 and weaponSwitch_attackRebound then
         --       consolePerformCommand('bind game ' .. user.attackBind .. ' +attack')
         --       weaponSwitch_attackRebound = false
         --    end
         -- end

         if weapon.ammo == 0 then
            local switchString = user['onEmpty' .. weaponIndex]
            if switchString ~= '00000000' then
               for c in switchString:gmatch('.') do
                  if c == '0' then
                     break
                  end

                  local cWeapon = localPlayer.weapons[tonumber(c)]
                  if cWeapon ~= nil and cWeapon.pickedup and cWeapon.ammo > 0 then
                     consolePerformCommand('weapon ' .. c)
                     break
                  end
               end
            end
         end
      end
   end
end

function kyto_weaponOffsets:show()
   consolePerformCommand('ui_set_widget_zindex kyto_weaponOffsets 10001')
end

function kyto_uiColorPicker(x, y, iconSvg, labelText, value, modifyAlpha, optargs)
   ui2Label(labelText, x, y, optargs)
   local w = 60
   local h = 35
   local iconRadius = (h - 4) / 2

   local intensity = 1
   if optargs ~= nil and optargs.intensity ~= nil then
      intensity = optargs.intensity
   end

   local alphaValue = value.a
   value.a = alphaValue * optargs.intensity

   x = x + WIDGET_PROPERTIES_COL_INDENT
   if iconSvg ~= nil then
      x = x + h / 2
      nvgFillColor(value)
      nvgSvg(iconSvg, x, y + h / 2, iconRadius)
      x = x + h / 2 + 8
   else
      nvgBeginPath()
      nvgRect(x + 1, y + 1, h - 2, h - 2)
      nvgStrokeWidth(2)
      nvgStrokeColor(Color(0, 0, 0, 255 * intensity))
      nvgStroke()
      nvgFillColor(value)
      nvgFill()
      x = x + h + 8
   end

   local color_r = ui2EditBox0Decimals(value.r, x, y, w, optargs)
   x = x + w + 2
   local color_g = ui2EditBox0Decimals(value.g, x, y, w, optargs)
   x = x + w + 2
   local color_b = ui2EditBox0Decimals(value.b, x, y, w, optargs)

   if modifyAlpha then
      x = x + w + 2
      alphaValue = ui2EditBox0Decimals(alphaValue, x, y, w, optargs)
   end

   return Color(color_r, color_g, color_b, alphaValue)
end

function kyto_uiWeaponPicker(x, y, labelText, value, selectedOnly, optargs)
   local intensity = 1
   if optargs ~= nil and optargs.intensity ~= nil then
      intensity = optargs.intensity
   end

   ui2Label(labelText, x, y, optargs)

   local localPlayer = getLocalPlayer()

   local h = 30
   local iconRadius = (h - 4) / 2

   x = x + WIDGET_PROPERTIES_COL_INDENT
   for weaponIndex = 1, 9 do
      local iconColor = kyto_copyColor(KytoHUD.userData['weaponColor' .. weaponIndex])
      local iconSvg = 'internal/ui/icons/weapon' .. weaponIndex

      -- use melee cosmetics
      if weaponIndex == 1 then
         iconColor = Color(255, 255, 255)
         iconSvg = kyto_getPlayerMeleeCosmetic(localPlayer, KytoHUD.userData.useMeleeCosmetics)
      end

      local weaponBit = 2 ^ (weaponIndex - 1)

      local m
      if value < 0 then
         m = {
            hoverAmount = 0,
            leftUp = false,
         }
      else
         m = mouseRegion(x, y, h, h, weaponIndex)
      end

      -- bg
      nvgBeginPath()
      nvgRect(x, y, h, h)
      nvgFillColor(ui2FormatColor(UI2_COLTYPE_BACKGROUND, intensity, m.hoverAmount, false))
      nvgFill()

      if value < 0 or not kyto_bitAnd(value, weaponBit) then
         nvgFillColor(Color(127, 127, 127, 255 * intensity))
      else
         iconColor.a = iconColor.a * intensity
         nvgFillColor(iconColor)
      end
      nvgSvg(iconSvg, x + h / 2, y + h / 2, iconRadius)


      if m.leftUp then
         playSound('internal/ui/sounds/buttonClick')
         if kyto_bitAnd(value, weaponBit) then
            value = value - weaponBit
         else
            value = value + weaponBit
         end
      end

      x = x + h + 2
   end

   if selectedOnly then
      local m = mouseRegion(x, y, h, h, weaponIndex)

      -- bg
      nvgBeginPath()
      nvgRect(x, y, h, h)
      nvgFillColor(ui2FormatColor(UI2_COLTYPE_BACKGROUND, intensity, m.hoverAmount, false))
      nvgFill()

      nvgFontSize(iconRadius * 2)
      nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
      if value < 0 then
         nvgFillColor(Color(255, 255, 255, 255 * intensity))
         nvgText(x + h / 2, y + h / 2, '!')
      else
         nvgFillColor(Color(127, 127, 127, 255 * intensity))
         nvgText(x + h / 2, y + h / 2, '?')
      end

      if m.leftUp then
         playSound('internal/ui/sounds/buttonClick')
         if value < 0 then
            value = 510
         else
            value = -1
         end
      end
   end

   return value
end

function kyto_uiWeaponPickerStr(x, y, iconSvg, iconColor, labelText, value, fromWeaponIndex, optargs)
   local localPlayer = getLocalPlayer()

   local h = 30
   local iconRadius = (h - 4) / 2

   local intensity = 1
   if optargs ~= nil and optargs.intensity ~= nil then
      intensity = optargs.intensity
   end

   local iconColorCopy = kyto_copyColor(iconColor, intensity)

   if iconSvg ~= nil then
      nvgFillColor(iconColorCopy)
      nvgSvg(iconSvg, x + h / 2, y + h / 2, iconRadius)
   else
      nvgBeginPath()
      nvgRect(x + 1, y + 1, h - 2, h - 2)
      nvgStrokeWidth(2)
      nvgStrokeColor(Color(0, 0, 0, 255 * intensity))
      nvgStroke()
      nvgFillColor(iconColorCopy)
      nvgFill()
   end

   ui2Label(labelText, x + h + 8, y - 4, optargs)

   x = x + WIDGET_PROPERTIES_COL_INDENT
   local i = 1
   local newValue = ''
   for c in value:gmatch('.') do
      local weaponIndex = tonumber(c)

      local m = mouseRegion(x, y, h, h, i)

      -- bg
      nvgBeginPath()
      nvgRect(x, y, h, h)
      nvgFillColor(ui2FormatColor(UI2_COLTYPE_BACKGROUND, intensity, m.hoverAmount, false))
      nvgFill()

      if weaponIndex >= 1 and weaponIndex <= 9 then
         local iconColorCopy = kyto_copyColor(KytoHUD.userData['weaponColor' .. weaponIndex])
         local iconSvg = 'internal/ui/icons/weapon' .. weaponIndex

         -- use melee cosmetics
         if weaponIndex == 1 then
            iconColorCopy = Color(255, 255, 255)
            iconSvg = kyto_getPlayerMeleeCosmetic(localPlayer, KytoHUD.userData.useMeleeCosmetics)
         end

         iconColorCopy.a = iconColorCopy.a * intensity
         nvgFillColor(iconColorCopy)
         nvgSvg(iconSvg, x + h / 2, y + h / 2, iconRadius)
      end

      if m.leftUp then
         playSound('internal/ui/sounds/buttonClick')
         weaponIndex = weaponIndex + 1
         if weaponIndex == fromWeaponIndex then
            weaponIndex = weaponIndex + 1
         end
      elseif m.rightUp then
         playSound('internal/ui/sounds/buttonClick')
         weaponIndex = weaponIndex - 1
         if weaponIndex == fromWeaponIndex then
            weaponIndex = weaponIndex - 1
         end
      end

      if weaponIndex < 0 then
         weaponIndex = 9
         if fromWeaponIndex == 9 then
            weaponIndex = 8
         end
      elseif weaponIndex > 9 then
         weaponIndex = 0
      end

      x = x + h + 2
      i = i + 1
      newValue = newValue .. weaponIndex
   end

   return newValue
end

function kyto_uiIconOutlineStylePicker(x, y, outlineStyleSelected, optargs)
   local intensity = 1
   if optargs ~= nil and optargs.intensity ~= nil then
      intensity = optargs.intensity
   end

   local h = 30
   local iconRadius = (h - 4) / 2

   local outlineColBg = {
      base = Color(26, 26, 26, 0),
      hover = Color(39, 39, 39, 255)
   }

   -- title

   ui2Label('Icon outline-style', x, y, optargs)

   x = x + WIDGET_PROPERTIES_COL_INDENT
   for outlineStyle = 0, 2 do
      local iconColor = kyto_copyColor(KytoHUD.userData.weaponColor6)
      local iconSvg = 'internal/ui/icons/weapon6'

      local m = mouseRegion(x, y, h, h, outlineStyle)

      -- bg
      nvgBeginPath()
      nvgRect(x, y, h, h)
      if outlineStyle == outlineStyleSelected then
         nvgFillColor(ui2FormatColor(outlineColBg, intensity, 1, false))
      else
         nvgFillColor(ui2FormatColor(outlineColBg, intensity, m.hoverAmount, false))
      end
      nvgFill()

      iconColor.a = 255 * intensity
      kyto_drawSvgOutline(iconSvg, x + h / 2, y + h / 2, iconRadius, iconColor.a, outlineStyle)

      -- icon
      nvgFillColor(iconColor)
      nvgSvg(iconSvg, x + h / 2, y + h / 2, iconRadius)

      if m.leftUp then
         playSound('internal/ui/sounds/buttonClick')
         outlineStyleSelected = outlineStyle
      end

      x = x + h + 2
   end

   return outlineStyleSelected
end

function kyto_uiTextOutlineStylePicker(x, y, outlineStyleSelected, optargs)
   local intensity = 1
   if optargs ~= nil and optargs.intensity ~= nil then
      intensity = optargs.intensity
   end

   local h = 30
   local iconRadius = (h - 4) / 2

   local outlineColBg = {
      base = Color(26, 26, 26, 0),
      hover = Color(39, 39, 39, 255)
   }

   -- title

   ui2Label('Text outline-style', x, y, optargs)

   x = x + WIDGET_PROPERTIES_COL_INDENT
   for outlineStyle = 0, 2 do
      local m = mouseRegion(x, y, h, h, outlineStyle)

      -- bg
      nvgBeginPath()
      nvgRect(x, y, h, h)
      if outlineStyle == outlineStyleSelected then
         nvgFillColor(ui2FormatColor(outlineColBg, intensity, 1, false))
      else
         nvgFillColor(ui2FormatColor(outlineColBg, intensity, m.hoverAmount, false))
      end
      nvgFill()

      nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)
      nvgFontFace(FONT_HUD)
      nvgFontSize(30)

      kyto_drawTextOutline(x + h / 2 - nvgTextWidth('T') / 2, y + h / 2 - 15, 'T', 255 * intensity, outlineStyle)

      -- text
      nvgFillColor(Color(255, 255, 255, 255 * intensity))
      nvgText(x + h / 2 - nvgTextWidth('T') / 2, y + h / 2 - 15, 'T')

      if m.leftUp then
         playSound('internal/ui/sounds/buttonClick')
         outlineStyleSelected = outlineStyle
      end

      x = x + h + 2
   end

   return outlineStyleSelected
end

function kyto_uiOutlinesPicker(x, y, outlineValues, optargs)
   local intensity = 1
   if optargs ~= nil and optargs.intensity ~= nil then
      intensity = optargs.intensity
   end

   local h = 30
   local iconRadius = (h - 4) / 2

   local outlineColBg = {
      base = Color(26, 26, 26, 0),
      hover = Color(39, 39, 39, 255)
   }

   -- title

   ui2Label('Outlines', x, y, optargs)
   x = x + WIDGET_PROPERTIES_COL_INDENT
   if outlineValues[3] ~= nil then
      local m = mouseRegion(x, y, h, h, 1)

      -- bg
      nvgBeginPath()
      nvgRect(x, y, h, h)
      nvgFillColor(ui2FormatColor(outlineColBg, intensity, m.hoverAmount, false))
      nvgFill()

      nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_TOP)
      nvgFontFace(FONT_HUD)
      nvgFontSize(30)

      if outlineValues[3] then
         kyto_drawTextOutline(x + h / 2 - nvgTextWidth('T') / 2, y + h / 2 - 15, 'T', 255 * intensity)
      end

      -- text
      nvgFillColor(Color(255, 255, 255, 255 * intensity))
      nvgText(x + h / 2 - nvgTextWidth('T') / 2, y + h / 2 - 15, 'T')

      if m.leftUp then
         playSound('internal/ui/sounds/buttonClick')
         outlineValues[3] = not outlineValues[3]
      end

      x = x + h + 2
   end

   if outlineValues[2] ~= nil then
      local m = mouseRegion(x, y, h, h, 2)

      -- bg
      nvgBeginPath()
      nvgRect(x, y, h, h)
      nvgFillColor(ui2FormatColor(outlineColBg, intensity, m.hoverAmount, false))
      nvgFill()

      local iconColor = kyto_copyColor(KytoHUD.userData.weaponColor6, intensity)
      local iconSvg = 'internal/ui/icons/weapon6'
      if outlineValues[2] then
         kyto_drawSvgOutline(iconSvg, x + h / 2, y + h / 2, iconRadius, iconColor.a)
      end

      -- icon
      nvgFillColor(iconColor)
      nvgSvg(iconSvg, x + h / 2, y + h / 2, iconRadius)

      if m.leftUp then
         playSound('internal/ui/sounds/buttonClick')
         outlineValues[2] = not outlineValues[2]
      end

      x = x + h + 2
   end

   if outlineValues[1] ~= nil then
      local iconSvg = 'internal/ui/icons/flags/fi'

      local m = mouseRegion(x, y, h, h, 3)

      -- bg
      nvgBeginPath()
      nvgRect(x, y, h, h)
      nvgFillColor(ui2FormatColor(outlineColBg, intensity, m.hoverAmount, false))
      nvgFill()

      if outlineValues[1] then
         kyto_drawSvgOutline(iconSvg, x + h / 2, y + h / 2, iconRadius, 255 * intensity)
      end

      -- icon
      nvgFillColor(Color(255, 255, 255, 255 * intensity))
      nvgSvg(iconSvg, x + h / 2, y + h / 2, iconRadius)

      if m.leftUp then
         playSound('internal/ui/sounds/buttonClick')
         outlineValues[1] = not outlineValues[1]
      end

      x = x + h + 2
   end

   return outlineValues
end

----------------------------------------------------------------------------------------------------
-- drawOptions(...)
----------------------------------------------------------------------------------------------------

function KytoHUD:drawOptions(x, y, intensity)
   local localPlayer = getLocalPlayer()

   local optargs = {
      intensity = intensity,
   }
   local defaultPositionsnOptargs = {
      intensity = intensity
   }
   local outlinesOptargs = {
      intensity = intensity
   }

   local user = self.userData

   ui2Label('KytoHUD', x, y, optargs)
   y = y + 40
   kyto_confirmDefaults = ui2CheckBox(kyto_confirmDefaults, x, y, optargs)
   defaultPositionsnOptargs.enabled = kyto_confirmDefaults
   local defaultPositions = ui2Button('Click to set default positions', x + 35 + 4, y, 280, 35, defaultPositionsnOptargs)
   if defaultPositions then
      kyto_setDefaultPositions()
      kyto_confirmDefaults = false
   end
   y = y + 40
   kyto_confirmOutlines = ui2CheckBox(kyto_confirmOutlines, x, y, optargs)
   outlinesOptargs.enabled = kyto_confirmOutlines
   local enableOutlines = ui2Button('Enable all outlines', x + 35 + 4, y, 200, 35, outlinesOptargs)
   local disableOutlines = ui2Button('Disable all outlines', x + 35 + 4 + 200 + 4, y, 200, 35, outlinesOptargs)
   if enableOutlines then
      kyto_setAllWidgetOutlines(true)
      kyto_confirmOutlines = false
   end
   if disableOutlines then
      kyto_setAllWidgetOutlines(false)
      kyto_confirmOutlines = false
   end
   y = y + 40
   user.enforceViewportHeight = ui2CheckBox(user.enforceViewportHeight, x, y, optargs)
   ui2Label('Enforce viewport.height*', x + 35 + 4, y, optargs)
   y = y + 30
   ui2Label('* Sets ui_viewport_height equal to the height of your resolution.', x, y, optargs)
   y = y + 30
   ui2FontNormal()
   ui2Label('This makes KytoHUD outlines look better but it will scale', x + nvgTextWidth('* '), y, optargs)
   y = y + 30
   ui2Label('other widgets aswell.', x + nvgTextWidth('* '), y, optargs)
   y = y + 30
   ui2Label('Default value for ui_viewport_height is 1080.', x + nvgTextWidth('* '), y, optargs)
   y = y + 60

   user.useMeleeCosmetics = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Use melee cosmetics', user.useMeleeCosmetics, optargs)
   y = y + 40

   user.iconOutlineStyle = kyto_uiIconOutlineStylePicker(x, y, user.iconOutlineStyle, optargs)
   y = y + 40

   user.textOutlineStyle = kyto_uiTextOutlineStylePicker(x, y, user.textOutlineStyle, optargs)
   y = y + 40

   -- user.autoClearLightmap = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Automatically clear lightmap', user.autoClearLightmap, optargs)
   -- y = y + 40

   uiLabel('Weapon-colors', x, y, optargs)
   y = y + 40

   -- weapons
   user.weaponColor1 = kyto_uiColorPicker(x, y, kyto_getPlayerMeleeCosmetic(localPlayer, KytoHUD.userData.useMeleeCosmetics), 'Melee', user.weaponColor1, false, optargs)
   y = y + 40
   user.weaponColor2 = kyto_uiColorPicker(x, y, 'internal/ui/icons/weapon2', 'Burst Gun', user.weaponColor2, false, optargs)
   y = y + 40
   user.weaponColor3 = kyto_uiColorPicker(x, y, 'internal/ui/icons/weapon3', 'Shotgun', user.weaponColor3, false, optargs)
   y = y + 40
   user.weaponColor4 = kyto_uiColorPicker(x, y, 'internal/ui/icons/weapon4', 'Grenade Launcher', user.weaponColor4, false, optargs)
   y = y + 40
   user.weaponColor5 = kyto_uiColorPicker(x, y, 'internal/ui/icons/weapon5', 'Plasma Rifle', user.weaponColor5, false, optargs)
   y = y + 40
   user.weaponColor6 = kyto_uiColorPicker(x, y, 'internal/ui/icons/weapon6', 'Rocket Launcher', user.weaponColor6, false, optargs)
   y = y + 40
   user.weaponColor7 = kyto_uiColorPicker(x, y, 'internal/ui/icons/weapon7', 'Ion Cannon', user.weaponColor7, false, optargs)
   y = y + 40
   user.weaponColor8 = kyto_uiColorPicker(x, y, 'internal/ui/icons/weapon8', 'Bolt Rifle', user.weaponColor8, false, optargs)
   y = y + 40
   user.weaponColor9 = kyto_uiColorPicker(x, y, 'internal/ui/icons/weapon9', 'Stake Launcher', user.weaponColor9, false, optargs)
   y = y + 60

   -- healths
   uiLabel('Health-colors', x, y, optargs)
   y = y + 40
   user.megaColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/health', 'Mega Health', user.megaColor, false, optargs)
   y = y + 40

   -- armors
   uiLabel('Armor-colors', x, y, optargs)
   y = y + 40
   user.armorGreenColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/armor', 'Green Armor', user.armorGreenColor, false, optargs)
   y = y + 40
   user.armorYellowColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/armor', 'Yellow Armor', user.armorYellowColor, false, optargs)
   y = y + 40
   user.armorRedColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/armor', 'Red Armor', user.armorRedColor, false, optargs)
   y = y + 60

   -- powerups
   uiLabel('Powerup-colors', x, y, optargs)
   y = y + 40
   user.carnageColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/carnage', 'Carnage', user.carnageColor, false, optargs)
   y = y + 40
   user.resistColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/resist', 'Resist', user.resistColor, false, optargs)

   kyto_updateGlobalColors()

   saveUserData(user)
end

function KytoHUD:getOptionsHeight()
   return 1500
end

function kyto_armor:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, nil, user.outlineText}, optargs)
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.useArmorColors = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Color by armor', user.useArmorColors, optargs)
   y = y + 40

   saveUserData(user)
end

function kyto_crosshair:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   -- ui2Label('Preview', x, y, optargs)
   -- drawCrosshair(user, x + WIDGET_PROPERTIES_COL_INDENT + user.crosshairWidth / 2, y + user.crosshairHeight / 2, intensity)
   -- y = y + 60 + user.crosshairHeight / 2

   uiLabel('Crosshair', x, y, optargs)
   y = y + 40
   user.crosshairWidth = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Width', user.crosshairWidth, 0, 64, optargs)
   y = y + 40
   user.crosshairHeight = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Height', user.crosshairHeight, 0, 64, optargs)
   y = y + 40
   user.crosshairThickness = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Thickness', user.crosshairThickness, 1, math.max(user.crosshairWidth, user.crosshairHeight), optargs)
   y = y + 40
   user.crosshairStroke = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Stroke', user.crosshairStroke, 0, 16, optargs)
   y = y + 60

   uiLabel('Gap', x, y, optargs)
   y = y + 40
   user.crosshairGapWidth = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Width', user.crosshairGapWidth, 0, 64, optargs)
   y = y + 40
   user.crosshairGapHeight = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Height', user.crosshairGapHeight, 0, 64, optargs)
   y = y + 60

   uiLabel('Dot', x, y, optargs)
   y = y + 40
   user.crosshairDotWidth = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Width', user.crosshairDotWidth, 0, 64, optargs)
   y = y + 40
   user.crosshairDotHeight = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Height', user.crosshairDotHeight, 0, 64, optargs)
   y = y + 40
   user.crosshairDotStroke = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Stroke', user.crosshairDotStroke, 0, 16, optargs)
   y = y + 40

   uiLabel('Colors', x, y, optargs)
   y = y + 40
   user.crosshairColor = kyto_uiColorPicker(x, y, nil, 'Crosshair', user.crosshairColor, true, optargs)
   y = y + 40
   user.crosshairStrokeColor = kyto_uiColorPicker(x, y, nil, 'Crosshair-stroke', user.crosshairStrokeColor, true, optargs)
   y = y + 40
   user.crosshairDotColor = kyto_uiColorPicker(x, y, nil, 'Dot', user.crosshairDotColor, true, optargs)
   y = y + 40
   user.crosshairDotStrokeColor = kyto_uiColorPicker(x, y, nil, 'Dot stroke', user.crosshairDotStrokeColor, true, optargs)
   y = y + 40

   saveUserData(user)
end

function kyto_crosshair:getOptionsHeight()
   return 1000
end

function kyto_deathMessages:drawOptions(x, y, intensity)
   local localPlayer = getLocalPlayer()

   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {user.outlineFlag, user.outlineIcon, user.outlineText}, optargs)
   user.outlineFlag = outlineValuesNew[1]
   user.outlineIcon = outlineValuesNew[2]
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.drawFlag = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show country-flags', user.drawFlag, optargs)
   y = y + 40
   user.printToConsole = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Print messages to console', user.printToConsole, optargs)
   y = y + 40
   user.reverse = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Reverse-order', user.reverse, optargs)
   y = y + 40
   user.maxMessages = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Max messages', user.maxMessages, 0, 10, optargs)
   y = y + 40
   user.time = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Time (ms)', user.time, 0, 10000, optargs)
   y = y + 60

   uiLabel('Name-colors', x, y, optargs)
   y = y + 40
   user.selfColor = kyto_uiColorPicker(x, y, nil, 'Self', user.selfColor, false, optargs)
   y = y + 40
   user.enemyColor = kyto_uiColorPicker(x, y, nil, 'Enemy', user.enemyColor, false, optargs)
   y = y + 60

   uiLabel('Name-colors (team-modes)', x, y, optargs)
   y = y + 40
   user.selfTeamColor = kyto_uiColorPicker(x, y, nil, 'Self', user.selfTeamColor, false, optargs)
   y = y + 40
   user.friendTeamColor = kyto_uiColorPicker(x, y, nil, 'Friend', user.friendTeamColor, false, optargs)
   y = y + 40
   user.enemyTeamColor = kyto_uiColorPicker(x, y, nil, 'Enemy', user.enemyTeamColor, false, optargs)
   y = y + 60

   uiLabel('Icon-colors', x, y, optargs)
   y = y + 40
   user.telefragColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/teleporter', 'Telefrag', user.telefragColor, false, optargs)
   y = y + 40
   user.lavaColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/lava', 'Lava', user.lavaColor, false, optargs)
   y = y + 40
   user.drownColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/drown', 'Drown', user.drownColor, false, optargs)
   y = y + 40
   user.outOfWorldColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/falling', 'Out of world', user.outOfWorldColor, false, optargs)
   y = y + 40
   user.overtimeColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/skull', 'Overtime', user.overtimeColor, false, optargs)
   y = y + 40
   user.suicideColor = kyto_uiColorPicker(x, y, 'internal/ui/icons/skull', 'Suicide', user.suicideColor, false, optargs)

   kyto_updateGlobalColors()

   saveUserData(user)
end

function kyto_deathMessages:getOptionsHeight()
   return 1000
end

function kyto_fakeIonBeam:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   user.beamWidth = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Width', user.beamWidth, 1, 100, optargs)
   y = y + 40
   user.beamColor = kyto_uiColorPicker(x, y, nil, 'Beam-color', user.beamColor, true, optargs)

   saveUserData(user)
end

function kyto_followingPlayer:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {user.outlineFlag, nil, user.outlineText}, optargs)
   user.outlineFlag = outlineValuesNew[1]
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.drawFlag = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show country-flags', user.drawFlag, optargs)
   y = y + 40

   user.flagPositionLeft = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Flag left of name', user.flagPositionLeft, optargs)
   y = y + 40

   user.drawPlaying = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Draw when playing', user.drawPlaying, optargs)
   y = y + 40

   ui2Label('Following text', x, y, optargs)
   user.followingText = ui2EditBox(user.followingText, x + WIDGET_PROPERTIES_COL_INDENT, y, 200, optargs)

   saveUserData(user)
end

function kyto_fragMessage:drawOptions(x, y, intensity)
   local localPlayer = getLocalPlayer()

   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {user.outlineFlag, nil, user.outlineText}, optargs)
   user.outlineFlag = outlineValuesNew[1]
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.drawFlag = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show country-flags', user.drawFlag, optargs)
   y = y + 40
   user.time = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Time (ms)', user.time, 0, 10000, optargs)

   saveUserData(user)
end

function kyto_gameMessages:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, nil, user.outlineText}, optargs)
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   saveUserData(user)
end

function kyto_gameModeAndMap:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, nil, user.outlineText}, optargs)
   user.outlineText = outlineValuesNew[3]

   saveUserData(user)
end

function kyto_gameTimer:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, nil, user.outlineText}, optargs)
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.countUp = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Count up', user.countUp, optargs)
   y = y + 40
   user.countUpWarmup = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Warmup count up', user.countUpWarmup, optargs)
   y = y + 40
   local hideSecondsAll = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Hide seconds', user.hideSeconds > 1, optargs)
   y = y + 40
   local hideSecondsInDuel = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Hide seconds (1v1)', user.hideSeconds >= 1, optargs)
   y = y + 40

   user.hideSeconds = 0
   if hideSecondsAll then
      user.hideSeconds = 2
   elseif hideSecondsInDuel then
      user.hideSeconds = 1
   end

   saveUserData(user)
end

function kyto_health:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, nil, user.outlineText}, optargs)
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.showNegative = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show negative values', user.showNegative, optargs)
   y = y + 40
   user.megaIndicator = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Mega Health-indicator', user.megaIndicator, optargs)
   y = y + 40
   uiLabel('Colors', x, y, optargs)
   y = y + 40
   user.healthColor = kyto_uiColorPicker(x, y, nil, 'Default', user.healthColor, false, optargs)
   y = y + 40
   user.healthColorRocketable = kyto_uiColorPicker(x, y, nil, 'Rocketable', user.healthColorRocketable, false, optargs)
   y = y + 40
   user.healthColorBoltable = kyto_uiColorPicker(x, y, nil, 'Boltable', user.healthColorBoltable, false, optargs)
   y = y + 40
   user.megaColor = kyto_uiColorPicker(x, y, nil, 'Mega Held', user.megaColor, false, optargs)
   y = y + 40

   saveUserData(user)
end

function kyto_ionBurstAcc:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local optargs_warning = {
      intensity = intensity,
      coltype = {
         base = Color(255, 0, 0, 255),
      },
   }
   ui2Label('IMPORTANT!', x, y, optargs_warning)
   ui2Label('Widget is only visible when spectating', x + 125, y, optargs)
   y = y + 40

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, nil, user.outlineText}, optargs)
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.fadeout = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Text fadeout-effect', user.fadeout, optargs)
   y = y + 40
   user.time = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, 'Fadeout time (ms)', user.time, 0, 5000, optargs)

   saveUserData(user)
end

function kyto_pickupTimers:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, user.outlineIcon, user.outlineText}, optargs)
   user.outlineIcon = outlineValuesNew[2]
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.clearItems = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Hide respawned items', user.clearItems, optargs)

   saveUserData(user)
end

function kyto_powerups:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, user.outlineIcon, user.outlineText}, optargs)
   user.outlineIcon = outlineValuesNew[2]
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.megaIndicator = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Mega Health-indicator', user.megaIndicator, optargs)
   y = y + 40

   user.flagIndicator = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Flag-indicator', user.flagIndicator, optargs)

   saveUserData(user)
end

function kyto_readyUpStatus:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, nil, user.outlineText}, optargs)
   user.outlineText = outlineValuesNew[3]

   saveUserData(user)
end

function kyto_scores:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, nil, user.outlineText}, optargs)
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.showScores = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show self/enemy scores', user.showScores, optargs)
   y = y + 40
   user.showDiff = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show score difference', user.showDiff, optargs)
   y = y + 40

   uiLabel('Colors', x, y, optargs)
   y = y + 40
   user.scoreSelfColor = kyto_uiColorPicker(x, y, nil, 'Self', user.scoreSelfColor, true, optargs)
   y = y + 40
   user.scoreEnemyColor = kyto_uiColorPicker(x, y, nil, 'Enemy', user.scoreEnemyColor, true, optargs)
   y = y + 40
   user.scoreDiffColor = kyto_uiColorPicker(x, y, nil, 'Difference', user.scoreDiffColor, true, optargs)
   y = y + 40

   saveUserData(user)
end

function kyto_teamInfo:drawOptions(x, y, intensity)
   local localPlayer = getLocalPlayer()

   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, user.outlineIcon, user.outlineText}, optargs)
   user.outlineIcon = outlineValuesNew[2]
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.showSelf = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show self on list', user.showSelf, optargs)
   y = y + 40
   user.drawWeapons = kyto_uiWeaponPicker(x, y, 'Weapons', user.drawWeapons, true, optargs)
   kyto_updateWeaponsTable('kyto_teamInfo_weapons', user.drawWeapons)
   y = y + 60

   uiLabel('Location-settings', x, y, optargs)
   y = y + 40
   user.useKimiLocations = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Use KimiLocations', user.useKimiLocations, optargs)
   y = y + 40
   user.locationConstantWidth = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Column constant width', user.locationConstantWidth, optargs)
   y = y + 60

   uiLabel('Ammo-settings', x, y, optargs)
   y = y + 40
   local drawIcon = kyto_bitAnd(user.drawAmmo, 1)
   drawIcon = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show icon', drawIcon, optargs)
   y = y + 40
   local drawCount = kyto_bitAnd(user.drawAmmo, 2)
   drawCount = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show count', drawCount, optargs)
   y = y + 40
   user.drawAmmo = 0
   if drawIcon then
      user.drawAmmo = user.drawAmmo + 1
   end
   if drawCount then
      user.drawAmmo = user.drawAmmo + 2
   end

   user.ammoIconFill = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Icon fill-effect', user.ammoIconFill, optargs)
   y = y + 40
   user.ammoCountColor = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Count in weapon color', user.ammoCountColor, optargs)
   y = y + 60

   uiLabel('Powerup-settings', x, y, optargs)
   y = y + 40
   user.alwaysShowPowerups = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Always show columns', user.alwaysShowPowerups, optargs)
   y = y + 40
   user.highlightNamesOnPowerup = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Highlight names', user.highlightNamesOnPowerup, optargs)
   y = y + 40
   local drawIcon = kyto_bitAnd(user.drawPowerup, 1)
   drawIcon = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show icon', drawIcon, optargs)
   y = y + 40
   local drawCount = kyto_bitAnd(user.drawPowerup, 2)
   drawCount = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show time', drawCount, optargs)
   y = y + 40
   user.drawPowerup = 0
   if drawIcon then
      user.drawPowerup = user.drawPowerup + 1
   end
   if drawCount then
      user.drawPowerup = user.drawPowerup + 2
   end

   user.powerupIconFill = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Icon fill-effect', user.powerupIconFill, optargs)
   y = y + 40
   user.powerupTimeColor = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Time in powerup color', user.powerupTimeColor, optargs)
   y = y + 60

   uiLabel('Colors', x, y, optargs)
   y = y + 40
   user.backgroundColor = kyto_uiColorPicker(x, y, nil, 'Background', user.backgroundColor, true, optargs)
   y = y + 40
   user.delimiterColor = kyto_uiColorPicker(x, y, nil, 'Delimiter', user.delimiterColor, true, optargs)
   y = y + 40
   user.textBaseColor = kyto_uiColorPicker(x, y, nil, 'Text base', user.textBaseColor, false, optargs)
   y = y + 40
   user.textInactiveColor = kyto_uiColorPicker(x, y, nil, 'Text inactive', user.textInactiveColor, false, optargs)
   y = y + 40
   user.textDeadColor = kyto_uiColorPicker(x, y, nil, 'Text dead player', user.textDeadColor, false, optargs)
   y = y + 40
   user.iconBaseColor = kyto_uiColorPicker(x, y, nil, 'Icon base', user.iconBaseColor, false, optargs)
   y = y + 40
   user.iconInactiveColor = kyto_uiColorPicker(x, y, nil, 'Icon inactive', user.iconInactiveColor, false, optargs)
   y = y + 60

   uiLabel('Health-colors', x, y, optargs)
   y = y + 40
   user.healthColor = kyto_uiColorPicker(x, y, nil, 'Default', user.healthColor, false, optargs)
   y = y + 40
   user.healthColorRocketable = kyto_uiColorPicker(x, y, nil, 'Rocketable', user.healthColorRocketable, false, optargs)
   y = y + 40
   user.healthColorBoltable = kyto_uiColorPicker(x, y, nil, 'Boltable', user.healthColorBoltable, false, optargs)

   saveUserData(user)
end

function kyto_teamInfo:getOptionsHeight()
   return 1500
end

function kyto_verticalBar:drawOptions(x, y, intensity)
   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, user.outlineRect, nil}, optargs)
   user.outlineRect = outlineValuesNew[2]
   y = y + 40

   user.useArmorColors = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Color by armor', user.useArmorColors, optargs)
   y = y + 40
   user.megaIndicator = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Mega Health-indicator', user.megaIndicator, optargs)
   y = y + 40
   uiLabel('Colors', x, y, optargs)
   y = y + 40
   user.healthColor = kyto_uiColorPicker(x, y, nil, 'Default', user.healthColor, false, optargs)
   y = y + 40
   user.healthColorRocketable = kyto_uiColorPicker(x, y, nil, 'Rocketable', user.healthColorRocketable, false, optargs)
   y = y + 40
   user.healthColorBoltable = kyto_uiColorPicker(x, y, nil, 'Boltable', user.healthColorBoltable, false, optargs)
   y = y + 40
   user.megaColor = kyto_uiColorPicker(x, y, nil, 'Mega Held', user.megaColor, false, optargs)
   y = y + 40

   saveUserData(user)
end

function kyto_weaponAccuracies:drawOptions(x, y, intensity)
   local localPlayer = getLocalPlayer()

   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, user.outlineIcon, user.outlineText}, optargs)
   user.outlineIcon = outlineValuesNew[2]
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.drawWeapons = kyto_uiWeaponPicker(x, y, 'Weapons', user.drawWeapons, true, optargs)
   kyto_updateWeaponsTable('kyto_weaponAccuracies_weapons', user.drawWeapons)

   saveUserData(user)
end

function kyto_weaponList:drawOptions(x, y, intensity)
   local localPlayer = getLocalPlayer()

   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local outlineValuesNew = kyto_uiOutlinesPicker(x, y, {nil, user.outlineIcon, user.outlineText}, optargs)
   user.outlineIcon = outlineValuesNew[2]
   user.outlineText = outlineValuesNew[3]
   y = y + 40

   user.drawWeapons = kyto_uiWeaponPicker(x, y, 'Weapons', user.drawWeapons, true, optargs)
   kyto_updateWeaponsTable('kyto_weaponList_weapons', user.drawWeapons)
   y = y + 40
   user.showUnpickedAmmo = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT + 110, 'Show unpicked weapons with ammo', user.showUnpickedAmmo, optargs)
   y = y + 40
   user.showUnpickedNoAmmo = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT + 110, 'Show unpicked weapons without ammo', user.showUnpickedNoAmmo, optargs)
   y = y + 40

   saveUserData(user)
end

function kyto_weaponOffsets:drawOptions(x, y, intensity)
   local localPlayer = getLocalPlayer()

   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local w = 60
   local iconRadius = 12

   nvgFillColor(Color(255, 255, 255))
   nvgSvg(kyto_getPlayerMeleeCosmetic(localPlayer, KytoHUD.userData.useMeleeCosmetics), x + iconRadius, y + iconRadius, iconRadius)
   ui2Label('Melee', x + iconRadius * 2 + 6, y - 4, optargs)
   y = y + 40
   user.weaponShow1 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show', user.weaponShow1, optargs)
   y = y + 40
   ui2Label('Offset', x, y, optargs)
   user.weaponX1 = ui2EditBox(user.weaponX1, x + WIDGET_PROPERTIES_COL_INDENT, y, w, optargs)
   user.weaponY1 = ui2EditBox(user.weaponY1, x + WIDGET_PROPERTIES_COL_INDENT + w + 2, y, w, optargs)
   user.weaponZ1 = ui2EditBox(user.weaponZ1, x + WIDGET_PROPERTIES_COL_INDENT + w * 2 + 4, y, w, optargs)
   y = y + 40
   user.weaponBob1 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Bob', user.weaponBob1, optargs)
   y = y + 40
   user.weaponKickback1 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Kickback', user.weaponKickback1, optargs)
   y = y + 40
   user.weaponRotation1 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Rotation', user.weaponRotation1, optargs)
   y = y + 60

   nvgFillColor(KytoHUD.userData.weaponColor2)
   nvgSvg('internal/ui/icons/weapon2', x + iconRadius, y + iconRadius, iconRadius)
   ui2Label('Burst Gun', x + iconRadius * 2 + 6, y - 4, optargs)
   y = y + 40
   user.weaponShow2 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show', user.weaponShow2, optargs)
   y = y + 40
   ui2Label('Offset', x, y, optargs)
   user.weaponX2 = ui2EditBox(user.weaponX2, x + WIDGET_PROPERTIES_COL_INDENT, y, w, optargs)
   user.weaponY2 = ui2EditBox(user.weaponY2, x + WIDGET_PROPERTIES_COL_INDENT + w + 2, y, w, optargs)
   user.weaponZ2 = ui2EditBox(user.weaponZ2, x + WIDGET_PROPERTIES_COL_INDENT + w * 2 + 4, y, w, optargs)
   y = y + 40
   user.weaponBob2 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Bob', user.weaponBob2, optargs)
   y = y + 40
   user.weaponKickback2 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Kickback', user.weaponKickback2, optargs)
   y = y + 40
   user.weaponRotation2 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Rotation', user.weaponRotation2, optargs)
   y = y + 60

   nvgFillColor(KytoHUD.userData.weaponColor3)
   nvgSvg('internal/ui/icons/weapon3', x + iconRadius, y + iconRadius, iconRadius)
   ui2Label('Shotgun', x + iconRadius * 2 + 6, y - 4, optargs)
   y = y + 40
   user.weaponShow3 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show', user.weaponShow3, optargs)
   y = y + 40
   ui2Label('Offset', x, y, optargs)
   user.weaponX3 = ui2EditBox(user.weaponX3, x + WIDGET_PROPERTIES_COL_INDENT, y, w, optargs)
   user.weaponY3 = ui2EditBox(user.weaponY3, x + WIDGET_PROPERTIES_COL_INDENT + w + 2, y, w, optargs)
   user.weaponZ3 = ui2EditBox(user.weaponZ3, x + WIDGET_PROPERTIES_COL_INDENT + w * 2 + 4, y, w, optargs)
   y = y + 40
   user.weaponBob3 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Bob', user.weaponBob3, optargs)
   y = y + 40
   user.weaponKickback3 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Kickback', user.weaponKickback3, optargs)
   y = y + 40
   user.weaponRotation3 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Rotation', user.weaponRotation3, optargs)
   y = y + 60

   nvgFillColor(KytoHUD.userData.weaponColor4)
   nvgSvg('internal/ui/icons/weapon4', x + iconRadius, y + iconRadius, iconRadius)
   ui2Label('Grenade Launcher', x + iconRadius * 2 + 6, y - 4, optargs)
   y = y + 40
   user.weaponShow4 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show', user.weaponShow4, optargs)
   y = y + 40
   ui2Label('Offset', x, y, optargs)
   user.weaponX4 = ui2EditBox(user.weaponX4, x + WIDGET_PROPERTIES_COL_INDENT, y, w, optargs)
   user.weaponY4 = ui2EditBox(user.weaponY4, x + WIDGET_PROPERTIES_COL_INDENT + w + 2, y, w, optargs)
   user.weaponZ4 = ui2EditBox(user.weaponZ4, x + WIDGET_PROPERTIES_COL_INDENT + w * 2 + 4, y, w, optargs)
   y = y + 40
   user.weaponBob4 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Bob', user.weaponBob4, optargs)
   y = y + 40
   user.weaponKickback4 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Kickback', user.weaponKickback4, optargs)
   y = y + 40
   user.weaponRotation4 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Rotation', user.weaponRotation4, optargs)
   y = y + 60

   nvgFillColor(KytoHUD.userData.weaponColor5)
   nvgSvg('internal/ui/icons/weapon5', x + iconRadius, y + iconRadius, iconRadius)
   ui2Label('Plasma Rifle', x + iconRadius * 2 + 6, y - 4, optargs)
   y = y + 40
   user.weaponShow5 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show', user.weaponShow5, optargs)
   y = y + 40
   ui2Label('Offset', x, y, optargs)
   user.weaponX5 = ui2EditBox(user.weaponX5, x + WIDGET_PROPERTIES_COL_INDENT, y, w, optargs)
   user.weaponY5 = ui2EditBox(user.weaponY5, x + WIDGET_PROPERTIES_COL_INDENT + w + 2, y, w, optargs)
   user.weaponZ5 = ui2EditBox(user.weaponZ5, x + WIDGET_PROPERTIES_COL_INDENT + w * 2 + 4, y, w, optargs)
   y = y + 40
   user.weaponBob5 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Bob', user.weaponBob5, optargs)
   y = y + 40
   user.weaponKickback5 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Kickback', user.weaponKickback5, optargs)
   y = y + 40
   user.weaponRotation5 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Rotation', user.weaponRotation5, optargs)
   y = y + 60

   nvgFillColor(KytoHUD.userData.weaponColor6)
   nvgSvg('internal/ui/icons/weapon6', x + iconRadius, y + iconRadius, iconRadius)
   ui2Label('Rocket Launcher', x + iconRadius * 2 + 6, y - 4, optargs)
   y = y + 40
   user.weaponShow6 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show', user.weaponShow6, optargs)
   y = y + 40
   ui2Label('Offset', x, y, optargs)
   user.weaponX6 = ui2EditBox(user.weaponX6, x + WIDGET_PROPERTIES_COL_INDENT, y, w, optargs)
   user.weaponY6 = ui2EditBox(user.weaponY6, x + WIDGET_PROPERTIES_COL_INDENT + w + 2, y, w, optargs)
   user.weaponZ6 = ui2EditBox(user.weaponZ6, x + WIDGET_PROPERTIES_COL_INDENT + w * 2 + 4, y, w, optargs)
   y = y + 40
   user.weaponBob6 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Bob', user.weaponBob6, optargs)
   y = y + 40
   user.weaponKickback6 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Kickback', user.weaponKickback6, optargs)
   y = y + 40
   user.weaponRotation6 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Rotation', user.weaponRotation6, optargs)
   y = y + 60

   nvgFillColor(KytoHUD.userData.weaponColor7)
   nvgSvg('internal/ui/icons/weapon7', x + iconRadius, y + iconRadius, iconRadius)
   ui2Label('Ion Cannon', x + iconRadius * 2 + 6, y - 4, optargs)
   y = y + 40
   user.weaponShow7 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show', user.weaponShow7, optargs)
   y = y + 40
   ui2Label('Offset', x, y, optargs)
   user.weaponX7 = ui2EditBox(user.weaponX7, x + WIDGET_PROPERTIES_COL_INDENT, y, w, optargs)
   user.weaponY7 = ui2EditBox(user.weaponY7, x + WIDGET_PROPERTIES_COL_INDENT + w + 2, y, w, optargs)
   user.weaponZ7 = ui2EditBox(user.weaponZ7, x + WIDGET_PROPERTIES_COL_INDENT + w * 2 + 4, y, w, optargs)
   local hideBeam = ui2Button('Hide', x + WIDGET_PROPERTIES_COL_INDENT + w * 3 + 14, y + 2, 60, 31)
   if hideBeam then
      user.weaponX7 = '9999999999999999999999999'
      user.weaponY7 = '9999999999999999999999999'
      user.weaponZ7 = '9999999999999999999999999'
   end
   y = y + 40
   user.weaponBob7 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Bob', user.weaponBob7, optargs)
   y = y + 40
   user.weaponKickback7 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Kickback', user.weaponKickback7, optargs)
   y = y + 40
   user.weaponRotation7 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Rotation', user.weaponRotation7, optargs)
   y = y + 60

   nvgFillColor(KytoHUD.userData.weaponColor8)
   nvgSvg('internal/ui/icons/weapon8', x + iconRadius, y + iconRadius, iconRadius)
   ui2Label('Bolt Rifle', x + iconRadius * 2 + 6, y - 4, optargs)
   y = y + 40
   user.weaponShow8 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show', user.weaponShow8, optargs)
   y = y + 40
   ui2Label('Offset', x, y, optargs)
   user.weaponX8 = ui2EditBox(user.weaponX8, x + WIDGET_PROPERTIES_COL_INDENT, y, w, optargs)
   user.weaponY8 = ui2EditBox(user.weaponY8, x + WIDGET_PROPERTIES_COL_INDENT + w + 2, y, w, optargs)
   user.weaponZ8 = ui2EditBox(user.weaponZ8, x + WIDGET_PROPERTIES_COL_INDENT + w * 2 + 4, y, w, optargs)
   local hideBeam = ui2Button('Hide', x + WIDGET_PROPERTIES_COL_INDENT + w * 3 + 14, y + 2, 60, 31)
   if hideBeam then
      user.weaponX8 = '9999999999999999999999999'
      user.weaponY8 = '9999999999999999999999999'
      user.weaponZ8 = '9999999999999999999999999'
   end
   y = y + 40
   user.weaponBob8 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Bob', user.weaponBob8, optargs)
   y = y + 40
   user.weaponKickback8 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Kickback', user.weaponKickback8, optargs)
   y = y + 40
   user.weaponRotation8 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Rotation', user.weaponRotation8, optargs)
   y = y + 60

   nvgFillColor(KytoHUD.userData.weaponColor9)
   nvgSvg('internal/ui/icons/weapon9', x + iconRadius, y + iconRadius, iconRadius)
   ui2Label('Stake Launcher', x + iconRadius * 2 + 6, y - 4, optargs)
   y = y + 40
   user.weaponShow9 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Show', user.weaponShow9, optargs)
   y = y + 40
   ui2Label('Offset', x, y, optargs)
   user.weaponX9 = ui2EditBox(user.weaponX9, x + WIDGET_PROPERTIES_COL_INDENT, y, w, optargs)
   user.weaponY9 = ui2EditBox(user.weaponY9, x + WIDGET_PROPERTIES_COL_INDENT + w + 2, y, w, optargs)
   user.weaponZ9 = ui2EditBox(user.weaponZ9, x + WIDGET_PROPERTIES_COL_INDENT + w * 2 + 4, y, w, optargs)
   y = y + 40
   user.weaponBob9 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Bob', user.weaponBob9, optargs)
   y = y + 40
   user.weaponKickback9 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Kickback', user.weaponKickback9, optargs)
   y = y + 40
   user.weaponRotation9 = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Rotation', user.weaponRotation9, optargs)
   y = y + 60

   saveUserData(user)
end

function kyto_weaponOffsets:getOptionsHeight()
   return 2500
end

function kyto_weaponSwitch:drawOptions(x, y, intensity)
   local localPlayer = getLocalPlayer()

   local optargs = {
      intensity = intensity,
   }

   local user = self.userData

   local iconRadius = 12

   uiLabel('Empty-check', x, y, optargs)
   y = y + 40
   ui2Label('Command "ui_kyto_weaponSwitch_empty X" plays a sound', x, y, optargs)
   y = y + 30
   ui2Label('if weaponX is empty or not picked up.', x, y, optargs)
   y = y + 40
   ui2Label('You can use this on your binds, for example:', x, y, optargs)
   y = y + 30
   uiLabel('bind game R weapon 8 ui_kyto_weaponSwitch_empty 8', x, y, optargs)
   y = y + 30
   ui2Label('If you don\'t have Bolt Rifle or no ammo for it pressing R', x, y, optargs)
   y = y + 30
   ui2Label('will play a sound to indicate inability to switch to it.', x, y, optargs)
   y = y + 40
   uiLabel('Switch-on-empty', x, y, optargs)
   y = y + 40
   user.onEmpty2 = kyto_uiWeaponPickerStr(x, y, 'internal/ui/icons/weapon2', KytoHUD.userData.weaponColor2, 'Burst Gun', user.onEmpty2, 2, optargs)
   y = y + 40
   user.onEmpty3 = kyto_uiWeaponPickerStr(x, y, 'internal/ui/icons/weapon3', KytoHUD.userData.weaponColor3, 'Shotgun', user.onEmpty3, 3, optargs)
   y = y + 40
   user.onEmpty4 = kyto_uiWeaponPickerStr(x, y, 'internal/ui/icons/weapon4', KytoHUD.userData.weaponColor4, 'Grenade Launcher', user.onEmpty4, 4, optargs)
   y = y + 40
   user.onEmpty5 = kyto_uiWeaponPickerStr(x, y, 'internal/ui/icons/weapon5', KytoHUD.userData.weaponColor5, 'Plasma Rifle', user.onEmpty5, 5, optargs)
   y = y + 40
   user.onEmpty6 = kyto_uiWeaponPickerStr(x, y, 'internal/ui/icons/weapon6', KytoHUD.userData.weaponColor6, 'Rocket Launcher', user.onEmpty6, 6, optargs)
   y = y + 40
   user.onEmpty7 = kyto_uiWeaponPickerStr(x, y, 'internal/ui/icons/weapon7', KytoHUD.userData.weaponColor7, 'Ion Cannon', user.onEmpty7, 7, optargs)
   y = y + 40
   user.onEmpty8 = kyto_uiWeaponPickerStr(x, y, 'internal/ui/icons/weapon8', KytoHUD.userData.weaponColor8, 'Bolt Rifle', user.onEmpty8, 8, optargs)
   y = y + 40
   user.onEmpty9 = kyto_uiWeaponPickerStr(x, y, 'internal/ui/icons/weapon9', KytoHUD.userData.weaponColor9, 'Stake Launcher', user.onEmpty9, 9, optargs)
   y = y + 40

   -- uiLabel('Bypass empty shot penalty time', x, y, optargs)
   -- y = y + 40
   -- user.bypassEmptyPenalty = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, 'Enabled', user.bypassEmptyPenalty, optargs)
   -- y = y + 40
   -- ui2Label('+attack key bind', x, y, optargs)
   -- user.attackBind = ui2EditBox(user.attackBind, x + WIDGET_PROPERTIES_COL_INDENT, y, 200, optargs)

   saveUserData(user)
end

-- function kyto_weaponSwitch:getOptionsHeight()
--    return 1000
-- end