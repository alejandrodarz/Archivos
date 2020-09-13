#include maps/mp/gametypes/_globallogic_spawn;
#include maps/mp/gametypes/_spectating;
#include maps/mp/_tacticalinsertion;
#include maps/mp/_challenges;
#include maps/mp/gametypes/_globallogic;
#include maps/mp/gametypes/_hud_util;
#include maps/mp/_utility;
#include maps/mp/gametypes/_rank;
#include maps/mp/killstreaks/_killstreaks;
#include maps/mp/gametypes/_spawnlogic;
#include maps/mp/gametypes/_globallogic_audio;
#include maps/mp/gametypes/_globallogic_score;
#include maps/mp/gametypes/_globallogic;
#include maps/mp/gametypes/_globallogic_utils;
#include common_scripts/utility;
#include maps/mp/gametypes/_globallogic_ui;
#include maps/mp/gametypes/_hud;
#include maps/mp/gametypes/_globallogic_player;
#include maps/mp/gametypes/_spawning;
#include maps/mp/gametypes/_spawnlogic;
#include maps\mp\gametypes\_hud_message;

init(){
	level.infinalkillcam = 0;
    precachestring( &"PLATFORM_PRESS_TO_SKIP" );
    precachestring( &"PLATFORM_PRESS_TO_RESPAWN" );
    precacheshader( "white" );
	precacheshader( "gradient");
    level.killcam = getgametypesetting( "allowKillcam" );
    level.finalkillcam = getgametypesetting( "allowFinalKillcam" );
    level thread ontimelimit();
    mapvote();
    initfinalkillcam(); 
	
	m = getDvar("mapname");
	g = getDvar("g_gametype");
	
	if(getDvar("g_log") == "logs/games_mp.log")
	    thread maps/mp/_development_dvars::GameTypeSetting( "sniptdm" );
}

initfinalkillcam()
{
    level.finalkillcamsettings = [];
    initfinalkillcamteam( "none" );
    _a23 = level.teams;
    _k23 = getFirstArrayKey( _a23 );
    while ( isDefined( _k23 ) )
    {
        team = _a23[ _k23 ];
        initfinalkillcamteam( team );
        _k23 = getNextArrayKey( _a23, _k23 );
    }
    level.finalkillcam_winner = undefined;
}

initfinalkillcamteam( team )
{
    level.finalkillcamsettings[ team ] = spawnstruct();
    clearfinalkillcamteam( team );
}

clearfinalkillcamteam( team )
{
    level.finalkillcamsettings[ team ].spectatorclient = undefined;
    level.finalkillcamsettings[ team ].weapon = undefined;
    level.finalkillcamsettings[ team ].deathtime = undefined;
    level.finalkillcamsettings[ team ].deathtimeoffset = undefined;
    level.finalkillcamsettings[ team ].offsettime = undefined;
    level.finalkillcamsettings[ team ].entityindex = undefined;
    level.finalkillcamsettings[ team ].targetentityindex = undefined;
    level.finalkillcamsettings[ team ].entitystarttime = undefined;
    level.finalkillcamsettings[ team ].perks = undefined;
    level.finalkillcamsettings[ team ].killstreaks = undefined;
    level.finalkillcamsettings[ team ].attacker = undefined;
}

recordkillcamsettings( spectatorclient, targetentityindex, sweapon, deathtime, deathtimeoffset, offsettime, entityindex, entitystarttime, perks, killstreaks, attacker )
{
    if ( level.teambased && isDefined( attacker.team ) && isDefined( level.teams[ attacker.team ] ) )
    {
        team = attacker.team;
        level.finalkillcamsettings[ team ].spectatorclient = spectatorclient;
        level.finalkillcamsettings[ team ].weapon = sweapon;
        level.finalkillcamsettings[ team ].deathtime = deathtime;
        level.finalkillcamsettings[ team ].deathtimeoffset = deathtimeoffset;
        level.finalkillcamsettings[ team ].offsettime = offsettime;
        level.finalkillcamsettings[ team ].entityindex = entityindex;
        level.finalkillcamsettings[ team ].targetentityindex = targetentityindex;
        level.finalkillcamsettings[ team ].entitystarttime = entitystarttime;
        level.finalkillcamsettings[ team ].perks = perks;
        level.finalkillcamsettings[ team ].killstreaks = killstreaks;
        level.finalkillcamsettings[ team ].attacker = attacker;
    }
    level.finalkillcamsettings[ "none" ].spectatorclient = spectatorclient;
    level.finalkillcamsettings[ "none" ].weapon = sweapon;
    level.finalkillcamsettings[ "none" ].deathtime = deathtime;
    level.finalkillcamsettings[ "none" ].deathtimeoffset = deathtimeoffset;
    level.finalkillcamsettings[ "none" ].offsettime = offsettime;
    level.finalkillcamsettings[ "none" ].entityindex = entityindex;
    level.finalkillcamsettings[ "none" ].targetentityindex = targetentityindex;
    level.finalkillcamsettings[ "none" ].entitystarttime = entitystarttime;
    level.finalkillcamsettings[ "none" ].perks = perks;
    level.finalkillcamsettings[ "none" ].killstreaks = killstreaks;
    level.finalkillcamsettings[ "none" ].attacker = attacker;
}

erasefinalkillcam()
{
    clearfinalkillcamteam( "none" );
    _a89 = level.teams;
    _k89 = getFirstArrayKey( _a89 );
    while ( isDefined( _k89 ) )
    {
        team = _a89[ _k89 ];
        clearfinalkillcamteam( team );
        _k89 = getNextArrayKey( _a89, _k89 );
    }
    level.finalkillcam_winner = undefined;
}

finalkillcamwaiter()
{
    if ( !isDefined( level.finalkillcam_winner ) )
    {
        return 0;
    }
    level waittill( "final_killcam_done" );
    wait 0.02;
    return 1;
}

postroundfinalkillcam()
{
    if ( isDefined( level.sidebet ) && level.sidebet )
    {
        return;
    }
    level notify( "play_final_killcam" );
    maps/mp/gametypes/_globallogic::resetoutcomeforallplayers();
    finalkillcamwaiter();
}

startlastkillcam()
{
}

areanyplayerswatchingthekillcam()
{
    players = level.players;
    index = 0;
    while ( index < players.size )
    {
        player = players[ index ];
        if ( isDefined( player.killcam ) )
        {
            return 1;
        }
        index++;
    }
    return 0;
}

killcam( attackernum, targetnum, killcamentity, killcamentityindex, killcamentitystarttime, sweapon, deathtime, deathtimeoffset, offsettime, respawn, maxtime, perks, killstreaks, attacker )
{
    self endon( "disconnect" );
    self endon( "spawned" );
    level endon( "game_ended" );
    if ( attackernum < 0 )
    {
        return;
    }
    postdeathdelay = ( getTime() - deathtime ) / 1000;
    predelay = postdeathdelay + deathtimeoffset;
    camtime = calckillcamtime( sweapon, killcamentitystarttime, predelay, respawn, maxtime );
    postdelay = calcpostdelay();
    killcamlength = camtime + postdelay;
    if ( isDefined( maxtime ) && killcamlength > maxtime )
    {
        if ( maxtime < 2 )
        {
            return;
        }
        if ( ( maxtime - camtime ) >= 1 )
        {
            postdelay = maxtime - camtime;
        }
        else
        {
            postdelay = 1;
            camtime = maxtime - 1;
        }
        killcamlength = camtime + postdelay;
    }
    killcamoffset = camtime + predelay;
    self notify( "begin_killcam" );
    killcamstarttime = getTime() - ( killcamoffset * 1000 );
    self.sessionstate = "spectator";
    self.spectatorclient = attackernum;
    self.killcamentity = -1;
    if ( killcamentityindex >= 0 )
    {
        self thread setkillcamentity( killcamentityindex, killcamentitystarttime - killcamstarttime - 100 );
    }
    self.killcamtargetentity = targetnum;
    self.archivetime = killcamoffset;
    self.killcamlength = killcamlength;
    self.psoffsettime = offsettime;
    recordkillcamsettings( attackernum, targetnum, sweapon, deathtime, deathtimeoffset, offsettime, killcamentityindex, killcamentitystarttime, perks, killstreaks, attacker );
    _a268 = level.teams;
    _k268 = getFirstArrayKey( _a268 );
    while ( isDefined( _k268 ) )
    {
        team = _a268[ _k268 ];
        self allowspectateteam( team, 1 );
        _k268 = getNextArrayKey( _a268, _k268 );
    }
    self allowspectateteam( "freelook", 1 );
    self allowspectateteam( "none", 1 );
    self thread endedkillcamcleanup();
    wait 0.05;
    if ( self.archivetime <= predelay )
    {
        self.sessionstate = "dead";
        self.spectatorclient = -1;
        self.killcamentity = -1;
        self.archivetime = 0;
        self.psoffsettime = 0;
        self notify( "end_killcam" );
        return;
    }
    self thread checkforabruptkillcamend();
    self.killcam = 1;
    self addkillcamskiptext( respawn );
    if ( !self issplitscreen() && level.perksenabled == 1 )
    {
        self addkillcamtimer( camtime );
        self maps/mp/gametypes/_hud_util::showperks();
    }
    self thread spawnedkillcamcleanup();
    self thread waitskipkillcambutton();
    self thread waitteamchangeendkillcam();
    self thread waitkillcamtime();
    self thread maps/mp/_tacticalinsertion::cancel_button_think();
    self waittill( "end_killcam" );
    self endkillcam( 0 );
    self.sessionstate = "dead";
    self.spectatorclient = -1;
    self.killcamentity = -1;
    self.archivetime = 0;
    self.psoffsettime = 0;
}

setkillcamentity( killcamentityindex, delayms )
{
    self endon( "disconnect" );
    self endon( "end_killcam" );
    self endon( "spawned" );
    if ( delayms > 0 )
    {
        wait ( delayms / 1000 );
    }
    self.killcamentity = killcamentityindex;
}

waitkillcamtime()
{
    self endon( "disconnect" );
    self endon( "end_killcam" );
    wait ( self.killcamlength - 0.05 );
    self notify( "end_killcam" );
}

waitfinalkillcamslowdown( deathtime, starttime )
{
    self endon( "disconnect" );
    self endon( "end_killcam" );
    secondsuntildeath = ( deathtime - starttime ) / 1000;
    deathtime = getTime() + ( secondsuntildeath * 1000 );
    waitbeforedeath = 2;
    maps/mp/_utility::setclientsysstate( "levelNotify", "fkcb" );
    wait max( 0, secondsuntildeath - waitbeforedeath );
    setslowmotion( 1, 0.25, waitbeforedeath );
    wait ( waitbeforedeath + 0.5 );
    setslowmotion( 0.25, 1, 1 );
    wait 0.5;
    maps/mp/_utility::setclientsysstate( "levelNotify", "fkce" );
}

waitskipkillcambutton()
{
    self endon( "disconnect" );
    self endon( "end_killcam" );
    while ( self usebuttonpressed() )
    {
        wait 0.05;
    }
    while ( !self usebuttonpressed() )
    {
        wait 0.05;
    }
    self notify( "end_killcam" );
    self clientnotify( "fkce" );
}

waitteamchangeendkillcam()
{
    self endon( "disconnect" );
    self endon( "end_killcam" );
    self waittill( "changed_class" );
    endkillcam( 0 );
}

waitskipkillcamsafespawnbutton()
{
    self endon( "disconnect" );
    self endon( "end_killcam" );
    while ( self fragbuttonpressed() )
    {
        wait 0.05;
    }
    while ( !self fragbuttonpressed() )
    {
        wait 0.05;
    }
    self.wantsafespawn = 1;
    self notify( "end_killcam" );
}

endkillcam( final )
{
    if ( isDefined( self.kc_skiptext ) )
    {
        self.kc_skiptext.alpha = 0;
    }
    if ( isDefined( self.kc_timer ) )
    {
        self.kc_timer.alpha = 0;
    }
    self.killcam = undefined;
    if ( !self issplitscreen() )
    {
        self hideallperks();
    }
    self thread maps/mp/gametypes/_spectating::setspectatepermissions();
}

checkforabruptkillcamend()
{
    self endon( "disconnect" );
    self endon( "end_killcam" );
    while ( 1 )
    {
        if ( self.archivetime <= 0 )
        {
            break;
        }
        else
        {
            wait 0.05;
        }
    }
    self notify( "end_killcam" );
}

spawnedkillcamcleanup()
{
    self endon( "end_killcam" );
    self endon( "disconnect" );
    self waittill( "spawned" );
    self endkillcam( 0 );
}

spectatorkillcamcleanup( attacker )
{
    self endon( "end_killcam" );
    self endon( "disconnect" );
    attacker endon( "disconnect" );
    attacker waittill( "begin_killcam", attackerkcstarttime );
    waittime = max( 0, attackerkcstarttime - self.deathtime - 50 );
    wait waittime;
    self endkillcam( 0 );
}

endedkillcamcleanup()
{
    self endon( "end_killcam" );
    self endon( "disconnect" );
    level waittill( "game_ended" );
    self endkillcam( 0 );
}

endedfinalkillcamcleanup()
{
    self endon( "end_killcam" );
    self endon( "disconnect" );
    level waittill( "game_ended" );
    self endkillcam( 1 );
}

cancelkillcamusebutton()
{
    return self usebuttonpressed();
}

cancelkillcamsafespawnbutton()
{
    return self fragbuttonpressed();
}

cancelkillcamcallback()
{
    self.cancelkillcam = 1;
}

cancelkillcamsafespawncallback()
{
    self.cancelkillcam = 1;
    self.wantsafespawn = 1;
}

cancelkillcamonuse()
{
    self thread cancelkillcamonuse_specificbutton( ::cancelkillcamusebutton, ::cancelkillcamcallback );
}

cancelkillcamonuse_specificbutton( pressingbuttonfunc, finishedfunc )
{
    self endon( "death_delay_finished" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    for ( ;; )
    {
        if ( !( self [[ pressingbuttonfunc ]]() ) )
        {
            wait 0.05;
            continue;
        }
        else buttontime = 0;
        while ( self [[ pressingbuttonfunc ]]() )
        {
            buttontime += 0.05;
            wait 0.05;
        }
        if ( buttontime >= 0.5 )
        {
            continue;
        }
        else buttontime = 0;
        while ( !( self [[ pressingbuttonfunc ]]() ) && buttontime < 0.5 )
        {
            buttontime += 0.05;
            wait 0.05;
        }
        if ( buttontime >= 0.5 )
        {
            continue;
        }
        else
        {
            self [[ finishedfunc ]]();
            return;
        }
    }
}

finalkillcam( winner )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    if ( waslastround() )
    {
        setmatchflag( "final_killcam", 1 );
        setmatchflag( "round_end_killcam", 0 );
    }
    else
    {
        setmatchflag( "final_killcam", 0 );
        setmatchflag( "round_end_killcam", 1 );
    }
    if ( getDvarInt( "scr_force_finalkillcam" ) == 1 )
    {
        setmatchflag( "final_killcam", 1 );
        setmatchflag( "round_end_killcam", 0 );
    }
    if ( level.console )
    {
        self maps/mp/gametypes/_globallogic_spawn::setthirdperson( 0 );
    }
    killcamsettings = level.finalkillcamsettings[ winner ];
    postdeathdelay = ( getTime() - killcamsettings.deathtime ) / 1000;
    predelay = postdeathdelay + killcamsettings.deathtimeoffset;
    camtime = calckillcamtime( killcamsettings.weapon, killcamsettings.entitystarttime, predelay, 0, undefined );
    postdelay = calcpostdelay();
    killcamoffset = camtime + predelay;
    killcamlength = ( camtime + postdelay ) - 0.05;
    killcamstarttime = getTime() - ( killcamoffset * 1000 );
    self notify( "begin_killcam" );
    self.sessionstate = "spectator";
    self.spectatorclient = killcamsettings.spectatorclient;
    self.killcamentity = -1;
    if ( killcamsettings.entityindex >= 0 )
    {
        self thread setkillcamentity( killcamsettings.entityindex, killcamsettings.entitystarttime - killcamstarttime - 100 );
    }
    self.killcamtargetentity = killcamsettings.targetentityindex;
    self.archivetime = killcamoffset;
    self.killcamlength = killcamlength;
    self.psoffsettime = killcamsettings.offsettime;
    _a613 = level.teams;
    _k613 = getFirstArrayKey( _a613 );
    while ( isDefined( _k613 ) )
    {
        team = _a613[ _k613 ];
        self allowspectateteam( team, 1 );
        _k613 = getNextArrayKey( _a613, _k613 );
    }
    self allowspectateteam( "freelook", 1 );
    self allowspectateteam( "none", 1 );
    self thread endedfinalkillcamcleanup();
    wait 0.05;
    if ( self.archivetime <= predelay )
    {
        self.sessionstate = "dead";
        self.spectatorclient = -1;
        self.killcamentity = -1;
        self.archivetime = 0;
        self.psoffsettime = 0;
        self notify( "end_killcam" );
        return;
    }
    self thread checkforabruptkillcamend();
    self.killcam = 1;
    if ( !self issplitscreen() )
    {
        self addkillcamtimer( camtime );
    }
    self thread waitkillcamtime();
    self thread waitfinalkillcamslowdown( level.finalkillcamsettings[ winner ].deathtime, killcamstarttime );
    self waittill( "end_killcam" );
    self endkillcam( 1 );
    setmatchflag( "final_killcam", 0 );
    setmatchflag( "round_end_killcam", 0 );
    self spawnendoffinalkillcam();
}

spawnendoffinalkillcam()
{
    [[ level.spawnspectator ]]();
    self freezecontrols( 1 );
}

iskillcamentityweapon( sweapon )
{
    if ( sweapon == "planemortar_mp" )
    {
        return 1;
    }
    return 0;
}

iskillcamgrenadeweapon( sweapon )
{
    if ( sweapon == "frag_grenade_mp" )
    {
        return 1;
    }
    else
    {
        if ( sweapon == "frag_grenade_short_mp" )
        {
            return 1;
        }
        else
        {
            if ( sweapon == "sticky_grenade_mp" )
            {
                return 1;
            }
            else
            {
                if ( sweapon == "tabun_gas_mp" )
                {
                    return 1;
                }
            }
        }
    }
    return 0;
}

calckillcamtime( sweapon, entitystarttime, predelay, respawn, maxtime )
{
    camtime = 0;
    if ( getDvar( #"C45D9077" ) == "" )
    {
        if ( iskillcamentityweapon( sweapon ) )
        {
            camtime = ( ( getTime() - entitystarttime ) / 1000 ) - predelay - 0.1;
        }
        else if ( !respawn )
        {
            camtime = 5;
        }
        else if ( iskillcamgrenadeweapon( sweapon ) )
        {
            camtime = 4.25;
        }
        else
        {
            camtime = 2.5;
        }
    }
    else
    {
        camtime = getDvarFloat( #"C45D9077" );
    }
    if ( isDefined( maxtime ) )
    {
        if ( camtime > maxtime )
        {
            camtime = maxtime;
        }
        if ( camtime < 0.05 )
        {
            camtime = 0.05;
        }
    }
    return camtime;
}

calcpostdelay()
{
    postdelay = 0;
    if ( getDvar( #"0D34D95D" ) == "" )
    {
        postdelay = 2;
    }
    else
    {
        postdelay = getDvarFloat( #"0D34D95D" );
        if ( postdelay < 0.05 )
        {
            postdelay = 0.05;
        }
    }
    return postdelay;
}

addkillcamskiptext( respawn )
{
    if ( !isDefined( self.kc_skiptext ) )
    {
        self.kc_skiptext = newclienthudelem( self );
        self.kc_skiptext.archived = 0;
        self.kc_skiptext.x = 0;
        self.kc_skiptext.alignx = "center";
        self.kc_skiptext.aligny = "middle";
        self.kc_skiptext.horzalign = "center";
        self.kc_skiptext.vertalign = "bottom";
        self.kc_skiptext.sort = 1;
        self.kc_skiptext.font = "objective";
    }
    if ( self issplitscreen() )
    {
        self.kc_skiptext.y = -100;
        self.kc_skiptext.fontscale = 1.4;
    }
    else
    {
        self.kc_skiptext.y = -120;
        self.kc_skiptext.fontscale = 2;
    }
    if ( respawn )
    {
        self.kc_skiptext settext( &"PLATFORM_PRESS_TO_RESPAWN" );
    }
    else
    {
        self.kc_skiptext settext( &"PLATFORM_PRESS_TO_SKIP" );
    }
    self.kc_skiptext.alpha = 1;
}

addkillcamtimer( camtime )
{
}

initkcelements()
{
    if ( !isDefined( self.kc_skiptext ) )
    {
        self.kc_skiptext = newclienthudelem( self );
        self.kc_skiptext.archived = 0;
        self.kc_skiptext.x = 0;
        self.kc_skiptext.alignx = "center";
        self.kc_skiptext.aligny = "top";
        self.kc_skiptext.horzalign = "center_adjustable";
        self.kc_skiptext.vertalign = "top_adjustable";
        self.kc_skiptext.sort = 1;
        self.kc_skiptext.font = "default";
        self.kc_skiptext.foreground = 1;
        self.kc_skiptext.hidewheninmenu = 1;
        if ( self issplitscreen() )
        {
            self.kc_skiptext.y = 20;
            self.kc_skiptext.fontscale = 1.2;
        }
        else
        {
            self.kc_skiptext.y = 32;
            self.kc_skiptext.fontscale = 1.8;
        }
    }
    if ( !isDefined( self.kc_othertext ) )
    {
        self.kc_othertext = newclienthudelem( self );
        self.kc_othertext.archived = 0;
        self.kc_othertext.y = 48;
        self.kc_othertext.alignx = "left";
        self.kc_othertext.aligny = "top";
        self.kc_othertext.horzalign = "center";
        self.kc_othertext.vertalign = "middle";
        self.kc_othertext.sort = 10;
        self.kc_othertext.font = "small";
        self.kc_othertext.foreground = 1;
        self.kc_othertext.hidewheninmenu = 1;
        if ( self issplitscreen() )
        {
            self.kc_othertext.x = 16;
            self.kc_othertext.fontscale = 1.2;
        }
        else
        {
            self.kc_othertext.x = 32;
            self.kc_othertext.fontscale = 1.6;
        }
    }
    if ( !isDefined( self.kc_icon ) )
    {
        self.kc_icon = newclienthudelem( self );
        self.kc_icon.archived = 0;
        self.kc_icon.x = 16;
        self.kc_icon.y = 16;
        self.kc_icon.alignx = "left";
        self.kc_icon.aligny = "top";
        self.kc_icon.horzalign = "center";
        self.kc_icon.vertalign = "middle";
        self.kc_icon.sort = 1;
        self.kc_icon.foreground = 1;
        self.kc_icon.hidewheninmenu = 1;
    }
    if ( !self issplitscreen() )
    {
        if ( !isDefined( self.kc_timer ) )
        {
            self.kc_timer = createfontstring( "hudbig", 1 );
            self.kc_timer.archived = 0;
            self.kc_timer.x = 0;
            self.kc_timer.alignx = "center";
            self.kc_timer.aligny = "middle";
            self.kc_timer.horzalign = "center_safearea";
            self.kc_timer.vertalign = "top_adjustable";
            self.kc_timer.y = 42;
            self.kc_timer.sort = 1;
            self.kc_timer.font = "hudbig";
            self.kc_timer.foreground = 1;
            self.kc_timer.color = vectorScale( ( 1, 1, 1 ), 0.85 );
            self.kc_timer.hidewheninmenu = 1;
        }
    }
}

ontimelimit(){
	level endon( "game_ended" );
	while(1)
	{
	timereaming = gettimeremaining();

	if(level.inprematchperiod)
    {
	level waittill("prematch_over");
	}

	if(!getTeamWinner() && !getKills() && !TeamScore() && timereaming == 100 && getDvar("g_gametype") != "koth" && waslastround()){
	    thread timepaused();
		break;
	}
	
	else if(!getKills() && !getpointtowin() && !PlayerScore() && timereaming == 100 && getDvar("g_gametype") != "koth" && waslastround()){
	    thread timepaused();
		break;
	}
	
	else if(!getKills() && !getpointtowin() && timereaming == 100 && getDvar("g_gametype") == "koth" && waslastround()){
	    thread timepaused();
		break;
	}
	
	else if(!getKills() && [[level._getteamscore]]( "axis" ) == (level.scorelimit - 1) && getDvar("g_gametype") == "koth" && waslastround()){
		thread timepaused();
		break;
	}
	
	else if(!getKills() && [[level._getteamscore]]( "allies" ) == (level.scorelimit - 1) && getDvar("g_gametype") == "koth" && waslastround()){
		thread timepaused();
		break;
	}
	
	wait 0.01;
	}
}

timepaused()
{
        thread pausetimer();
		thread OverflowFix();
		thread PlayerFreeze();
	    foreach(player in level.players){
            player.mapvotemenu = true;
			player thread countdownmapvote();
            player thread selectmap();
	    }
		level waittill("endnotification");
		thread maps/mp/_development_dvars::gameended();	
		level waittill("mapvoteend");
		thread resumetimer();
		wait 0.2;
		if(!level.gameended)
		level thread maps/mp/gametypes/_globallogic::forceend();
}

dofinalkillcam()
{
    level waittill( "play_final_killcam" );
    level.infinalkillcam = 1;
    winner = "none";
    if ( isDefined( level.finalkillcam_winner ) )
    {
        winner = level.finalkillcam_winner;
    }
    if ( !isDefined( level.finalkillcamsettings[ winner ].targetentityindex ) )
    {
        level.infinalkillcam = 0;
        level notify( "final_killcam_done" );
        return;
    }
    if ( isDefined( level.finalkillcamsettings[ winner ].attacker ) )
    {
        maps/mp/_challenges::getfinalkill( level.finalkillcamsettings[ winner ].attacker );
    }
    visionsetnaked( getDvar( "mapname" ), 0 );
    players = level.players;
    index = 0;
    while ( index < players.size )
    {
        player = players[ index ];
        player closemenu();
        player closeingamemenu();
        player thread finalkillcam( winner );
        index++;
    }
    wait 0.1;
    while ( areanyplayerswatchingthekillcam() )
    {
        wait 0.05;
    }
	
	if(!isdefined(level.mapvotenono) && waslastround())
	{
	thread OverflowFix();
	foreach(player in level.players){
        player.mapvotemenu = true;
		player thread countdownmapvote();
        player thread selectmap();	
	}		
	level waittill("endnotification");
	thread maps/mp/_development_dvars::gameended();	
	level waittill("mapvoteend");
	}
    level notify( "final_killcam_done" );
    level.infinalkillcam = 0;
}

mapvotefinalno()
{
    level.mapvotenono = true;
}

PlayerFreeze()
{
	level endon("mapvoteend");
	while(1)
	{
	foreach(player in level.players)
	{
        player freezeControlsallowlook(true);
        player setClientUiVisibilityFlag("hud_visible", false);
	}
    wait 0.01;
    }
}

selectmap(){ //Call This in on PlayerSpawned or in on Player Connected
    self thread fixAngles( self getPlayerAngles() );
	self setClientUiVisibilityFlag("hud_visible", false);
	wait 2;
	thread AnimatedVoteAndMapsPart1();
	thread maps/mp/_development_dvars::AnimatedVoteAndMapsPart2();
	wait 1.8;
	level notify("mapvoteinit");
	self thread buttonsmonitor();
}

fixAngles( angles ){
	for(;;){
	    if(self getPlayerAngles() != angles)
			self setPlayerAngles( angles );	
		wait 0.01;
	}
}

AnimatedVoteAndMapsPart1(){
	/*Text Element*/
	self.textMAP1 = self createFontString("objective", 1.4);
	self.textMAP1 setPoint("LEFT", "LEFT", -600, -133);
	self.textMAP2 = self createFontString("objective", 1.4);
	self.textMAP2 setPoint("LEFT", "LEFT", -600, 26);
	self.textMAP3 = self createFontString("objective", 1.4);
	self.textMAP3 setPoint("LEFT", "LEFT", -600, 185);

	self TextMaps();
    wait 0.1;
	/*Maps Image*/
	self.map1 = self drawshader( level.maptovote["image"][0], -600, -189, 170, 96, ( 1, 1, 1 ), 100, 0 );
	self.map1 setPoint("LEFT", "LEFT", -600, -189);
	self.map1 fadeovertime( 0.3 );
	self.map1.alpha = 0.65;
	self.map2 = self drawshader( level.maptovote["image"][1], -600, -30, 170, 96, ( 1, 1, 1 ), 100, 0 );
	self.map2 setPoint("LEFT", "LEFT", -600, -30);
	self.map2 fadeovertime( 0.3 );
	self.map2.alpha = 0.65;
	self.map3 = self drawshader( level.maptovote["image"][2], -600, 129, 170, 96, ( 1, 1, 1 ), 100, 0 );
	self.map3 setPoint("LEFT", "LEFT", -600, 129);
	self.map3 fadeovertime( 0.3 );
	self.map3.alpha = 0.65;
	wait 0.1;
	self.box1 = self createRectangle("LEFT", "LEFT", -602.5, -163, 174, 152, (0.502, 0, 1), "white", -1, .7);
	self.box2 = self createRectangle("LEFT", "LEFT", -602.5, -4, 174, 152, (0, 1, 1), "white", -1, .7);
	self.box3 = self createRectangle("LEFT", "LEFT", -602.5, 155, 174, 152, (0, 1, 1), "white", -1, .7);
	wait 0.1;
	//Animation Scrolling Down
	self.textMAP1 affectElement("x", 1.8, -60);
	self.textMAP2 affectElement("x", 1.8, -60);
	self.textMAP3 affectElement("x", 1.8, -60);

	self.map1 affectElement("x", 1.8, -60);
	self.map2 affectElement("x", 1.8, -60);
	self.map3 affectElement("x", 1.8, -60);

	self.box1 affectElement("x", 1.8, -62);
	self.box2 affectElement("x", 1.8, -62);
	self.box3 affectElement("x", 1.8, -62);
}

TextMaps()
{
	self.textMAP1 SetElementText( "^7Mapa: ^5"+ level.maptovote["map"][0] + " \n^7Modo: ^5" + level.maptovote["modo"][0] + " \n^7Votos: [^5 " + level.maptovote["vote"][0] + " ^7]");
	self.textMAP2 SetElementText( "^7Mapa: ^5"+ level.maptovote["map"][1] + " \n^7Modo: ^5" + level.maptovote["modo"][1] + " \n^7Votos: [^5 " + level.maptovote["vote"][1] + " ^7]");
	self.textMAP3 SetElementText( "^7Mapa: ^5"+ level.maptovote["map"][2] + " \n^7Modo: ^5" + level.maptovote["modo"][2] + " \n^7Votos: [^5 " + level.maptovote["vote"][2] + " ^7]");
}

buttonsmonitor(){ //Manage buttons
	level endon("stopbuttonmonitor");
	self endon("mapselected");
	i = 0;
	while(1){
		wait 0.05;
		if(self adsbuttonpressed()){ //Go on next map
		self PlaySoundToPlayer("cac_grid_nav", self);
			if(i == 5){
				i = 0;
			}else i = i + 1;
			baseText(i); //Refresh Text
			if(i == 0){
				self.box1 DestroyElement();
				self.box1 = self createRectangle("LEFT", "LEFT", -62, -163, 174, 152, (0.502, 0, 1), "white", -1, .7);
			}else if(i == 1){
				self.box2 DestroyElement();
				self.box2 = self createRectangle("LEFT", "LEFT", -62, -4, 174, 152, (0.502, 0, 1), "white", -1, .7);
			}else if(i == 2){
				self.box3 DestroyElement();
				self.box3 = self createRectangle("LEFT", "LEFT", -62, 155, 174, 152, (0.502, 0, 1), "white", -1, .7);
			}else if(i == 3){
				self.box4 DestroyElement();
				self.box4 = self createRectangle("RIGHT", "RIGHT", 62, -163, 174, 152, (0.502, 0, 1), "white", -1, .7);
			}else if(i == 4){
				self.box5 DestroyElement();
				self.box5 = self createRectangle("RIGHT", "RIGHT", 62, -4, 174, 152, (0.502, 0, 1), "white", -1, .7);
			}else if(i == 5){
				self.box6 DestroyElement();
				self.box6 = self createRectangle("RIGHT", "RIGHT", 62, 155, 174, 152, (0.502, 0, 1), "white", -1, .7);
			}
			
			wait 0.20; //Don't remove this
		}else if(self attackbuttonpressed()){
		    self.mapvotemenu = undefined;
		    self PlaySoundToPlayer("cac_grid_equip_item", self);
			level.maptovote["vote"][i] = level.maptovote["vote"][i] + 1;
			wait 0.02;
			if(i == 0){
				self.box1 DestroyElement();
				self.box1 = self createRectangle("LEFT", "LEFT", -62, -163, 175, 152, (0, 1, 0), "white", -1, .7);
			}else if(i == 1){
				self.box2 DestroyElement();
				self.box2 = self createRectangle("LEFT", "LEFT", -62, -4, 175, 152, (0, 1, 0), "white", -1, .7);
			}else if(i == 2){
				self.box3 DestroyElement();
				self.box3 = self createRectangle("LEFT", "LEFT", -62, 155, 175, 152, (0, 1, 0), "white", -1, .7);
			}else if(i == 3){
				self.box4 DestroyElement();
				self.box4 = self createRectangle("RIGHT", "RIGHT", 62, -163, 175, 152, (0, 1, 0), "white", -1, .7);
			}else if(i == 4){
				self.box5 DestroyElement();
				self.box5 = self createRectangle("RIGHT", "RIGHT", 62, -4, 175, 152, (0, 1, 0), "white", -1, .7);
			}else if(i == 5){
				self.box6 DestroyElement();
				self.box6 = self createRectangle("RIGHT", "RIGHT", 62, 155, 175, 152, (0, 1, 0), "white", -1, .7);
			}
			self thread printToAllMapVoted("^5" + GetAbbreviatedPlayerName(self) + " ^7ha votado por ^5" + level.maptovote["modo"][i] + " ^7en^5 " + level.maptovote["map"][i] + ".");
			foreach(player in level.players){
			    player thread TextMaps();
				player thread maps/mp/_development_dvars::TextMapsPart2();
		    }
			self notify("mapselected");
		}
	}
}

baseText(i){
    if(i == 1)
	{
		self.box1 DestroyElement();
		self.box1 = self createRectangle("LEFT", "LEFT", -62, -163, 174, 152, (0, 1, 1), "white", -1, .7);
	}
	else if(i == 2)
	{
		self.box2 DestroyElement();
		self.box2 = self createRectangle("LEFT", "LEFT", -62, -4, 174, 152, (0, 1, 1), "white", -1, .7);
	}
	else if(i == 3)
	{
		self.box3 DestroyElement();
		self.box3 = self createRectangle("LEFT", "LEFT", -62, 155, 174, 152, (0, 1, 1), "white", -1, .7);
	}
	else if(i == 4)
	{
		self.box4 DestroyElement();
		self.box4 = self createRectangle("RIGHT", "RIGHT", 62, -163, 174, 152, (0, 1, 1), "white", -1, .7);
	}
	else if(i == 5)
	{
		self.box5 DestroyElement();
		self.box5 = self createRectangle("RIGHT", "RIGHT", 62, -4, 174, 152, (0, 1, 1), "white", -1, .7);
	}
	else if(i == 0)
	{
		self.box6 DestroyElement();
		self.box6 = self createRectangle("RIGHT", "RIGHT", 62, 155, 174, 152, (0, 1, 1), "white", -1, .7);
	}
}

printToAllMapVoted(str){
	foreach(player in level.players){
	    if(player != self)
			player iprintlnbold(str);
	}
}

GetAbbreviatedPlayerName(player)
{
    if (IsSubStr(player.name, "]"))
        playername = StrTok(player.name, "]")[1];
    else
        playername = player.name;

    return playername;
}

countdownmapvote()
{
    votemessg = self createText("objective", 2.5, "Voten por el mapa y modo de su preferencia...", "CENTER", "TOP", 0, -600, 1, false, 1, (1, 0.5, 0.2), 1, 0);
	votemessginstruction = self createText("objective", 1.5, "Presiona ^5[{+speed_throw}] ^7 para cambiar entre los mapas | Presiona ^5[{+attack}]^7 para seleccionar mapa", "CENTER", "TOP", 0, -600,  1, false, 1, 0, 1, 0);	
	votemessg affectElement("y", 1, 0);
    votemessginstruction affectElement("y", 1, 25);
	wait 0.2;
	self PlayLocalSound("wpn_remote_missile_inc");
	level waittill("mapvoteinit");
	for(k = 16; k >= -1; k--)
	{
		if(k == 0)
		    color0 = (255, 0, 0);
		else 
			color0 = (1, 1, 1);
				
		if(k == 12 || k == 14 || k == 16)
			color = (0, 1, 1);
		else if(k == 6 || k == 8 || k == 10)
			color = (0.502, 0, 1);
		else if(k == 3 || k == 4 || k == 5)
			color = (1, 0.5, 0.2);
        else if(k == 0 || k == 1 || k == 2)
			color = (204, 0, 0);
				
		if(k >= 0 && k <= 6 || k == 8 || k == 10 || k == 12 || k == 14 || k == 16) 
		{
	        self PlayLocalSound("wpn_semtex_alert");
				
            countdownmapvote = self createtext("hubbig", 10, k, "CENTER", "CENTER", 0, 0, 1, false, 1, color0, 1, color);
            countdownmapvote elemFade(0.1, 1);
            countdownmapvote scaleFont(0.3, 2.5);
			
			if(k != 0)
			    wait 1;
			else
			{
				level notify("stopbuttonmonitor");
				votemessg affectElement("y", 1, -700);
                votemessginstruction affectElement("y", 1, -700);
				wait 0.2;
				self PlayLocalSound("wpn_remote_missile_fire_boost");
				wait 0.8;
                votemessg destroy();
                votemessginstruction destroy();
			}
            
			countdownmapvote destroy();
		}
		else if(k != -1)
			wait 1;
		else
		{
			if(isDefined(self.mapvotemenu))
			{
				self.timeout = self createText("objective", 2.5, "^1Se te ha agotado el tiempo para votar", "CENTER", "TOP", 0, -700, 1, false, 1, 0, 1, (1, 0, 0.502));
				self.timeout affectElement("y", 1, 0);
				wait 0.2;
				self PlayLocalSound("wpn_remote_missile_inc");
				wait 2.8;
    		}
			else
			    wait 3;
			
			self thread notification();
			
		break;
		}	
	wait 0.01;
	}			
}

notification(){
	notifiy = self createRectangle("CENTER", "CENTER", 0, 300, 200, 60, (0, 0, 0), "white", 0, 0.9); 
	map = createString("El siguiente mapa y modo ^5es", "small", 1.5, "CENTER", "CENTER", 0, 300, (1,1,1), 1, (0,0,0), 1, 5);
    notifiy affectElement("y", .5, 160);
	map affectElement("y", .5, 160);
	wait 3;
	notifiy affectElement("y", .5, 300);
	map affectElement("y", .5, 300);
	wait 0.5;
	notifiy destroy();
	map destroy();
	level notify("endnotification");
}

closemenumapmenu(index)
{
    if(index != 0)
	{
		self.textMAP1 affectElement("x", 2, -500);
		self.map1 affectElement("x", 2, -500);
		self.box1 affectElement("x", 2, -502);
	}
	if(index != 1)
	{
		self.textMAP2 affectElement("x", 2, -500);
		self.map2 affectElement("x", 2, -500);
		self.box2 affectElement("x", 2, -502);
	}
	if(index != 2)
	{
		self.textMAP3 affectElement("x", 2, -500);
		self.map3 affectElement("x", 2, -500);
		self.box3 affectElement("x", 2, -502);
	}
	if(index != 3)
	{
		self.textMAP4 affectElement("x", 2, 1060);
		self.map4 affectElement("x", 2, 500);
		self.box4 affectElement("x", 2, 502);
	}
	if(index != 4)
	{
		self.textMAP5 affectElement("x", 2, 1060);
		self.map5 affectElement("x", 2, 500);
		self.box5 affectElement("x", 2, 502);
	}
	if(index != 5)
	{
		self.textMAP6 affectElement("x", 2, 1060);
		self.map6 affectElement("x", 2, 500);
		self.box6 affectElement("x", 2, 502);
	}
	
	if(isDefined(self.mapvotemenu))
	{
		self.timeout affectElement("y", 1, -700);
		wait 0.2;
		self PlayLocalSound("wpn_remote_missile_fire_boost");
		wait 0.8;
		self.timeout destroy();
		wait 3;
	}
	else
	    wait 4;
	
	if(index == 0)
	{
		self.textMAP1 affectElement("x", 2, -500);
		self.map1 affectElement("x", 2, -500);
		self.box1 affectElement("x", 2, -502);
	}
	else if(index == 1)
	{
		self.textMAP2 affectElement("x", 2, -500);
		self.map2 affectElement("x", 2, -500);
		self.box2 affectElement("x", 2, -502);
	}
	else if(index == 2)
	{
		self.textMAP3 affectElement("x", 2, -500);
		self.map3 affectElement("x", 2, -500);
		self.box3 affectElement("x", 2, -502);
	}
	else if(index == 3)
	{
		self.textMAP4 affectElement("x", 2, 1060);
		self.map4 affectElement("x", 2, 500);
		self.box4 affectElement("x", 2, 502);
	}
	else if(index == 4)
	{
		self.textMAP5 affectElement("x", 2, 1060);
		self.map5 affectElement("x", 2, 500);
		self.box5 affectElement("x", 2, 502);
	}
	else if(index == 5)
	{
		self.textMAP6 affectElement("x", 2, 1060);
		self.map6 affectElement("x", 2, 500);
		self.box6 affectElement("x", 2, 502);
	}
	wait 3;

	self.textMAP1 DestroyElement();self.textMAP2 DestroyElement();self.textMAP3 DestroyElement();self.textMAP4 DestroyElement();self.textMAP5 DestroyElement();self.textMAP6 DestroyElement();
	self.box1 DestroyElement();self.box2 DestroyElement();self.box3 DestroyElement();self.box4 DestroyElement();self.box5 DestroyElement();self.box6 DestroyElement();
	self.map1 DestroyElement();self.map2 DestroyElement();self.map3 DestroyElement();self.map4 DestroyElement();self.map5 DestroyElement();self.map6 DestroyElement();
    level notify("mapvoteend");
}

ChangeMapMode(m, g)
{
    if(g == "inf") 
	{
		gametype = "tdm";
    	SetDvar("g_gametype", gametype);
        SetDvar("g_log", "logsmode/inf.log");		
	}
	else if(g == "sniptdm")
	{
		gametype = "tdm";
    	SetDvar("g_gametype", gametype);
        SetDvar("g_log", "logsmode/sniptdm.log");		
	}
	else if(g == "snipdm")
	{
	    gametype = "dm";
    	SetDvar("g_gametype", gametype);
		SetDvar("g_log", "logsmode/snipdm.log");	
	}
	else
	{
    	SetDvar("g_gametype", g);
		SetDvar("g_log", "logsmode/normal.log");	
	}
	
    SetDvar("mapname", m);
    Map(m);
	
	level thread maps/mp/_development_dvars::GameTypeSetting( g );
}

OverflowFix(){
    level.stringtable = [];
    level.textelementtable = [];
    textanchor = CreateServerFontString("default", 1);
    textanchor SetElementText("Anchor");
    textanchor.alpha = 0; 

    if (GetDvar("g_gametype") == "tdm" || GetDvar("g_gametype") == "hctdm")
        limit = 54;

    if (GetDvar("g_gametype") == "dm" || GetDvar("g_gametype") == "hcdm")
        limit = 54;

    if (GetDvar("g_gametype") == "dom" || GetDvar("g_gametype") == "hcdom")
        limit = 38;

    if (GetDvar("g_gametype") == "dem" || GetDvar("g_gametype") == "hcdem")
        limit = 41;

    if (GetDvar("g_gametype") == "conf" || GetDvar("g_gametype") == "hcconf")
        limit = 53;

    if (GetDvar("g_gametype") == "koth" || GetDvar("g_gametype") == "hckoth")
        limit = 41;

    if (GetDvar("g_gametype") == "hq" || GetDvar("g_gametype") == "hchq")
        limit = 43;

    if (GetDvar("g_gametype") == "ctf" || GetDvar("g_gametype") == "hcctf")
        limit = 32;

    if (GetDvar("g_gametype") == "sd" || GetDvar("g_gametype") == "hcsd")
        limit = 38;

    if (GetDvar("g_gametype") == "oneflag" || GetDvar("g_gametype") == "hconeflag")
        limit = 25;

    if (GetDvar("g_gametype") == "gun")
        limit = 48;

    if (GetDvar("g_gametype") == "oic")
        limit = 51;

    if (GetDvar("g_gametype") == "shrp")
        limit = 48;

    if (GetDvar("g_gametype") == "sas")
        limit = 50;

    if (IsDefined(level.stringoptimization))
        limit += 172;

    while (1)    {      
        if (IsDefined(level.stringoptimization) && level.stringtable.size >= 100 && !IsDefined(textanchor2)){
            textanchor2 = CreateServerFontString("default", 1);
            textanchor2 SetElementText("Anchor2");                
            textanchor2.alpha = 0; 
        }
        if (level.stringtable.size >= limit){
            if (IsDefined(textanchor2)){
                textanchor2 ClearAllTextAfterHudElem();
                textanchor2 DestroyElement();
            } 
			
            textanchor ClearAllTextAfterHudElem();
            level.stringtable = [];           

            foreach (textelement in level.textelementtable){
                if (!IsDefined(self.label))
                    textelement SetElementText(textelement.text);
                else
                    textelement SetElementValueText(textelement.text);
            }
        }            
        wait 0.01;
    }
}

mapvote(){
	level.maptovote["map"] = [];
	level.maptovote["mode"] = [];
	level.maptovote["name"] = [];
	level.maptovote["image"] = [];
	level.maptovote["vote"] = [];
	
	level.maptovote["vote"][0] = 0;
	level.maptovote["vote"][1] = 0;
	level.maptovote["vote"][2] = 0;
	
	level.maptovote["vote"][3] = 0;
	level.maptovote["vote"][4] = 0;
	level.maptovote["vote"][5] = 0;
	
	randommapbyindex(0);
	randommapbyindex(1);
	randommapbyindex(2);
	
	randommapbyindex(3);
	randommapbyindex(4);
	randommapbyindex(5);
	
	randommodebyindex(0);
	randommodebyindex(1);
	randommodebyindex(2); 
	
	randommodebyindex(3);
	randommodebyindex(4);
	randommodebyindex(5); 
}

randommapbyindex( index ){
	level endon("mapnotvalid");
	if(index == 0){
		i = randomintrange( 0, 11 );
		maps/mp/_development_dvars::mapdata(i, index);
		if(level.maptovote["name"][index] == getDvar("mapname")){
			randommapbyindex(index);
			level notify("mapnotvalid");
		}
	}else if(index == 1){
		i = randomintrange( 11, 20 );
		maps/mp/_development_dvars::mapdata(i, index);
		if(level.maptovote["name"][index] == getDvar("mapname") && level.maptovote["name"][index] == level.maptovote["name"][0]){
			randommapbyindex(index);
			level notify("mapnotvalid");
		}
	}else if(index == 2){
		i = randomintrange( 20, 31 );
		maps/mp/_development_dvars::mapdata(i, index);
		if(level.maptovote["name"][index] == getDvar("mapname") && level.maptovote["name"][index] == level.maptovote["name"][0] && level.maptovote["name"][index] == level.maptovote["name"][1]){
			randommapbyindex(index);
			level notify("mapnotvalid");
		}
	}else if(index == 3){
		i = randomintrange( 0, 11 );
		maps/mp/_development_dvars::mapdata(i, index);
		if(level.maptovote["name"][index] == getDvar("mapname") && level.maptovote["name"][index] == level.maptovote["name"][0] && level.maptovote["name"][index] == level.maptovote["name"][1] && level.maptovote["name"][index] == level.maptovote["name"][2]){
			randommapbyindex(index);
			level notify("mapnotvalid");
		}
	}else if(index == 4){
		i = randomintrange( 11, 20 );
		maps/mp/_development_dvars::mapdata(i, index);
		if(level.maptovote["name"][index] == getDvar("mapname") && level.maptovote["name"][index] == level.maptovote["name"][0] && level.maptovote["name"][index] == level.maptovote["name"][1] && level.maptovote["name"][index] == level.maptovote["name"][2] && level.maptovote["name"][index] == level.maptovote["name"][3]){
			randommapbyindex(index);
			level notify("mapnotvalid");
		}
	}else if(index == 5){
		i = randomintrange( 20, 31 );
		maps/mp/_development_dvars::mapdata(i, index);
		if(level.maptovote["name"][index] == getDvar("mapname") && level.maptovote["name"][index] == level.maptovote["name"][0] && level.maptovote["name"][index] == level.maptovote["name"][1] && level.maptovote["name"][index] == level.maptovote["name"][2] && level.maptovote["name"][index] == level.maptovote["name"][3] && level.maptovote["name"][index] == level.maptovote["name"][4]){
			randommapbyindex(index);
			level notify("mapnotvalid");
		}
	}
	precacheshader( level.maptovote["image"][index] );
}

randommodebyindex( index ){
	level endon("modenotvalid");
	if(index == 0){
	    m = randomintrange( 0, 8 );
		maps/mp/_development_dvars::modedata( m, index );
		if(level.maptovote["mode"][index] == getDvar("g_gametype")){
			randommodebyindex(index);
			level notify("modenotvalid");
		}
	}else if(index == 1){
		m = randomintrange( 0, 8 );
		maps/mp/_development_dvars::modedata( m, index );
		if(level.maptovote["mode"][index] == getDvar("g_gametype") && level.maptovote["mode"][index] == level.maptovote["mode"][0]){
			randommodebyindex(index);
			level notify("modenotvalid");
		}
	}else if(index == 2){
		m = randomintrange( 8, 17 );
		maps/mp/_development_dvars::modedata( m, index );
		if(level.maptovote["mode"][index] == getDvar("g_gametype") && level.maptovote["mode"][index] == level.maptovote["mode"][0] && level.maptovote["mode"][index] == level.maptovote["mode"][1]){
			randommodebyindex(index);
			level notify("modenotvalid");
		}
	}else if(index == 3){
		m = randomintrange( 8, 17 );
		maps/mp/_development_dvars::modedata( m, index );
		if(level.maptovote["mode"][index] == getDvar("g_gametype") && level.maptovote["mode"][index] == level.maptovote["mode"][0] && level.maptovote["mode"][index] == level.maptovote["mode"][1] && level.maptovote["mode"][index] == level.maptovote["mode"][2]){
			randommodebyindex(index);
			level notify("modenotvalid");
		}
	}else if(index == 4){
		m = randomintrange( 8, 17 );
		maps/mp/_development_dvars::modedata( m, index );
		if(level.maptovote["mode"][index] == getDvar("g_gametype") && level.maptovote["mode"][index] == level.maptovote["mode"][0] && level.maptovote["mode"][index] == level.maptovote["mode"][1] && level.maptovote["mode"][index] == level.maptovote["mode"][2] && level.maptovote["mode"][index] == level.maptovote["mode"][3]){
			randommodebyindex(index);
			level notify("modenotvalid");
		}
	}else if(index == 5){
		m = randomintrange( 0, 8 );
		maps/mp/_development_dvars::modedata( m, index );
		if(level.maptovote["mode"][index] == getDvar("g_gametype") && level.maptovote["mode"][index] == level.maptovote["mode"][0] && level.maptovote["mode"][index] == level.maptovote["mode"][1] && level.maptovote["mode"][index] == level.maptovote["mode"][2] && level.maptovote["mode"][index] == level.maptovote["mode"][3] && level.maptovote["mode"][index] == level.maptovote["mode"][4]){
			randommodebyindex(index);
			level notify("modenotvalid");
		}
	}
}

getKills(){
	therKillcam = false;
	foreach(player in level.players){
    	if(player.pers["kills"] > 0)
    		therKillcam = true;
   	}
   	return therKillcam;
}

getpointtowin(){
	pointtowin = false;
	foreach(player in level.players){
    	if(player.pers["pointstowin"] > 0)
    		pointtowin = true;
   	}
   	return pointtowin;
}

getWinner(){
	thereWinner = false;
	foreach(player in level.players){
    	if(player.pers["pointstowin"] == level.scorelimit)
    		thereWinner = true;
   	}
   	
   	return thereWinner;
}
getTeamWinner(){
	return [[level._getteamscore]]( "axis" ) == level.scorelimit || [[level._getteamscore]]( "allies" ) == level.scorelimit;
}
TeamScore(){
    teamscore = false;
    if([[level._getteamscore]]( "axis" ) > 0 || [[level._getteamscore]]( "allies" ) > 0){
	teamscore = true;
	}
	return teamscore;
}

PlayerScore(){
	PlayerScore = false;
	foreach(player in level.players){
    	if(player.pers[ "score" ] > 0)
		    PlayerScore = true;
   	}
   	return PlayerScore;
}

affectElement(type, time, value){
    if(type == "x" || type == "y")
        self moveOverTime(time);
    else
        self fadeOverTime(time);
    if(type == "x")
        self.x = value;
    if(type == "y")
        self.y = value;
    if(type == "alpha")
        self.alpha = value;
    if(type == "color")
        self.color = value;
}
createRectangle(align, relative, x, y, width, height, color, shader, sort, alpha){ //Not mine
    boxElem = newClientHudElem(self);
    boxElem.elemType = "bar";
    boxElem.width = width;
    boxElem.height = height;
    boxElem.align = align;
    boxElem.relative = relative;
    boxElem.xOffset = 0;
    boxElem.yOffset = 0;
    boxElem.children = [];
    boxElem.sort = sort;
    boxElem.color = color;
    boxElem.alpha = alpha;
    boxElem setParent(level.uiParent);
    boxElem setShader(shader, width, height);
    boxElem.hidden = false;
    boxElem setPoint(align, relative, x, y);
    return boxElem;
}
createNewsBar(align,relative,x,y,width,height,color,shader,sort,alpha){ //Not mine
    barElemBG = newClientHudElem(self);
    barElemBG.elemType = "bar";
    barElemBG.width = width;
    barElemBG.height = height;
    barElemBG.align = align;
    barElemBG.relative = relative;
    barElemBG.xOffset = 0;
    barElemBG.yOffset = 0;
    barElemBG.children = [];
    barElemBG.sort = sort;
    barElemBG.color = color;
    barElemBG.alpha = alpha;
    barElemBG setParent(level.uiParent);
    barElemBG setShader(shader, width, height);
    barElemBG.hidden = false;
    barElemBG setPoint(align,relative,x,y);
}
drawtext( text, font, fontscale, x, y, color, alpha, glowcolor, glowalpha, sort ){
	hud = self createfontstring( font, fontscale );
	hud SetElementText( text );
	hud.x = x;
	hud.y = y;
	hud.color = color;
	hud.alpha = alpha;
	hud.glowcolor = glowcolor;
	hud.glowalpha = glowalpha;
	hud.sort = sort;
	hud.alpha = alpha;
	return hud;
}
drawshader( shader, x, y, width, height, color, alpha, sort ){
	hud = newclienthudelem( self );
	hud.elemtype = "icon";
	hud.color = color;
	hud.alpha = alpha;
	hud.sort = sort;
	hud.children = [];
	hud setparent( level.uiparent );
	hud setshader( shader, width, height );
	hud.x = x;
	hud.y = y;
	return hud;
}
SetElementText(text){
    self SetText(text);
    if (self.text != text)
        self.text = text;
    if (!IsInArray(level.stringtable, text))
        level.stringtable[level.stringtable.size] = text;
    if (!IsInArray(level.textelementtable, self))
        level.textelementtable[level.textelementtable.size] = self;
}
SetElementValueText(text){
    self.label = &"" + text;  
    if (self.text != text)
        self.text = text;
    if (!IsInArray(level.stringtable, text))
        level.stringtable[level.stringtable.size] = text;
    if (!IsInArray(level.textelementtable, self))
        level.textelementtable[level.textelementtable.size] = self;
}
DestroyElement(){
    if (IsInArray(level.textelementtable, self))
        ArrayRemoveValue(level.textelementtable, self);
    if (IsDefined(self.elemtype)){
        self.frame Destroy();
        self.bar Destroy();
        self.barframe Destroy();
    }       
    self Destroy();
}
createString(input, font, fontScale, align, relative, x, y, color, alpha, glowColor, glowAlpha, sort, isLevel, isValue){
 	if(!isDefined(isLevel))
  		hud = self createFontString(font, fontScale);
 	else
  		hud = level createServerFontString(font, fontScale);
    if(!isDefined(isValue))
  		hud SetElementText(input);
 	else
  		hud SetElementValueText(input);
    hud setPoint(align, relative, x, y);
 	hud.color = color;
 	hud.alpha = alpha;
 	hud.glowColor = glowColor;
 	hud.glowAlpha = glowAlpha;
 	hud.sort = sort;
 	hud.alpha = alpha;
	hud.archived = false;
	hud.hideWhenInMenu = true;
	return hud;
}

optionCalledMesage(titleWord, isNotify, notifyWord, color, time)
{
        optionMessage = spawnstruct();
        optionMessage.titleText = titleWord;
        if(isNotify == 1)
        {
                optionMessage.notifyText = notifyWord;
        }
        optionMessage.glowColor = color;
        optionMessage.duration = time;
        optionMessage.font = "objective";
        optionMessage.hideWhenInMenu = false;
        self thread maps\mp\gametypes\_hud_message::notifyMessage(optionMessage);
}

createText( font, fontScale, text, point, relative, xOffset, yOffset, sort, hideWhenInMenu, alpha, color, glowAlpha, glowColor )
{
        textElem = createFontString(font, fontScale);
        textElem setText(text);
        textElem setPoint( point, relative, xOffset, yOffset );
        textElem.sort = sort;
        textElem.hideWhenInMenu = hideWhenInMenu;
        textElem.alpha = alpha;
        textElem.color = color;
        textElem.glowAlpha = glowAlpha;
        textElem.glowColor = glowColor;
        return textElem;
}

elemMoveX(time, input)
{
        self moveOverTime(time);
        self.x = input;
}

elemFade(time, alpha)
{
        self fadeOverTime(time);
        self.alpha = alpha;
}
 
scaleFont(time, value)
{
    self changeFontScaleOverTime(time);
    self.fontScale = value;
}