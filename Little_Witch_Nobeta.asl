state ("LittleWitchNobeta") 
{
	//Use ASL Var Viewer to show in LiveSplit
	float PosX : "UnityPlayer.dll", 0x1AA3FE0, 0x48, 0x0, 0x60, 0x0, 0x1E8, 0x130, 0x10;
	float PosY : "UnityPlayer.dll", 0x1AA3FE0, 0x48, 0x0, 0x60, 0x0, 0x1E8, 0x130, 0x14;
	float PosZ : "UnityPlayer.dll", 0x1AA3FE0, 0x48, 0x0, 0x60, 0x0, 0x1E8, 0x130, 0x18;
}

startup
{
	//Add Settings
	settings.Add("Split");
	settings.Add("Boss", true, "Boss Kill Split", "Split");
	settings.Add("Mini Boss", false, "Mini Boss Kill Split", "Split");
	settings.Add("sBoss", false, "Start Boss Fight Split", "Split");
	settings.Add("Abyss Challenges", false, "Abyss Challenges", "Split");
	settings.Add("Cutscene", false, "Cutscene", "Split");
	settings.Add("Other", false);

	settings.Add("Armor", true, "Mysterious Armor", "Boss");
	settings.Add("Secret", false, "Enraged Armor", "Boss");
	settings.Add("Tania", true, "Tania", "Boss");
	settings.Add("Monica1", false, "Monica Phase 1", "Boss");
	settings.Add("Monica2", true, "Monica Phase 2", "Boss");
	settings.Add("Vanessa1", true, "Vanessa 1", "Boss");
	settings.Add("Vanessa2", true, "Vanessa 2", "Boss");
	settings.Add("Nonota", true, "Nonota", "Boss");

	settings.Add("Knight", false, "Knight", "Mini Boss");
	settings.Add("Seal1", false, "Seal Phase 1", "Mini Boss");
	settings.Add("Seal2", false, "Seal Pahse 2", "Mini Boss");

	settings.Add("sArmor", false, "Mysterious Armor", "sBoss");
	settings.Add("sSecret", false, "Enraged Armor", "sBoss");
	settings.Add("sTania", false, "Tania", "sBoss");
	settings.Add("sMonica1", false, "Monica Phase 1", "sBoss");
	settings.Add("sMonica2", false, "Monica Phase 2", "sBoss");
	settings.Add("sVanessa1", false, "Vanessa 1", "sBoss");
	settings.Add("sVanessa2", false, "Vanessa 2", "sBoss");
	settings.Add("sNonota", false, "Nonota", "sBoss");

	settings.Add("chalL", false, "Abyss Challenges Left", "Abyss Challenges");
	settings.Add("chalR", false, "Abyss Challenges Right", "Abyss Challenges");
	settings.Add("chalC", false, "Abyss Challenges Center", "Abyss Challenges");

	settings.Add("dark tunnel", false, "End Dark Tunnel", "Cutscene");

	settings.Add("onSystemMenu", false, "Timer Pause in Pause Menu", "Other");
	settings.Add("resetDeath", false, "Death Reset", "Other");
	settings.Add("splitEverytime", false, "Split Every Boss Kill", "Other");

	settings.SetToolTip("Boss","Split When The Boss is Death.");
	settings.SetToolTip("Mini Boss","Split When The Mini Boss is Death.");
	settings.SetToolTip("sBoss","Split When Start Boss Fight.");
	settings.SetToolTip("Abyss Challenges","Split When Destory The Crystal.");
	settings.SetToolTip("dark tunnel","Split When Skip The Last Cutscene.");
	settings.SetToolTip("onSystemMenu","Timer pause while pasue menu is open.\n\nRuns using this feature will get the time added back on before validation.");
	settings.SetToolTip("resetDeath","Reset The Timer when Nobeta is Death.");

	//DebugOutput
	vars.Dbg = (Action<dynamic>) ((text) => print("[LWN Auto Splitter] : " + text));

	vars.TimerModel = new TimerModel { CurrentState = timer };
}

init
{
	//Declared
	vars.Boss = new int[9];
	vars.sBoss = new int[9];
	vars.mBoss = new int[3];
	IntPtr ptr = IntPtr.Zero;
	var module = game.ModulesWow64Safe().First(m => m.ModuleName == "GameAssembly.dll");
	var scanner = new SignatureScanner(game, module.BaseAddress, module.ModuleMemorySize);
	var target = new SigScanTarget(3, "48 8D 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? C6 05 ?? ?? ?? ?? 01 48 8B 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 D2 48 8B C8 48 8B D8 E8 ?? ?? ?? ?? 48 85 FF 0F 84 ?? ?? ?? ?? 48 85 DB 74 ?? 8B 4F ??")
	{OnFound = (p, s, pt) => p.ReadPointer(pt + 0x4 + p.ReadValue<int>(pt)) + 0xB8};
	
	//Scan Baseaddress
	ptr = scanner.Scan(target);
	vars.Dbg("'ptr' at " + ptr.ToString("X"));
	
	//ReadMem
	if(ptr != IntPtr.Zero)
	{
		vars.watchers = new MemoryWatcherList
		{
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x20, 0x28, 0x10, 0x280)) { Name = "assetCached" },
			new MemoryWatcher<bool>(new DeepPointer(ptr, 0x0, 0x40, 0x30, 0x28, 0xA0)) { Name = "progressLabel" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xE8)) { Name = "StageID" },
			new MemoryWatcher<bool>(new DeepPointer(ptr, 0x78, 0xD0)) { Name = "onSystemMenu" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0x58)) { Name = "stageState" }, //state == 0 (normal = 0, death = 1, cutscene = 2, pray = 3)
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0x88)) { Name = "bossDialogue" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x3F)) { Name = "monicabear" },
			new MemoryWatcher<bool>(new DeepPointer(ptr, 0x78, 0xA0, 0x18, 0x20, 0x11)) { Name = "isDead" },
			new StringWatcher(new DeepPointer(ptr, 0x90, 0x10, 0x14), 128) { Name = "sceneName" }
			//new MemoryWatcher<byte>(new DeepPointer(ptr, 0x50, 0x28 0x10 0x70)) { Name = "playerState" }, //30,31 sit next to statue //didnt used
		};
		vars.boss = new MemoryWatcherList
		{
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0x138, 0x10, 0x70, 0x166)) { Name = "Armor" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0x218, 0x10, 0x70, 0x166)) { Name = "Secret" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0x1C0, 0x10, 0x70, 0x166)) { Name = "Tania" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0x140, 0x10, 0x70, 0x166)) { Name = "Monica1" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0xF8, 0x10, 0x70, 0x166)) { Name = "Monica2" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0x78, 0x10, 0x70, 0x166)) { Name = "Vanessa1" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0x220, 0x10, 0x70, 0x166)) { Name = "Vanessa2" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0xA8, 0x10, 0x70, 0x166)) { Name = "Nonota" }
		};
		vars.miniboss = new MemoryWatcherList
		{
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0x288, 0x10, 0x70, 0x166)) { Name = "Knight" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0x218, 0x10, 0x70, 0x166)) { Name = "Seal1" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xA8, 0x10, 0x10, 0x270, 0x10, 0x70, 0x166)) { Name = "Seal2" }
		};
		vars.chal = new MemoryWatcherList
		{
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x6E)) { Name = "chalL" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x6F)) { Name = "chalR" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x70)) { Name = "chalC" }
		};
		vars.cutscene = new MemoryWatcherList
		{
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x4C)) { Name = "dark tunnel" }
		};
	}

	//Test
	vars.watchers.UpdateAll(game);
	//vars.Dbg(vars.watchers["sceneName"].Current);

	//Address (Show on Game Version)
	version = ptr.ToString("X");
	
	vars.Dbg("ASL is Starting");
}

update
{
	//Separate for reduce CPU usage (I hope so)
	if(game.ProcessName == "LittleWitchNobeta")
	{
		vars.watchers.UpdateAll(game);
		if(settings["Boss"]) vars.boss.UpdateAll(game);
		if(settings["Mini Boss"]) vars.miniboss.UpdateAll(game);
		if(settings["Cutscene"]) vars.cutscene.UpdateAll(game);
		if(settings["Abyss Challenges"]) vars.chal.UpdateAll(game);
	}

	if(settings.ResetEnabled)
	{
		if(timer.CurrentPhase != TimerPhase.NotRunning)
		{
			if(vars.watchers["sceneName"].Changed && (vars.watchers["sceneName"].Current == "Title"))
			{
				if(vars.boss["Nonota"].Current == 1 && vars.watchers["StageID"].Current >= 7)
				{
					vars.Dbg("Reset");
					vars.TimerModel.Reset();
				}
				else
				{
					vars.Dbg("Reset");
					vars.TimerModel.Reset(false);
				}
			}
			
			//Death :skull:
			if(vars.watchers["isDead"].Changed && vars.watchers["isDead"].Current && settings["resetDeath"])
			{
				vars.Dbg("Death Reset");
				vars.TimerModel.Reset(false);
			}
		}
	}
}

start
{
	if(vars.watchers["sceneName"].Changed && vars.watchers["sceneName"].Current == "Act01_02")
	{
		vars.Dbg("Start");
		return true;
	}
}

split
{
	//Boss
	if(settings["Boss"])
	{
		if(vars.watchers["StageID"].Current == 2 && vars.boss["Armor"].Current == vars.boss["Armor"].Old + 1 && settings["Armor"] && vars.Boss[1] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[1] = 1;
			return true;
		}
		if(vars.watchers["StageID"].Current == 2 && vars.boss["Secret"].Current == vars.boss["Secret"].Old + 1 && settings["Secret"] && vars.Boss[7] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[7] = 1;
			return true;
		}
		if(vars.watchers["StageID"].Current == 3 && vars.boss["Tania"].Current == vars.boss["Tania"].Old + 1 && settings["Tania"] && vars.Boss[2] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[2] = 1;
			return true;
		}
		if(vars.watchers["StageID"].Current == 4 && vars.boss["Monica1"].Current == vars.boss["Monica1"].Old + 1 && settings["Monica1"] && vars.Boss[3] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[3] = 1;
			return true;
		}
		if(vars.watchers["StageID"].Current == 4 && vars.boss["Monica2"].Current == vars.boss["Monica2"].Old + 1 && settings["Monica2"] && vars.Boss[8] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[8] = 1;
			return true;
		}
		if(vars.watchers["StageID"].Current == 5 && vars.boss["Vanessa1"].Current == vars.boss["Vanessa1"].Old + 1 && settings["Vanessa1"] && vars.Boss[4] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[4] = 1;
			return true;
		}
		if(vars.watchers["StageID"].Current == 6 && vars.boss["Vanessa2"].Current == vars.boss["Vanessa2"].Old + 1 && settings["Vanessa2"] && vars.Boss[5] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[5] = 1;
			return true;
		}
		if(vars.watchers["StageID"].Current == 7 && vars.boss["Nonota"].Current == vars.boss["Nonota"].Old + 1 && settings["Nonota"] && vars.Boss[6] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[6] = 1;
			return true;
		}
	}

	//Mini Boss
	if(settings["Mini Boss"])
	{
		if(vars.watchers["StageID"].Current == 5 && vars.miniboss["Knight"].Current == vars.miniboss["Knight"].Old + 1 && settings["Knight"] && vars.mBoss[0] == 0)
		{
			if(!settings["splitEverytime"]) vars.mBoss[0] = 1;
			return true;
		}
		if(vars.watchers["StageID"].Current == 6 && vars.miniboss["Seal1"].Current == vars.miniboss["Seal1"].Old + 1 && settings["Seal1"] && vars.mBoss[1] == 0)
		{
			if(!settings["splitEverytime"]) vars.mBoss[1] = 1;
			return true;
		}
		if(vars.watchers["StageID"].Current == 6 && vars.miniboss["Seal2"].Current == vars.miniboss["Seal2"].Old + 1 && settings["Seal2"] && vars.mBoss[2] == 0)
		{
			if(!settings["splitEverytime"]) vars.mBoss[2] = 1;
			return true;
		}
	}

	//Start Boss
	if(settings["sBoss"])
	{
		if(vars.watchers["bossDialogue"].Current == 1 && vars.watchers["bossDialogue"].Changed && settings["sArmor"] && vars.sBoss[1] == 0)
		{
			vars.sBoss[1] = 1;
			return true;
		}
		if(vars.watchers["bossDialogue"].Current == 2 && vars.watchers["bossDialogue"].Changed && settings["sTania"] && vars.sBoss[2] == 0)
		{
			vars.sBoss[2] = 1;
			return true;
		}
		if(vars.watchers["bossDialogue"].Current == 4 && vars.watchers["bossDialogue"].Changed && settings["sSecret"] && vars.sBoss[4] == 0)
		{
			vars.sBoss[4] = 1;
			return true;
		}
		if(vars.watchers["bossDialogue"].Current == 5 && vars.watchers["bossDialogue"].Changed && settings["sSecret"] && vars.sBoss[5] == 0)
		{
			vars.sBoss[5] = 1;
			return true;
		}
		if(vars.watchers["bossDialogue"].Current == 6 && vars.watchers["bossDialogue"].Changed && settings["sSecret"] && vars.sBoss[6] == 0)
		{
			vars.sBoss[6] = 1;
			return true;
		}
		if(vars.watchers["bossDialogue"].Current == 7 && vars.watchers["bossDialogue"].Changed && settings["sSecret"] && vars.sBoss[7] == 0)
		{
			vars.sBoss[7] = 1;
			return true;
		}
		if(vars.watchers["bossDialogue"].Current == 3)
		{
			if(vars.watchers["bossDialogue"].Changed)
			{
				if(settings["sMonica1"] && (vars.watchers["monicabear"].Current == 0) && vars.sBoss[3] == 0)
				{
					vars.sBoss[3] = 1;
					return true;
				}
				if(settings["sMonica2"] && (vars.watchers["monicabear"].Current == 1) && vars.sBoss[8] == 0)
				{
					vars.sBoss[8] = 1;
					return true;
				}
			}
		}
	}

	//Abyss Challenges
	if(settings["Abyss Challenges"])
	{
		if(vars.watchers["StageID"].Current == 7)
		{
			if(vars.chal["chalL"].Current == vars.chal["chalL"].Old + 1 && settings["chalL"]) return true;
			if(vars.chal["chalR"].Current == vars.chal["chalR"].Old + 1 && settings["chalR"]) return true;
			if(vars.chal["chalC"].Current == vars.chal["chalC"].Old + 1 && settings["chalC"]) return true;
		}
	}

	//Cutscene dark tunnel
	if(settings["Cutscene"])
	{
		if(vars.cutscene["dark tunnel"].Current == vars.cutscene["dark tunnel"].Old + 1 && settings["dark tunnel"]) return true;
	}
}

isLoading
{
	//menu(true) && state == 0 (normal = 0, death = 1, cutscene = 2, pray = 3)
	if(settings["onSystemMenu"]) return ((vars.watchers["onSystemMenu"].Current && (vars.watchers["stageState"].Current == 0)) || (vars.watchers["assetCached"].Current == 255) || !vars.watchers["progressLabel"].Current);
	else return (vars.watchers["assetCached"].Current == 255);
}

reset
{
	return false;
}

//fix IGT ahead 0.01-0.04 after start
onStart
{
	timer.IsGameTimePaused = true;
	Array.Clear(vars.Boss, 0, vars.Boss.Length);
	Array.Clear(vars.sBoss, 0, vars.sBoss.Length);
	Array.Clear(vars.mBoss, 0, vars.mBoss.Length);
}

exit
{
	timer.IsGameTimePaused = true;
}