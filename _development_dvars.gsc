#include maps/mp/_utility;
#include common_scripts/utility;
#include maps\mp\gametypes\_hud_util;

init()
{
}

GameTypeSetting( g ){
    switch( g ){
	    case "tdm":
		
	        setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("teamScorePerKill", 1);
		    setgametypesetting("teamScorePerDeath", 0);
		    setgametypesetting("teamScorePerHeadshot", 0);
		    setgametypesetting("playerNumLives", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
			
		    setgametypesetting("hardcoremode", 0);
		    setgametypesetting("timelimit", 10); 
		    setgametypesetting("scorelimit", 200);
		    setgametypesetting("allowInGameTeamChange", 1);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
		    setgametypesetting("playerMaxHealth", 100);
			

		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "sniptdm":
		
		    setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("teamScorePerKill", 1);
		    setgametypesetting("teamScorePerDeath", 0);
		    setgametypesetting("teamScorePerHeadshot", 0);
		    setgametypesetting("playerNumLives", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		
		    setgametypesetting("hardcoremode", 0);
	        setgametypesetting("allowInGameTeamChange", 1);
		    setgametypesetting("playerMaxHealth", 10);
		    setgametypesetting("timelimit", 10); 
		    setgametypesetting("scorelimit", 150);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
			
			
			 
		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "inf":
		
            setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("teamScorePerKill", 1);
		    setgametypesetting("teamScorePerDeath", 0);
		    setgametypesetting("teamScorePerHeadshot", 0);
		    setgametypesetting("playerNumLives", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		
		    setgametypesetting("hardcoremode", 1);
	        setgametypesetting("allowInGameTeamChange", 0);
		    setgametypesetting("playerMaxHealth", 100);
		    setgametypesetting("timelimit", 15);
		    setgametypesetting("scorelimit", 0);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
			
			
		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "dm":
		
	        setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 1); 
	        setgametypesetting("timelimit", 10); 
	        setgametypesetting("scorelimit", 75);
	        setgametypesetting("playerNumLives", 0);
	        setgametypesetting("teamScorePerKill", 1);
		    setgametypesetting("hardcoremode", 0);
	        setgametypesetting("allowInGameTeamChange", 0);
	        setgametypesetting("teamScorePerDeath", 0);
	        setgametypesetting("teamScorePerHeadshot", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
		    setgametypesetting("playerMaxHealth", 100);
			
			
		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "snipdm":
		
	        setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 1); 
	        setgametypesetting("timelimit", 10); 
	        setgametypesetting("scorelimit", 75);
	        setgametypesetting("playerNumLives", 0);
	        setgametypesetting("teamScorePerKill", 1);
		    setgametypesetting("hardcoremode", 0);
	        setgametypesetting("allowInGameTeamChange", 0);
	        setgametypesetting("teamScorePerDeath", 0);
	        setgametypesetting("teamScorePerHeadshot", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		
		    setgametypesetting("playerMaxHealth", 10);
			
			
			 
		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "koth":
		
		    setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("timelimit", 5); 
		    setgametypesetting("scorelimit", 250);
		    setgametypesetting("allowInGameTeamChange", 1);
		    setgametypesetting("playerNumLives", 0);
		    setgametypesetting("autoDestroyTime", 60);
		    setgametypesetting("captureTime", 0);
		    setgametypesetting("objectiveSpawnTime", 0);
		    setgametypesetting("randomObjectiveLocations", 1);
		    setgametypesetting("scorePerPlayer", 1);
			setgametypesetting("hardcoremode", 0);
			setgametypesetting("loadoutKillStreaksEnabled", 1);
			setgametypesetting("allowSpectating", 0);
			setgametypesetting("playerMaxHealth", 100);
			setgametypesetting("kothMode", 1);
			
			setgametypesetting("destroyTime", 0);
			setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "shrp":
		 
		    setgametypesetting("maxAllocation", 17);
			setgametypesetting("teamCount", 1);
			setgametypesetting("timelimit", 10); 
			setgametypesetting("scorelimit", 0);
			setgametypesetting("playerNumLives", 0);
			setgametypesetting("allowInGameTeamChange", 0);
			setgametypesetting("loadoutKillStreaksEnabled", 1);
			setgametypesetting("pointsPerWeaponKill", 10);
			setgametypesetting("pointsPerMeleeKill", 10);
			setgametypesetting("pointsForSurvivalBonus", 5);
			setgametypesetting("forceradar", 0);
			setgametypesetting("weaponTimer", 30 );
			setgametypesetting("weaponCount", 10 );
			setgametypesetting("hardcoremode", 0);
			setgametypesetting("allowSpectating", 0);
			setgametypesetting("playerMaxHealth", 100);
			setgametypesetting("kothMode", 0);
			
			
			 
		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "sas":
		
		    setgametypesetting("maxAllocation", 17);
			setgametypesetting("teamCount", 1);
			setgametypesetting("timelimit", 4); 
			setgametypesetting("scorelimit", 0);
			setgametypesetting("gunSelection", 1);
			setgametypesetting("playerNumLives", 0);
			setgametypesetting("setbacks", 0);
			setgametypesetting("allowInGameTeamChange", 0);
    		setgametypesetting("roundStartExplosiveDelay", 0);
			setgametypesetting("loadoutKillStreaksEnabled", 0);
			setgametypesetting("pointsPerPrimaryKill", 10);
			setgametypesetting("pointsPerSecondaryKill", 10);
			setgametypesetting("pointsPerPrimaryGrenadeKill", 5);
			setgametypesetting("pointsPerMeleeKill", 5);
			setgametypesetting("forceradar", 0);
			setgametypesetting("hardcoremode", 0);
			setgametypesetting("allowSpectating", 0);
			setgametypesetting("playerMaxHealth", 100);
			setgametypesetting("kothMode", 0);
			
			
			 
		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "gun":
		
		    setgametypesetting("maxAllocation", 17);
			setgametypesetting("teamCount", 1);
			setgametypesetting("timelimit", 10);
			setgametypesetting("scorelimit", 0);
			setgametypesetting("playerNumLives", 0);
			setgametypesetting("allowInGameTeamChange", 0);
			setgametypesetting("setbacks", 2);
			setgametypesetting("gunSelection", 3);
			setgametypesetting("loadoutKillStreaksEnabled", 0);
			setgametypesetting("forceradar", 0);
			setgametypesetting("hardcoremode", 0);
			setgametypesetting("allowSpectating", 0);
			setgametypesetting("playerMaxHealth", 100);
			setgametypesetting("kothMode", 0);
			
			
			 
		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "oic":
		
		    setgametypesetting("maxAllocation", 17);
			setgametypesetting("teamCount", 1);
			setgametypesetting("timelimit", 5); 
			setgametypesetting("scorelimit", 0);
			setgametypesetting("allowInGameTeamChange", 0);
			setgametypesetting("playerNumLives", 9);
			setgametypesetting("pointsPerWeaponKill", 10);
			setgametypesetting("pointsPerMeleeKill", 10);
			setgametypesetting("pointsForSurvivalBonus", 5);
			setgametypesetting("loadoutKillStreaksEnabled", 0);
			setgametypesetting("forceradar", 0);
			setgametypesetting("hardcoremode", 0);
			setgametypesetting("allowSpectating", 0);
			setgametypesetting("kothMode", 0);
			
			
		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "hq":
		
            setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("playerNumLives", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		    setgametypesetting("hardcoremode", 0);
			
		    setgametypesetting("timelimit", 15); 
		    setgametypesetting("scorelimit", 250);
		    setgametypesetting("allowInGameTeamChange", 1);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
		    setgametypesetting("playerMaxHealth", 100);
			
			setgametypesetting("captureTime", 20); 
		    setgametypesetting("destroyTime", 20);
		    setgametypesetting("autoDestroyTime", 60);
		    setgametypesetting("objectiveSpawnTime", 0);
		    setgametypesetting("randomObjectiveLocations", 1);
			

		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "sd":
		
		    setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("playerNumLives", 1);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		    setgametypesetting("hardcoremode", 0);
			
		    setgametypesetting("timelimit", 2.5); 
		    setgametypesetting("scorelimit", 2);
		    setgametypesetting("allowInGameTeamChange", 0);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
		    setgametypesetting("playerMaxHealth", 100);
			
			setgametypesetting("bombTimer", 45); 
		    setgametypesetting("plantTime", 5);
		    setgametypesetting("defuseTime", 5);
		    setgametypesetting("multiBomb", 0);
		    setgametypesetting("roundswitch", 1);
			setgametypesetting("silentPlant", 0); 
			
			
			
		    setgametypesetting("roundlimit", 3);
		    setgametypesetting("roundwinlimit", 2);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "dem":
		
		    setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("playerNumLives", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		    setgametypesetting("hardcoremode", 0);
			
		    setgametypesetting("timelimit", 2.5); 
		    setgametypesetting("scorelimit", 2);
		    setgametypesetting("allowInGameTeamChange", 1);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
		    setgametypesetting("playerMaxHealth", 100);
			
			setgametypesetting("bombTimer", 45); 
		    setgametypesetting("plantTime", 5);
		    setgametypesetting("defuseTime", 5);
		    setgametypesetting("extraTime", 2);
		    setgametypesetting("OvertimetimeLimit", 2);
			setgametypesetting("silentPlant", 0); 
			
			
			 
		    setgametypesetting("roundlimit", 3);
		    setgametypesetting("roundwinlimit", 2);
		    setgametypesetting("playerRespawnDelay", 0);
		    setgametypesetting("roundswitch", 1);
		    setgametypesetting("multiBomb", 0);
		break;
		
		case "dom":
		
		    setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("playerNumLives", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		    setgametypesetting("hardcoremode", 0);
		
		    setgametypesetting("timelimit", 10); 
		    setgametypesetting("scorelimit", 300);
		    setgametypesetting("allowInGameTeamChange", 1);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
		    setgametypesetting("playerMaxHealth", 100);
			
			setgametypesetting("captureTime", 10); 
		    setgametypesetting("roundLimit", 1);
		    setgametypesetting("roundswitch", 0);
		    setgametypesetting("roundwinlimit", 1);
			

		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "conf":
		
		    setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("teamScorePerKill", 0);
		    setgametypesetting("teamScorePerKillConfirmed", 4);
		    setgametypesetting("teamScorePerKillDenied", 0);
		    setgametypesetting("playerNumLives", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		    setgametypesetting("hardcoremode", 0);
		
		    setgametypesetting("timelimit", 10); 
		    setgametypesetting("scorelimit", 150);
		    setgametypesetting("allowInGameTeamChange", 1);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
		    setgametypesetting("playerMaxHealth", 100);
			
			
			 
		    setgametypesetting("roundlimit", 1);
		    setgametypesetting("playerRespawnDelay", 0);
		break;
		
		case "ctf":
		
		    setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("playerNumLives", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		    setgametypesetting("hardcoremode", 0);
		
		    setgametypesetting("timelimit", 5); 
		    setgametypesetting("scorelimit", 2);
		    setgametypesetting("allowInGameTeamChange", 1);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
		    setgametypesetting("playerMaxHealth", 100);
			
			setgametypesetting("roundscorecarry", 0);
			setgametypesetting("roundlimit", 3);
			setgametypesetting("roundwinlimit", 2);
			setgametypesetting("enemyCarrierVisible", 2);
			setgametypesetting("idleFlagResetTime", 30);
			setgametypesetting("captureTime", 0);
			setgametypesetting("playerRespawnDelay", 7.5);
			
			
		    setgametypesetting("flagRespawnTime", 3);
		    setgametypesetting("roundswitch", 1);
			
		break;
		
		case "oneflag":
		
		    setgametypesetting("maxAllocation", 17);
		    setgametypesetting("teamCount", 2);
		    setgametypesetting("playerNumLives", 0);
	        setgametypesetting("roundStartExplosiveDelay", 0);
	        setgametypesetting("roundStartKillstreakDelay", 0);
		    setgametypesetting("allowSpectating", 0);
		    setgametypesetting("kothMode", 0);
		    setgametypesetting("hardcoremode", 0);
		
		    setgametypesetting("timelimit", 5); 
		    setgametypesetting("scorelimit", 2);
		    setgametypesetting("allowInGameTeamChange", 1);
		    setgametypesetting("loadoutKillStreaksEnabled", 1);
		    setgametypesetting("playerMaxHealth", 100);
			
			 
		    setgametypesetting("roundlimit", 3);
		    setgametypesetting("roundwinlimit", 2);
		    setgametypesetting("enemyCarrierVisible", 2);
		    setgametypesetting("idleFlagResetTime", 30);
			setgametypesetting("captureTime", 0); 
		    setgametypesetting("flagRespawnTime", 10);
		    setgametypesetting("playerRespawnDelay", 5);
			

		    setgametypesetting("roundswitch", 1);
		break;
	wait 0.01;
	}
}

mapdata( i, index ){ //Map Parser
	/*
		This area convert a number i to a map with all information
		about the maps.
		 # Game Name
		 # map mp
		 # Map image
	*/
	switch( i ){
		//Base MAP
		case 0:
		level.maptovote["map"][index] = "Aftermath";
	 	level.maptovote["name"][index] = "mp_la";
	    level.maptovote["image"][index] = "loadscreen_mp_la";
		break;
		case 1:
		level.maptovote["map"][index] = "Cargo";
	 	level.maptovote["name"][index] = "mp_dockside";
	    level.maptovote["image"][index] = "loadscreen_mp_dockside";
		break;
		case 2:
		level.maptovote["map"][index] = "Carrier";
	 	level.maptovote["name"][index] = "mp_carrier";
	    level.maptovote["image"][index] = "loadscreen_mp_carrier";
		break;
		case 3:
		level.maptovote["map"][index] = "Drone";
	 	level.maptovote["name"][index] = "mp_drone";
	    level.maptovote["image"][index] = "loadscreen_mp_drone";
		break;
		case 4:
		level.maptovote["map"][index] = "Express";
	 	level.maptovote["name"][index] = "mp_express";
	    level.maptovote["image"][index] = "loadscreen_mp_express";
		break;
		case 5:
		level.maptovote["map"][index] = "Hijacked";
	 	level.maptovote["name"][index] = "mp_hijacked";
	    level.maptovote["image"][index] = "loadscreen_mp_hijacked";
		break;
		case 6:
		level.maptovote["map"][index] = "Meltdown";
	 	level.maptovote["name"][index] = "mp_meltdown";
	    level.maptovote["image"][index] = "loadscreen_mp_meltdown";
		case 7:
		level.maptovote["map"][index] = "Overflow";
	 	level.maptovote["name"][index] = "mp_overflow";
	    level.maptovote["image"][index] = "loadscreen_mp_overflow";
		break;
		case 8:
		level.maptovote["map"][index] = "Plaza";
	 	level.maptovote["name"][index] = "mp_nightclub";
	    level.maptovote["image"][index] = "loadscreen_mp_nightclub";
		break;
		case 9:
		level.maptovote["map"][index] = "Raid";
	 	level.maptovote["name"][index] = "mp_raid";
	    level.maptovote["image"][index] = "loadscreen_mp_raid";
		break;
		case 10:
		level.maptovote["map"][index] = "Slums";
	 	level.maptovote["name"][index] = "mp_slums";
	    level.maptovote["image"][index] = "loadscreen_mp_slums";
		break;
		case 11:
		level.maptovote["map"][index] = "Standoff";
	 	level.maptovote["name"][index] = "mp_village";
	    level.maptovote["image"][index] = "loadscreen_mp_village";
		break;
		case 12:
		level.maptovote["map"][index] = "Turbine";
	 	level.maptovote["name"][index] = "mp_turbine";
	    level.maptovote["image"][index] = "loadscreen_mp_turbine";
		break;
		case 13:
		level.maptovote["map"][index] = "Yemen";
	 	level.maptovote["name"][index] = "mp_socotra";
	    level.maptovote["image"][index] = "loadscreen_mp_socotra";
		break;
		//Bouns MAP
		case 14:
		level.maptovote["map"][index] = "Nuketown 2025";
	 	level.maptovote["name"][index] = "mp_nuketown_2020";
	    level.maptovote["image"][index] = "loadscreen_mp_nuketown_2020";
		break;
		//DLC MAP 1 Revolution
		case 15:
		level.maptovote["map"][index] = "Downhill";
	 	level.maptovote["name"][index] = "mp_downhill";
	    level.maptovote["image"][index] = "loadscreen_mp_downhill";
		break;
		case 16:
		level.maptovote["map"][index] = "Mirage";
	 	level.maptovote["name"][index] = "mp_mirage";
	    level.maptovote["image"][index] = "loadscreen_mp_mirage";
		break;
		case 17:
		level.maptovote["map"][index] = "Hydro";
	 	level.maptovote["name"][index] = "mp_hydro";
	    level.maptovote["image"][index] = "loadscreen_mp_hydro";
		break;
		case 18:
		level.maptovote["map"][index] = "Grind";
	 	level.maptovote["name"][index] = "mp_skate";
	    level.maptovote["image"][index] = "loadscreen_mp_skate";
		break;
		//DLC MAP 2 Uprising
		case 19:
		level.maptovote["map"][index] = "Encore";
	 	level.maptovote["name"][index] = "mp_concert";
	    level.maptovote["image"][index] = "loadscreen_mp_concert";
		break;
		case 20:
		level.maptovote["map"][index] = "Magma";
	 	level.maptovote["name"][index] = "mp_magma";
	    level.maptovote["image"][index] = "loadscreen_mp_magma";
		break;
		case 21:
		level.maptovote["map"][index] = "Vertigo";
	 	level.maptovote["name"][index] = "mp_vertigo";
	    level.maptovote["image"][index] = "loadscreen_mp_vertigo";
		break;
	    case 22:
		level.maptovote["map"][index] = "Studio";
	 	level.maptovote["name"][index] = "mp_studio";
	    level.maptovote["image"][index] = "loadscreen_mp_studio";
		break;
		//DLC MAP 3 Vengeance
		case 23:
		level.maptovote["map"][index] = "Uplink";
	 	level.maptovote["name"][index] = "mp_uplink";
	    level.maptovote["image"][index] = "loadscreen_mp_uplink";
		break;
		case 24:
		level.maptovote["map"][index] = "Detour";
	 	level.maptovote["name"][index] = "mp_bridge";
	    level.maptovote["image"][index] = "loadscreen_mp_bridge";
		break;
		case 25:
		level.maptovote["map"][index] = "Cove";
	 	level.maptovote["name"][index] = "mp_castaway";
	    level.maptovote["image"][index] = "loadscreen_mp_castaway";
		break;
		case 26:
		level.maptovote["map"][index] = "Rush";
	 	level.maptovote["name"][index] = "mp_paintball";
	    level.maptovote["image"][index] = "loadscreen_mp_paintball";
		break;
		//DLLC MAP 4 Apocalypse 
		case 27:
		level.maptovote["map"][index] = "Dig";
	 	level.maptovote["name"][index] = "mp_dig";
	    level.maptovote["image"][index] = "loadscreen_mp_dig";
		break;
		case 28:
		level.maptovote["map"][index] = "Frost";
	 	level.maptovote["name"][index] = "mp_frostbite";
	    level.maptovote["image"][index] = "loadscreen_mp_frostbite";
		break;
		case 29:
		level.maptovote["map"][index] = "Pod";
	 	level.maptovote["name"][index] = "mp_pod";
	    level.maptovote["image"][index] = "loadscreen_mp_pod";
		break;
		case 30:
		level.maptovote["map"][index] = "Takeoff";
	 	level.maptovote["name"][index] = "mp_takeoff";
	    level.maptovote["image"][index] = "loadscreen_mp_takeoff";
		break;
		/*case def:
		level.maptovote["map"][index] = "";
	 	level.maptovote["name"][index] = "mp_";
	    level.maptovote["image"][index] = "loadscreen_mp_";
		break;*/
	}
}

modedata( m, index ){
	switch( m ){
		//Base MAP
		case 0:
		level.maptovote["mode"][index] = "tdm";
		level.maptovote["game"][index] = "tdm";
		level.maptovote["modo"][index] = "Duelo por Equipos";
		break;
		case 1:
		level.maptovote["mode"][index] = "dm";
		level.maptovote["game"][index] = "dm";
		level.maptovote["modo"][index] = "Contra Todos";
		break;
		case 2:
		level.maptovote["mode"][index] = "gun";
		level.maptovote["game"][index] = "gun";
		level.maptovote["modo"][index] = "Juego de Armas";
		break;
		case 3:
		level.maptovote["mode"][index] = "shrp";
		level.maptovote["game"][index] = "shrp";
		level.maptovote["modo"][index] = "Francotirador";
		break;
		case 4:
		level.maptovote["mode"][index] = "dm";
		level.maptovote["game"][index] = "snipdm";
		level.maptovote["modo"][index] = "Sniper Contra Todos";
		break;
		case 5:
		level.maptovote["mode"][index] = "tdm";
		level.maptovote["game"][index] = "sniptdm";
		level.maptovote["modo"][index] = "Sniper por Equipos";
		break;
		case 6:
		level.maptovote["mode"][index] = "tdm";
		level.maptovote["game"][index] = "sniptdm";
		level.maptovote["modo"][index] = "Sniper por Equipos";
		break;
		case 7:
		level.maptovote["mode"][index] = "oic";
		level.maptovote["game"][index] = "oic";
		level.maptovote["modo"][index] = "Una en la Recamara";
		break;
		case 8:
		level.maptovote["mode"][index] = "sas";
		level.maptovote["game"][index] = "sas";
		level.maptovote["modo"][index] = "Rebota, Rebota";
		break;
		case 9:
		level.maptovote["mode"][index] = "koth";
		level.maptovote["game"][index] = "koth";
		level.maptovote["modo"][index] = "Punto Caliente";
		break;
		case 10:
		level.maptovote["mode"][index] = "hq";
		level.maptovote["game"][index] = "hq";
		level.maptovote["modo"][index] = "Cuarteles";
		break;
		case 11:
		level.maptovote["mode"][index] = "sd";
		level.maptovote["game"][index] = "sd";
		level.maptovote["modo"][index] = "Buscar y Destruir";
		break;
		case 12:
		level.maptovote["mode"][index] = "dem";
		level.maptovote["game"][index] = "dem";
		level.maptovote["modo"][index] = "Demolicion";
		break;
		case 13:
		level.maptovote["mode"][index] = "dom";
		level.maptovote["game"][index] = "dom";
		level.maptovote["modo"][index] = "Dominio";
		break;
		case 14:
		level.maptovote["mode"][index] = "conf";
		level.maptovote["game"][index] = "conf";
		level.maptovote["modo"][index] = "Baja Confirmada";
		break;
		case 15:
		level.maptovote["mode"][index] = "ctf";
		level.maptovote["game"][index] = "ctf";
		level.maptovote["modo"][index] = "Tomar la Bandera";
		break;
		case 16:
		level.maptovote["mode"][index] = "oneflag";
		level.maptovote["game"][index] = "oneflag";
		level.maptovote["modo"][index] = "TLB Una Bandera";
		break;
		
		
	wait 0.01;
	}
}

AnimatedVoteAndMapsPart2()
{
	self.textMAP4 = self createFontString("objective", 1.4);
	self.textMAP4 setPoint("LEFT", "LEFT", 1156, -133);
	self.textMAP5 = self createFontString("objective", 1.4);
	self.textMAP5 setPoint("LEFT", "LEFT", 1156, 26);
	self.textMAP6 = self createFontString("objective", 1.4);
	self.textMAP6 setPoint("LEFT", "LEFT", 1156, 185);
	
	self TextMapsPart2();
	wait 0.1;
	self.map4 = self drawshader( level.maptovote["image"][3], 600, -189, 170, 96, ( 1, 1, 1 ), 100, 0 );
	self.map4 setPoint("RIGHT", "RIGHT", 600, -189);
	self.map4 fadeovertime( 0.3 );
	self.map4.alpha = 0.65;
	self.map5 = self drawshader( level.maptovote["image"][4], 600, -30, 170, 96, ( 1, 1, 1 ), 100, 0 );
	self.map5 setPoint("RIGHT", "RIGHT", 600, -30);
	self.map5 fadeovertime( 0.3 );
	self.map5.alpha = 0.65;
	self.map6 = self drawshader( level.maptovote["image"][5], 600, 129, 170, 96, ( 1, 1, 1 ), 100, 0 );
	self.map6 setPoint("RIGHT", "RIGHT", 600, 129);
	self.map6 fadeovertime( 0.3 );
	self.map6.alpha = 0.65;
	wait 0.1;
	self.box4 = self createRectangle("RIGHT", "RIGHT", 602.5, -163, 174, 152, (0, 1, 1), "white", -1, .7);
	self.box5 = self createRectangle("RIGHT", "RIGHT", 602.5, -4, 174, 152, (0, 1, 1), "white", -1, .7);
	self.box6 = self createRectangle("RIGHT", "RIGHT", 602.5, 155, 174, 152, (0, 1, 1), "white", -1, .7);
	wait 0.1;
	self.textMAP4 affectElement("x", 1.8, 616);
	self.textMAP5 affectElement("x", 1.8, 616);
	self.textMAP6 affectElement("x", 1.8, 616);
	
	self.map4 affectElement("x", 1.8, 60);
	self.map5 affectElement("x", 1.8, 60);
	self.map6 affectElement("x", 1.8, 60);
	
	self.box4 affectElement("x", 1.8, 62);
	self.box5 affectElement("x", 1.8, 62);
	self.box6 affectElement("x", 1.8, 62);
}

TextMapsPart2()
{
	self.textMAP4 SetElementText( "^7Mapa: ^5"+ level.maptovote["map"][3] + " \n^7Modo: ^5" + level.maptovote["modo"][3] + " \n^7Votos: [^5 " + level.maptovote["vote"][3] + " ^7]");
	self.textMAP5 SetElementText( "^7Mapa: ^5"+ level.maptovote["map"][4] + " \n^7Modo: ^5" + level.maptovote["modo"][4] + " \n^7Votos: [^5 " + level.maptovote["vote"][4] + " ^7]");
	self.textMAP6 SetElementText( "^7Mapa: ^5"+ level.maptovote["map"][5] + " \n^7Modo: ^5" + level.maptovote["modo"][5] + " \n^7Votos: [^5 " + level.maptovote["vote"][5] + " ^7]");
}

gameended(){
    vote0 = level.maptovote["vote"][0];vote1 = level.maptovote["vote"][1];vote2 = level.maptovote["vote"][2];vote3 = level.maptovote["vote"][3];vote4 = level.maptovote["vote"][4];vote5 = level.maptovote["vote"][5];
	
	if(vote0 > vote1 && vote0 > vote2 && vote0 > vote3 && vote0 > vote4 && vote0 > vote5){
	    setmap(0);
	}else if(vote1 > vote0 && vote1 > vote2 && vote1 > vote3 && vote1 > vote4 && vote1 > vote5){
		setmap(1);
	}else if(vote2 > vote0 && vote2 > vote1 && vote2 > vote3 && vote2 > vote4 && vote2 > vote5){
		setmap(2);
	}else if(vote3 > vote0 && vote3 > vote1 && vote3 > vote2 && vote3 > vote4 && vote3 > vote5){
		setmap(3);
    }else if(vote4 > vote0 && vote4 > vote1 && vote4 > vote2 && vote4 > vote3 && vote4 > vote5){
		setmap(4);
    }else if(vote5 > vote0 && vote5 > vote1 && vote5 > vote2 && vote5 > vote3 && vote5 > vote4){
		setmap(5);	
		
	}else if(vote0 == vote1 && vote2 < vote0 && vote3 < vote0 && vote4 < vote0 && vote5 < vote0){
		setmap(randomintrange(0,2));
	}else if(vote0 == vote2 && vote1 < vote0 && vote3 < vote0 && vote4 < vote0 && vote5 < vote0){
	    votesmap = strTok("0,2", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
	}else if(vote0 == vote3 && vote1 < vote0 && vote2 < vote0 && vote4 < vote0 && vote5 < vote0){
		votesmap = strTok("0,3", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
    }else if(vote0 == vote4 && vote1 < vote0 && vote2 < vote0 && vote3 < vote0 && vote5 < vote0){
		votesmap = strTok("0,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);		
	}else if(vote0 == vote5 && vote1 < vote0 && vote2 < vote0 && vote3 < vote0 && vote4 < vote0){
		votesmap = strTok("0,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);	
		
	}else if(vote1 == vote2 && vote0 < vote1 && vote3 < vote1 && vote4 < vote1 && vote5 < vote1){
		setmap(randomintrange(1,3));	
	}else if(vote1 == vote3 && vote0 < vote1 && vote2 < vote1 && vote4 < vote1 && vote5 < vote1){
		votesmap = strTok("1,3", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
    }else if(vote1 == vote4 && vote0 < vote1 && vote2 < vote1 && vote3 < vote1 && vote5 < vote1){
		votesmap = strTok("1,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);			
	}else if(vote1 == vote5 && vote0 < vote1 && vote2 < vote1 && vote3 < vote1 && vote4 < vote1){
		votesmap = strTok("1,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);	
	
	}else if(vote2 == vote3 && vote0 < vote2 && vote1 < vote2 && vote4 < vote2 && vote5 < vote2){
		setmap(randomintrange(2,4));
    }else if(vote2 == vote4 && vote0 < vote2 && vote1 < vote2 && vote3 < vote2 && vote5 < vote2){
		votesmap = strTok("2,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);			
	}else if(vote2 == vote5 && vote0 < vote2 && vote1 < vote2 && vote3 < vote2 && vote4 < vote2){
		votesmap = strTok("2,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
		else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);	
    
    }else if(vote3 == vote4 && vote0 < vote3 && vote1 < vote3 && vote2 < vote3 && vote5 < vote3){
		setmap(randomintrange(3,5));		
	}else if(vote3 == vote5 && vote0 < vote3 && vote1 < vote3 && vote2 < vote3 && vote4 < vote3){
		votesmap = strTok("3,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
		else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);	
		
	}else if(vote4 == vote5 && vote0 < vote4 && vote1 < vote4 && vote2 < vote4 && vote3 < vote4){
		setmap(randomintrange(4,6));	
		
	}else if(vote0 == vote1 && vote2 == vote0 && vote3 < vote0 && vote4 < vote0 && vote5 < vote0){
		setmap(randomintrange(0,3));
	}else if(vote0 == vote1 && vote2 < vote0 && vote3 == vote0 && vote4 < vote0 && vote5 < vote0){
		votesmap = strTok("0,1,3", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);			
	}else if(vote0 == vote1 && vote2 < vote0 && vote3 < vote0 && vote4 == vote0 && vote5 < vote0){
		votesmap = strTok("0,1,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
    }else if(vote0 == vote1 && vote2 < vote0 && vote3 < vote0 && vote4 < vote0 && vote5 == vote0){
		votesmap = strTok("0,1,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);	
			
	}else if(vote0 == vote2 && vote1 < vote0 && vote3 == vote0 && vote4 < vote0 && vote5 < vote0){
		votesmap = strTok("0,2,3", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
	}else if(vote0 == vote2 && vote1 < vote0 && vote3 < vote0 && vote4 == vote0 && vote5 < vote0){
		votesmap = strTok("0,2,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
    }else if(vote0 == vote2 && vote1 < vote0 && vote3 < vote0 && vote4 < vote0 && vote5 == vote0){
		votesmap = strTok("0,2,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);	
		
	}else if(vote0 == vote3 && vote1 < vote0 && vote2 < vote0 && vote4 == vote0 && vote5 < vote0){
		votesmap = strTok("0,3,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
        else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);
	}else if(vote0 == vote3 && vote1 < vote0 && vote2 < vote0 && vote4 < vote0 && vote5 == vote0){
       	votesmap = strTok("0,3,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	
    }else if(vote0 == vote4 && vote1 < vote0 && vote2 < vote0 && vote3 < vote0 && vote5 == vote0){
		votesmap = strTok("0,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);	
    
	
	}else if(vote0 < vote1 && vote2 == vote1 && vote3 == vote1 && vote4 < vote1 && vote5 < vote1){
		setmap(randomintrange(1,4));
	}else if(vote0 < vote1 && vote2 == vote1 && vote3 < vote1 && vote4 == vote1 && vote5 < vote1){
		votesmap = strTok("1,2,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);			
	}else if(vote0 < vote1 && vote2 == vote1 && vote3 < vote1 && vote4 < vote1 && vote5 == vote1){
		votesmap = strTok("1,2,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
    }else if(vote0 < vote1 && vote2 < vote1 && vote3 == vote1 && vote4 == vote1 && vote5 < vote1){
		votesmap = strTok("1,3,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
        else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);			
	}else if(vote0 < vote1 && vote2 < vote1 && vote3 == vote1 && vote4 < vote1 && vote5 == vote1){
		votesmap = strTok("1,3,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);				
    }else if(vote0 < vote1 && vote2 < vote1 && vote3 < vote1 && vote4 == vote1 && vote5 == vote1){
		votesmap = strTok("1,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);			
			
			
	}else if(vote0 < vote2 && vote1 < vote2 && vote3 == vote2 && vote4 == vote2 && vote5 < vote2){
		setmap(randomintrange(2,5));
	}else if(vote0 < vote2 && vote1 < vote2 && vote3 == vote2 && vote4 < vote2 && vote5 == vote2){
		votesmap = strTok("2,3,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);			
	}else if(vote0 < vote2 && vote1 < vote2 && vote3 < vote2 && vote4 == vote2 && vote5 == vote2){
		votesmap = strTok("2,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	 
	}else if(vote0 < vote3 && vote1 < vote3 && vote2 < vote3 && vote4 == vote3 && vote5 == vote3){
		setmap(randomintrange(3,6));
		
	
	
    }else if(vote0 == vote1 && vote0 == vote2 && vote0 == vote3 && vote0 > vote4 && vote0 > vote5){
		setmap(randomintrange(0,4));		
    }else if(vote0 == vote1 && vote0 == vote2 && vote0 > vote3 && vote0 > vote4 && vote0 == vote5){
		votesmap = strTok("0,1,2,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 == vote1 && vote0 > vote2 && vote0 > vote3 && vote0 == vote4 && vote0 == vote5){
		votesmap = strTok("0,1,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 > vote1 && vote0 > vote2 && vote0 == vote3 && vote0 == vote4 && vote0 == vote5){
		votesmap = strTok("0,3,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote2 > vote0 && vote2 > vote1 && vote2 == vote3 && vote2 == vote4 && vote2 == vote5){
		votesmap = strTok("2,3,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
    }else if(vote1 > vote0 && vote1 == vote2 && vote1 == vote3 && vote1 == vote4 && vote1 > vote5){
		votesmap = strTok("1,2,3,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
			
			
			
	}else if(vote0 > vote1 && vote0 == vote2 && vote0 == vote3 && vote0 > vote4 && vote0 == vote5){
		votesmap = strTok("0,2,3,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 == vote1 && vote0 > vote2 && vote0 == vote3 && vote0 > vote4 && vote0 == vote5){
		votesmap = strTok("0,1,3,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote1 > vote0 && vote1 == vote2 && vote1 == vote3 && vote1 > vote4 && vote1 == vote5){
		votesmap = strTok("1,2,3,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 > vote1 && vote0 == vote2 && vote0 == vote3 && vote0 == vote4 && vote0 > vote5){
		votesmap = strTok("0,2,3,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
        else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);
	}else if(vote1 > vote0 && vote1 > vote2 && vote1 == vote3 && vote1 == vote4 && vote1 == vote5){
		votesmap = strTok("1,3,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 > vote1 && vote0 == vote2 && vote0 > vote3 && vote0 == vote4 && vote0 == vote5){
		votesmap = strTok("0,2,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 == vote1 && vote0 == vote2 && vote0 > vote3 && vote0 == vote4 && vote0 > vote5){
		votesmap = strTok("0,1,2,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
	}else if(vote1 > vote0 && vote1 == vote2 && vote1 > vote3 && vote1 == vote4 && vote1 == vote5){
		votesmap = strTok("1,2,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 == vote1 && vote0 > vote2 && vote0 == vote3 && vote0 == vote4 && vote0 > vote5){
		votesmap = strTok("0,1,3,4", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
        else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);

	
	
	
			
	}else if(vote0 == vote1 && vote0 == vote2 && vote0 == vote3 && vote0 == vote4 && vote0 > vote5){
		setmap(randomintrange(0,5));		
    }else if(vote0 == vote1 && vote0 == vote2 && vote0 == vote3 && vote0 > vote4 && vote0 == vote5){
		votesmap = strTok("0,1,2,3,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
		else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 == vote1 && vote0 == vote2 && vote0 > vote3 && vote0 == vote4 && vote0 == vote5){
		votesmap = strTok("0,1,2,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 == vote1 && vote0 > vote2 && vote0 == vote3 && vote0 == vote4 && vote0 == vote5){
		votesmap = strTok("0,1,3,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "1")
		    setmap(1);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
	}else if(vote0 > vote1 && vote0 == vote2 && vote0 == vote3 && vote0 == vote4 && vote0 == vote5){
		votesmap = strTok("0,2,3,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "0")
		    setmap(0);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);
    }else if(vote1 > vote0 && vote1 == vote2 && vote1 == vote3 && vote1 == vote4 && vote1 == vote5){
		votesmap = strTok("1,2,3,4,5", ",");
        votemapselectedrand = RandomInt(votesmap);
		if(votesmap[votemapselectedrand] == "1")
		    setmap(1);
		else if(votesmap[votemapselectedrand] == "2")
		    setmap(2);	
        else if(votesmap[votemapselectedrand] == "3")
		    setmap(3);
		else if(votesmap[votemapselectedrand] == "4")
		    setmap(4);	
        else if(votesmap[votemapselectedrand] == "5")
		    setmap(5);

	
	}else if(vote0 == vote1 && vote0 == vote2 && vote0 == vote3 && vote0 == vote4 && vote0 == vote5){
		setmap(randomintrange(0,6));		
	}
	else
	    setmap(randomintrange(0,6));
}

setmap( index )
{
	foreach(player in level.players)
    	player thread maps/mp/gametypes/_killcam::closemenumapmenu(index);
	
	thread maps/mp/gametypes/_killcam::ChangeMapMode(level.maptovote["name"][index], level.maptovote["game"][index]);
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