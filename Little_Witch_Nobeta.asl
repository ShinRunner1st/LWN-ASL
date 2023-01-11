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
	settings.Add("Boss");
	settings.Add("Mini Boss", false);
	settings.Add("Abyss Challenges", false);
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

	settings.Add("chalL", false, "Abyss Challenges Left", "Abyss Challenges");
	settings.Add("chalR", false, "Abyss Challenges Right", "Abyss Challenges");
	settings.Add("chalC", false, "Abyss Challenges Center", "Abyss Challenges");

	settings.Add("onSystemMenu", false, "PauseTimer on Pause Menu", "Other");

	//DebugOutput
	vars.Dbg = (Action<dynamic>) ((text) => print("[LWN Auto Splitter] : " + text));
}

init
{
	//Declared
	IntPtr ptr = IntPtr.Zero;
	var module = game.ModulesWow64Safe().First(m => m.ModuleName == "GameAssembly.dll");
	var scanner = new SignatureScanner(game, module.BaseAddress, module.ModuleMemorySize);
	var target = new SigScanTarget(3, "48 8D 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? C6 05 ?? ?? ?? ?? 01 48 8B 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 33 D2 48 8B C8 48 8B D8 E8 ?? ?? ?? ?? 48 85 FF 0F 84 ?? ?? ?? ?? 48 85 DB 74 ?? 8B 4F ??")
	{OnFound = (p, s, pt) => p.ReadPointer(pt + 0x4 + p.ReadValue<int>(pt)) + 0xB8};
	
	//Scan Baseaddress
	ptr = scanner.Scan(target);
	vars.Dbg("'ptr' at " + ptr.ToString("X"));
	
	//ReadMem
	vars.watchers = new MemoryWatcherList
	{
		new MemoryWatcher<byte>(new DeepPointer(ptr, 0x20, 0x28, 0x10, 0x280)) { Name = "assetCached" },
		new MemoryWatcher<bool>(new DeepPointer(ptr, 0x0, 0x40, 0x30, 0x28, 0xA0)) { Name = "progressLabel" },
		new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xE8)) { Name = "StageID" },
		new MemoryWatcher<bool>(new DeepPointer(ptr, 0x78, 0xD0)) { Name = "onSystemMenu" },
		new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0x58)) { Name = "stageState" },
		new StringWatcher(new DeepPointer(ptr, 0x90, 0x10, 0x14), 128) { Name = "sceneName" }
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

	//Test
	vars.watchers.UpdateAll(game);
	vars.Dbg(vars.watchers["sceneName"].Current);

	//Address (Show on Game Version)
	version = ptr.ToString("X");
}

update
{
	//Separate for reduce CPU (I hope so)
	vars.watchers.UpdateAll(game);
	if(settings["Boss"]) vars.boss.UpdateAll(game);
	if(settings["Mini Boss"]) vars.miniboss.UpdateAll(game);
	if(settings["Abyss Challenges"]) vars.chal.UpdateAll(game);
}

start
{
	if(vars.watchers["sceneName"].Current == "Act01_02") return true;
}

split
{
	//Boss
	if(settings["Boss"])
	{
		if(vars.watchers["StageID"].Current == 2 && vars.boss["Armor"].Current == vars.boss["Armor"].Old + 1 && settings["Armor"]) return true;
		if(vars.watchers["StageID"].Current == 2 && vars.boss["Secret"].Current == vars.boss["Secret"].Old + 1 && settings["Secret"]) return true;
		if(vars.watchers["StageID"].Current == 3 && vars.boss["Tania"].Current == vars.boss["Tania"].Old + 1 && settings["Tania"]) return true;
		if(vars.watchers["StageID"].Current == 4 && vars.boss["Monica1"].Current == vars.boss["Monica1"].Old + 1 && settings["Monica1"]) return true;
		if(vars.watchers["StageID"].Current == 4 && vars.boss["Monica2"].Current == vars.boss["Monica2"].Old + 1 && settings["Monica2"]) return true;
		if(vars.watchers["StageID"].Current == 5 && vars.boss["Vanessa1"].Current == vars.boss["Vanessa1"].Old + 1 && settings["Vanessa1"]) return true;
		if(vars.watchers["StageID"].Current == 6 && vars.boss["Vanessa2"].Current == vars.boss["Vanessa2"].Old + 1 && settings["Vanessa2"]) return true;
		if(vars.watchers["StageID"].Current == 7 && vars.boss["Nonota"].Current == vars.boss["Nonota"].Old + 1 && settings["Nonota"]) return true;
	}

	//Mini Boss
	if(settings["Mini Boss"])
	{
		if(vars.watchers["StageID"].Current == 5 && vars.miniboss["Knight"].Current == vars.miniboss["Knight"].Old + 1 && settings["Knight"]) return true;
		if(vars.watchers["StageID"].Current == 6 && vars.miniboss["Seal1"].Current == vars.miniboss["Seal1"].Old + 1 && settings["Seal1"]) return true;
		if(vars.watchers["StageID"].Current == 6 && vars.miniboss["Seal2"].Current == vars.miniboss["Seal2"].Old + 1 && settings["Seal2"]) return true;
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
}

exit
{
	timer.IsGameTimePaused = true;
}

reset
{
	return vars.watchers["sceneName"].Current == "Title";
}

isLoading
{
	if(settings["onSystemMenu"]) return (vars.watchers["onSystemMenu"].Current && (vars.watchers["stageState"].Current < 1)) || (vars.watchers["assetCached"].Current == 255) || !vars.watchers["progressLabel"].Current;
	else return (vars.watchers["assetCached"].Current == 255) || !vars.watchers["progressLabel"].Current;
}