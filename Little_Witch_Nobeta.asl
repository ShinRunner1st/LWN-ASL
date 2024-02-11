state ("LittleWitchNobeta") 
{
	//Use ASL Var Viewer to show in LiveSplit
	float PosX : "UnityPlayer.dll", 0x1AA3FE0, 0x48, 0x0, 0x60, 0x0, 0x1E8, 0x130, 0x10;
	float PosY : "UnityPlayer.dll", 0x1AA3FE0, 0x48, 0x0, 0x60, 0x0, 0x1E8, 0x130, 0x14;
	float PosZ : "UnityPlayer.dll", 0x1AA3FE0, 0x48, 0x0, 0x60, 0x0, 0x1E8, 0x130, 0x18;
	string10 Ver : "UnityPlayer.dll", 0x19EDDC0, 0x348;
}

startup
{
	//Add Settings
	settings.Add("Split");
	settings.Add("Boss", true, "Boss Kill Split", "Split");
	settings.Add("Mini Boss", false, "Mini Boss Kill Split", "Split");
	settings.Add("sBoss", false, "Start Boss Fight Split", "Split");
	settings.Add("sMini Boss", false, "Start Mini Boss Fight Split", "Split");
	settings.Add("Abyss Challenges", false, "Abyss Challenges", "Split");
	settings.Add("Cutscene", false, "Cutscene/Trigger", "Split");
	settings.Add("Magic", false, "Magic Level", "Split");
	settings.Add("Items", false, "Items", "Split");
	settings.Add("Chest", false, "Treasure Chest", "Split");
	settings.Add("Reset", true);
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

	settings.Add("sSeal1", false, "Seal Phase 1", "sMini Boss");
	settings.Add("sSeal2", false, "Seal Pahse 2", "sMini Boss");

	settings.Add("chalL", false, "Abyss Challenges Left", "Abyss Challenges");
	settings.Add("chalR", false, "Abyss Challenges Right", "Abyss Challenges");
	settings.Add("chalC", false, "Abyss Challenges Center", "Abyss Challenges");

	settings.Add("crystal 1", false, "Barrier Stone Trial", "Cutscene");
	settings.Add("saveCat", false, "Rescue Cat", "Cutscene");
	settings.Add("IceFire", false, "Ice deflect fire (Destory Barrier Stone)", "Cutscene");
	settings.Add("destory wood", false, "Wood Plank Trap (Destory Wood Plank)", "Cutscene");
	settings.Add("destory crystal with fire", false, "Fire Trial (Destory Barrier Stone)", "Cutscene");
	settings.Add("hatLost", false, "Hat Lost", "Cutscene");
	settings.Add("hatGet", false, "Hat Get", "Cutscene");
	settings.Add("destory orb", false, "Orb After Get hat (Destory Orb)", "Cutscene");
	settings.Add("destory 3 crytals", false, "Thunder Trial (Destory 3 Barrier Stone)", "Cutscene");
	settings.Add("dark tunnel", false, "End of Dark tunnel", "Cutscene");
	settings.Add("destory crystal open teleport", false, "Castle 4 Barrier Stone (Destory Barrier Stone)", "Cutscene");
	settings.Add("open door abyss", false, "Open Door Gate [Abyss - Room 2]", "Cutscene");

	settings.Add("Arcane Lv.2", false, "Arcane Lv.2", "Magic");
	settings.Add("Ice Lv.1", false, "Ice Lv.1", "Magic");
	settings.Add("Fire Lv.1", false, "Fire Lv.1", "Magic");
	settings.Add("Thunder Lv.1", false, "Thunder Lv.1", "Magic");
	settings.Add("Absorption Lv.1", false, "Absorption Lv.1", "Magic");
	settings.Add("Wind Lv.1", false, "Wind Lv.1", "Magic");

	settings.Add("anyItem", false, "Any Item", "Items");
	settings.Add("lastItem", false, "Last Item", "Items");

	settings.Add("resetSave", true, "Save split records when reset", "Reset");
	settings.Add("resetDeath", false, "Death reset", "Reset");
	settings.Add("resetTitle", true, "Title reset","Reset");
	settings.Add("resetEnd", true, "NewGame+ Click reset", "Reset");

	settings.Add("onSystemMenu", false, "Timer pause in pause menu", "Other");
	settings.Add("splitEverytime", false, "Split every boss kill", "Other");
	
	settings.SetToolTip("Boss","Split when the boss is dead.");
	settings.SetToolTip("Mini Boss","Split when the mini boss is dead.");
	settings.SetToolTip("sBoss","Split when start boss fight.");
	settings.SetToolTip("Abyss Challenges","Split when destory the brrier stone.");
	settings.SetToolTip("dark tunnel","Split when skip the last cutscene of dark tunnel section.");
	settings.SetToolTip("saveCat","Split when cutscene happend.");
	settings.SetToolTip("onSystemMenu","Timer pause while pasue menu is open.\n\nRuns using this feature will get the time added back on before validation.");
	settings.SetToolTip("splitEverytime","Enable : Split every time when you kill the boss.\nDisable : Split on first time you kill the boss.");
	settings.SetToolTip("resetDeath","Reset timer when nobeta is dead.\nAddtional option for the reset option.");
	settings.SetToolTip("resetSave","Enable : Save split records when reset.\nDisable : Not save any record when reset.");
	settings.SetToolTip("resetTitle","Reset when click Return To Title Screen Button");
	settings.SetToolTip("resetEnd","Reset when click OK Button in unlock NG+ screen");
	settings.SetToolTip("anyItem","Split every time you pick item");
	settings.SetToolTip("lastItem","Split when you pick last item (103)");
	settings.SetToolTip("Chest","Split every time when you OPEN chest");
	
	settings.Add("Trial Tower", false, "Trial Tower [1.1.0+]");
	settings.Add("Boss Split", true, "Boss Split", "Trial Tower");
	settings.Add("Timer", true, "Split when timer start", "Trial Tower");
	settings.Add("StartTimer", true, "Start Livesplit with IGT", "Trial Tower");
	settings.Add("StartExitPrac", true, "Start on Exit Practice mode / Retry", "Trial Tower");
	settings.Add("NewGameTT", true, "Start Livesplit when start new Trial Tower", "Trial Tower");
	settings.Add("Boss IGT Sync", true, "Sync IGT to GameTime (Only Practice Mode)", "Trial Tower");
	
	settings.Add("ArmorTT", true, "Armor", "Boss Split");
	settings.Add("TaniaTT", true, "Tania", "Boss Split");
	settings.Add("Monica1TT", false, "Monica Phase 1", "Boss Split");
	settings.Add("Monica2TT", true, "Monica Phase 2", "Boss Split");
	settings.Add("Vanessa1TT", true, "Vanessa 1", "Boss Split");
	settings.Add("Vanessa2TT", true, "Vanessa 2", "Boss Split");
	settings.Add("NonotaTT", true, "Nonota", "Boss Split");
	settings.Add("KnightTT", true, "Knight", "Boss Split");
	settings.Add("Seal1TT",  false, "Seal Phase 1", "Boss Split");
	settings.Add("Seal2TT", true, "Seal Pahse 2", "Boss Split");

	//DebugOutput
	vars.Dbg = (Action<dynamic>) ((text) => print("[LWN Auto Splitter] : " + text));

	vars.TimerModel = new TimerModel { CurrentState = timer };
}

init
{
	version = current.Ver;
	vars.newVersion = current.Ver[2];
	//Declared
	vars.Boss = new int[4,9];
	IntPtr ptr = IntPtr.Zero;
	vars.IsDeadTT = 0;
	vars.itemCount = 0;
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
		if(vars.newVersion > '0')
		{
			vars.watchers = new MemoryWatcherList
			{
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x20, 0x28, 0x10, 0x280)) { Name = "assetCached" },
				new MemoryWatcher<bool>(new DeepPointer(ptr, 0x0, 0x40, 0x30, 0x28, 0xA0)) { Name = "progressLabel" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xF8)) { Name = "StageID" },
				new MemoryWatcher<bool>(new DeepPointer(ptr, 0x78, 0xE0)) { Name = "onSystemMenu" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0x58)) { Name = "stageState" }, //state == 0 (normal = 0, death = 1, cutscene = 2, pray = 3)
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0x88)) { Name = "bossDialogue" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x3F)) { Name = "monicabear" },
				new MemoryWatcher<bool>(new DeepPointer(ptr, 0x78, 0xB0, 0x18, 0x20, 0x11)) { Name = "isDead" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x28, 0x20)) { Name = "Chest" },
				new MemoryWatcher<int>(new DeepPointer(ptr, 0x0, 0x18, 0x18, 0x30)) { Name = "InGameTime" },
				new StringWatcher(new DeepPointer(ptr, 0x78, 0xD0, 0x40, 0x10, 0x14), 128) { Name = "scriptName" },
				new StringWatcher(new DeepPointer(ptr, 0x90, 0x10, 0x14), 128) { Name = "sceneName" },
				//new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x10)) { Name = "dataVersion" }
				//new MemoryWatcher<byte>(new DeepPointer(ptr, 0x50, 0x28 0x10 0x70)) { Name = "playerState" }, //30,31 sit next to statue //didnt used
			};
			vars.boss = new MemoryWatcherList
			{
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x138, 0x10, 0x70, 0x176)) { Name = "Armor" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x218, 0x10, 0x70, 0x176)) { Name = "Secret" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x1C0, 0x10, 0x70, 0x176)) { Name = "Tania" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x140, 0x10, 0x70, 0x176)) { Name = "Monica1" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0xF8, 0x10, 0x70, 0x176)) { Name = "Monica2" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x78, 0x10, 0x70, 0x176)) { Name = "Vanessa1" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x220, 0x10, 0x70, 0x176)) { Name = "Vanessa2" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0xA8, 0x10, 0x70, 0x176)) { Name = "Nonota" }
			};
			vars.miniboss = new MemoryWatcherList
			{
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x288, 0x10, 0x70, 0x176)) { Name = "Knight" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x218, 0x10, 0x70, 0x176)) { Name = "Seal1" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x270, 0x10, 0x70, 0x176)) { Name = "Seal2" }
			};
			vars.trialtower = new MemoryWatcherList
			{
				new MemoryWatcher<float>(new DeepPointer(ptr, 0x0, 0x18, 0x40, 0x14)) { Name = "ArmorTTTimer" },
				new MemoryWatcher<float>(new DeepPointer(ptr, 0x0, 0x18, 0x40, 0x20)) { Name = "TaniaTTTimer" },
				new MemoryWatcher<float>(new DeepPointer(ptr, 0x0, 0x18, 0x40, 0x2C)) { Name = "MonicaTTTimer" },
				new MemoryWatcher<float>(new DeepPointer(ptr, 0x0, 0x18, 0x40, 0x38)) { Name = "Vanessa1TTTimer" },
				new MemoryWatcher<float>(new DeepPointer(ptr, 0x0, 0x18, 0x40, 0x44)) { Name = "Vanessa2TTTimer" },
				new MemoryWatcher<float>(new DeepPointer(ptr, 0x0, 0x18, 0x40, 0x50)) { Name = "NonotaTTTimer" },
				new MemoryWatcher<float>(new DeepPointer(ptr, 0x0, 0x18, 0x40, 0x5C)) { Name = "KnightTTTimer" },
				new MemoryWatcher<float>(new DeepPointer(ptr, 0x0, 0x18, 0x40, 0x68)) { Name = "SealTTTimer" },
				new MemoryWatcher<float>(new DeepPointer(ptr, 0x0, 0x18, 0x40, 0x98)) { Name = "testtimer" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x82)) { Name = "testmode" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x50, 0x10, 0x70, 0x176)) { Name = "ArmorTT" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x60, 0x10, 0x70, 0x176)) { Name = "TaniaTT" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x40, 0x10, 0x70, 0x176)) { Name = "Monica1TT" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x68, 0x10, 0x70, 0x176)) { Name = "Monica2TT" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x58, 0x10, 0x70, 0x176)) { Name = "KnightTT" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x38, 0x10, 0x70, 0x176)) { Name = "Vanessa1TT" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x28, 0x10, 0x70, 0x176)) { Name = "Vanessa2TT" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x20, 0x10, 0x70, 0x176)) { Name = "Seal1TT" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x30, 0x10, 0x70, 0x176)) { Name = "Seal2TT" },
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x78, 0xB8, 0x10, 0x10, 0x48, 0x10, 0x70, 0x176)) { Name = "NonotaTT" }
			};
		}
		else
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
				new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x28, 0x20)) { Name = "Chest" },
				new MemoryWatcher<int>(new DeepPointer(ptr, 0x0, 0x18, 0x18, 0x30)) { Name = "InGameTime" },
				new StringWatcher(new DeepPointer(ptr, 0x78, 0xC0, 0x40, 0x10, 0x14), 128) { Name = "scriptName" },
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
		}
		
		vars.chal = new MemoryWatcherList
		{
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x6E)) { Name = "chalL" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x6F)) { Name = "chalR" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x70)) { Name = "chalC" }
		};
		vars.cutscene = new MemoryWatcherList
		{
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x11)) { Name = "crystal 1" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x13)) { Name = "saveCat" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x24)) { Name = "IceFire" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x38)) { Name = "destory wood" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x3C)) { Name = "destory crystal with fire" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x42)) { Name = "hatLost" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x43)) { Name = "hatGet" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x51)) { Name = "destory orb" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x48)) { Name = "destory 3 crytals" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x4C)) { Name = "dark tunnel" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x60)) { Name = "destory crystal open teleport" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x30, 0x64)) { Name = "open door abyss" }
		};
		vars.magic = new MemoryWatcherList
		{
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x20, 0x3C)) { Name = "Arcane" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x20, 0x40)) { Name = "Ice" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x20, 0x44)) { Name = "Fire" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x20, 0x48)) { Name = "Thunder" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x20, 0x4C)) { Name = "Absorption" },
			new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x20, 0x50)) { Name = "Wind" }
		};
		vars.items = new MemoryWatcherList();
		for (int i = 0; i < 103; i++)
		{
			//var item = new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x28, 0x38, 0x20 + i)) { Name = "Item" + (i+1) };
			vars.items.Add(new MemoryWatcher<byte>(new DeepPointer(ptr, 0x0, 0x18, 0x28, 0x38, 0x20 + i)) { Name = "Item" + (i+1) });
		}
	}

	//Test
	vars.watchers.UpdateAll(game);
	//vars.Dbg(vars.watchers["sceneName"].Current);

	//Address (Show on Game Version)
	//version = ptr.ToString("X");
	
	if(vars.newVersion > '0')
	{
		vars.trialtower.UpdateAll(game);
		vars.trialtower["ArmorTTTimer"].Old = 69;
		vars.trialtower["TaniaTTTimer"].Old = 69;
		vars.trialtower["MonicaTTTimer"].Old = 69;
		vars.trialtower["Vanessa1TTTimer"].Old = 69;
		vars.trialtower["Vanessa2TTTimer"].Old = 69;
		vars.trialtower["NonotaTTTimer"].Old = 69;
		vars.trialtower["KnightTTTimer"].Old = 69;
		vars.trialtower["SealTTTimer"].Old = 69;
		vars.trialtower["testtimer"].Old = 69;
	}
	
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
		if(settings["Magic"]) vars.magic.UpdateAll(game);
		if(settings["Items"]) vars.items.UpdateAll(game);
		if(vars.newVersion > '0')
		{
			if(settings["Trial Tower"]) vars.trialtower.UpdateAll(game);
			if(settings["Timer"] && vars.watchers["isDead"].Changed && vars.watchers["isDead"].Current == 0) vars.IsDeadTT = 1;
		}
		vars.InGameTime = TimeSpan.FromSeconds(vars.watchers["InGameTime"].Current).ToString(@"hh\:mm\:ss");
	}

	if(settings.ResetEnabled)
	{
		if(timer.CurrentPhase != TimerPhase.NotRunning)
		{
			//NG+ Click
			if(settings["resetEnd"] && vars.watchers["sceneName"].Changed && (vars.watchers["sceneName"].Current == "Title") && (vars.watchers["sceneName"].Old == "Staff"))
			{
				if(settings["resetSave"])
				{
					vars.Dbg("NG+ Reset Save");
					vars.TimerModel.Reset();
				}
				else
				{
					vars.Dbg("NG+ Reset");
					vars.TimerModel.Reset(false);
				}
			}

			//Anywhere that have title button except NG+ button
			if(settings["resetTitle"] && vars.watchers["sceneName"].Changed && (vars.watchers["sceneName"].Current == "Title") && (vars.watchers["sceneName"].Old != "Staff"))
			{
				if(settings["resetSave"])
				{
					vars.Dbg("Reset Save");
					vars.TimerModel.Reset();
				}
				else
				{
					vars.Dbg("Reset");
					vars.TimerModel.Reset(false);
				}
			}
			
			//Nobeta Dead :skull:
			if(settings["resetDeath"] && vars.watchers["isDead"].Changed && vars.watchers["isDead"].Current)
			{
				if(settings["resetSave"])
				{
					vars.Dbg("Death Reset Save");
					vars.TimerModel.Reset();
				}
				else
				{
					vars.Dbg("Death Reset");
					vars.TimerModel.Reset(false);
				}
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
	if(vars.newVersion > '0')
	{
		if(settings["NewGameTT"] && vars.watchers["sceneName"].Changed && vars.watchers["sceneName"].Current == "BossRush01")
		{
			vars.Dbg("StartTT");
			return true;
		}
		if(settings["StartExitPrac"])
		{
			if(vars.watchers["scriptName"].Current == "BossRush_Dialogue_ResetBossRush_Submit" && vars.watchers["stageState"].Changed)
			{
				vars.Dbg("StartEx");
				return true;
			}
			if(vars.watchers["scriptName"].Current == "BossRush_Dialogue_RemoveTestMode_Submit" && vars.watchers["stageState"].Changed)
			{
				vars.Dbg("StartEx");
				return true;
			}
		}
		if(settings["StartTimer"] && timer.CurrentPhase == TimerPhase.NotRunning)
		{
			if((vars.trialtower["testtimer"].Old == 0) && vars.trialtower["testtimer"].Old < vars.trialtower["testtimer"].Current) return true;
			if((vars.trialtower["ArmorTTTimer"].Old == 0) && vars.trialtower["ArmorTTTimer"].Old < vars.trialtower["ArmorTTTimer"].Current) return true;
			if((vars.trialtower["TaniaTTTimer"].Old == 0) && vars.trialtower["TaniaTTTimer"].Old < vars.trialtower["TaniaTTTimer"].Current) return true;
			if((vars.trialtower["MonicaTTTimer"].Old == 0) && vars.trialtower["MonicaTTTimer"].Old < vars.trialtower["MonicaTTTimer"].Current) return true;
			if((vars.trialtower["Vanessa1TTTimer"].Old == 0) && vars.trialtower["Vanessa1TTTimer"].Old < vars.trialtower["Vanessa1TTTimer"].Current) return true;
			if((vars.trialtower["Vanessa2TTTimer"].Old == 0) && vars.trialtower["Vanessa2TTTimer"].Old < vars.trialtower["Vanessa2TTTimer"].Current) return true;
			if((vars.trialtower["NonotaTTTimer"].Old == 0) && vars.trialtower["NonotaTTTimer"].Old < vars.trialtower["NonotaTTTimer"].Current) return true;
			if((vars.trialtower["KnightTTTimer"].Old == 0) && vars.trialtower["KnightTTTimer"].Old < vars.trialtower["KnightTTTimer"].Current) return true;
			if((vars.trialtower["SealTTTimer"].Old == 0) && vars.trialtower["SealTTTimer"].Old < vars.trialtower["SealTTTimer"].Current) return true;
		}
	}
}

split
{
	//Trial Tower
	if(vars.newVersion > '0')
	{
		if(settings["Timer"])
		{
			if(vars.IsDeadTT == 0)
			{
				if((vars.trialtower["ArmorTTTimer"].Old == 0) && vars.trialtower["ArmorTTTimer"].Old < vars.trialtower["ArmorTTTimer"].Current) return true;
				if((vars.trialtower["TaniaTTTimer"].Old == 0) && vars.trialtower["TaniaTTTimer"].Old < vars.trialtower["TaniaTTTimer"].Current) return true;
				if((vars.trialtower["MonicaTTTimer"].Old == 0) && vars.trialtower["MonicaTTTimer"].Old < vars.trialtower["MonicaTTTimer"].Current) return true;
				if((vars.trialtower["Vanessa1TTTimer"].Old == 0) && vars.trialtower["Vanessa1TTTimer"].Old < vars.trialtower["Vanessa1TTTimer"].Current) return true;
				if((vars.trialtower["Vanessa2TTTimer"].Old == 0) && vars.trialtower["Vanessa2TTTimer"].Old < vars.trialtower["Vanessa2TTTimer"].Current) return true;
				if((vars.trialtower["NonotaTTTimer"].Old == 0) && vars.trialtower["NonotaTTTimer"].Old < vars.trialtower["NonotaTTTimer"].Current) return true;
				if((vars.trialtower["KnightTTTimer"].Old == 0) && vars.trialtower["KnightTTTimer"].Old < vars.trialtower["KnightTTTimer"].Current) return true;
				if((vars.trialtower["SealTTTimer"].Old == 0) && vars.trialtower["SealTTTimer"].Old < vars.trialtower["SealTTTimer"].Current) return true;
			}
		}
		
		if(settings["Boss Split"])
		{
			if(settings["ArmorTT"] && vars.trialtower["ArmorTT"].Current == vars.trialtower["ArmorTT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
			if(settings["TaniaTT"] && vars.trialtower["TaniaTT"].Current == vars.trialtower["TaniaTT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
			if(settings["Monica1TT"] && vars.trialtower["Monica1TT"].Current == vars.trialtower["Monica1TT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
			if(settings["Monica2TT"] && vars.trialtower["Monica2TT"].Current == vars.trialtower["Monica2TT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
			if(settings["KnightTT"] && vars.trialtower["KnightTT"].Current == vars.trialtower["KnightTT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
			if(settings["Vanessa1TT"] && vars.trialtower["Vanessa1TT"].Current == vars.trialtower["Vanessa1TT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
			if(settings["Vanessa2TT"] && vars.trialtower["Vanessa2TT"].Current == vars.trialtower["Vanessa2TT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
			if(settings["Seal1TT"] && vars.trialtower["Seal1TT"].Current == vars.trialtower["Seal1TT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
			if(settings["Seal2TT"] && vars.trialtower["Seal2TT"].Current == vars.trialtower["Seal2TT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
			if(settings["NonotaTT"] && vars.trialtower["NonotaTT"].Current == vars.trialtower["NonotaTT"].Old + 1)
			{
				vars.IsDeadTT = 0;
				return true;
			}
		}
	}
	
	//Boss
	if(settings["Boss"])
	{
		if(settings["Armor"] && vars.watchers["StageID"].Current == 2 && vars.boss["Armor"].Current == vars.boss["Armor"].Old + 1 && vars.Boss[0,1] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[0,1] = 1;
			return true;
		}
		if(settings["Secret"] && vars.watchers["StageID"].Current == 2 && vars.boss["Secret"].Current == vars.boss["Secret"].Old + 1 && vars.Boss[0,7] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[0,7] = 1;
			return true;
		}
		if(settings["Tania"] && vars.watchers["StageID"].Current == 3 && vars.boss["Tania"].Current == vars.boss["Tania"].Old + 1 && vars.Boss[0,2] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[0,2] = 1;
			return true;
		}
		if(settings["Monica1"] && vars.watchers["StageID"].Current == 4 && vars.boss["Monica1"].Current == vars.boss["Monica1"].Old + 1 && vars.Boss[0,3] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[0,3] = 1;
			return true;
		}
		if(settings["Monica2"] && vars.watchers["StageID"].Current == 4 && vars.boss["Monica2"].Current == vars.boss["Monica2"].Old + 1 && vars.Boss[0,8] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[0,8] = 1;
			return true;
		}
		if(settings["Vanessa1"] && vars.watchers["StageID"].Current == 5 && vars.boss["Vanessa1"].Current == vars.boss["Vanessa1"].Old + 1 && vars.Boss[0,4] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[0,4] = 1;
			return true;
		}
		if(settings["Vanessa2"] && vars.watchers["StageID"].Current == 6 && vars.boss["Vanessa2"].Current == vars.boss["Vanessa2"].Old + 1 && vars.Boss[0,5] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[0,5] = 1;
			return true;
		}
		if(settings["Nonota"] && vars.watchers["StageID"].Current == 7 && vars.boss["Nonota"].Current == vars.boss["Nonota"].Old + 1 && vars.Boss[0,6] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[0,6] = 1;
			return true;
		}
	}

	//Mini Boss
	if(settings["Mini Boss"])
	{
		if(settings["Knight"] && vars.watchers["StageID"].Current == 5 && vars.miniboss["Knight"].Current == vars.miniboss["Knight"].Old + 1 && vars.Boss[1,0] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[1,0] = 1;
			return true;
		}
		if(settings["Seal1"] && vars.watchers["StageID"].Current == 6 && vars.miniboss["Seal1"].Current == vars.miniboss["Seal1"].Old + 1 && vars.Boss[1,1] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[1,1] = 1;
			return true;
		}
		if(settings["Seal2"] && vars.watchers["StageID"].Current == 6 && vars.miniboss["Seal2"].Current == vars.miniboss["Seal2"].Old + 1 && vars.Boss[1,2] == 0)
		{
			if(!settings["splitEverytime"]) vars.Boss[1,2] = 1;
			return true;
		}
	}

	//Start Boss
	if(settings["sBoss"])
	{
		if(settings["sArmor"] && vars.watchers["bossDialogue"].Current == 1 && vars.watchers["bossDialogue"].Changed && vars.Boss[2,1] == 0)
		{
			vars.Boss[2,1] = 1;
			return true;
		}
		if(settings["sTania"] && vars.watchers["bossDialogue"].Current == 2 && vars.watchers["bossDialogue"].Changed && vars.Boss[2,2] == 0)
		{
			vars.Boss[2,2] = 1;
			return true;
		}
		if(settings["sVanessa1"] && vars.watchers["bossDialogue"].Current == 4 && vars.watchers["bossDialogue"].Changed && vars.Boss[2,4] == 0)
		{
			vars.Boss[2,4] = 1;
			return true;
		}
		if(settings["sVanessa2"] && vars.watchers["bossDialogue"].Current == 5 && vars.watchers["bossDialogue"].Changed && vars.Boss[2,5] == 0)
		{
			vars.Boss[2,5] = 1;
			return true;
		}
		if(settings["sNonota"] && vars.watchers["bossDialogue"].Current == 6 && vars.watchers["bossDialogue"].Changed && vars.Boss[2,6] == 0)
		{
			vars.Boss[2,6] = 1;
			return true;
		}
		if(settings["sSecret"] && vars.watchers["bossDialogue"].Current == 7 && vars.watchers["bossDialogue"].Changed && vars.Boss[2,7] == 0)
		{
			vars.Boss[2,7] = 1;
			return true;
		}
		if(vars.watchers["bossDialogue"].Current == 3)
		{
			if(vars.watchers["bossDialogue"].Changed)
			{
				if(settings["sMonica1"] && (vars.watchers["monicabear"].Current == 0) && vars.Boss[2,3] == 0)
				{
					vars.Boss[2,3] = 1;
					return true;
				}
				if(settings["sMonica2"] && (vars.watchers["monicabear"].Current == 1) && vars.Boss[2,8] == 0)
				{
					vars.Boss[2,8] = 1;
					return true;
				}
			}
		}
	}

	//Start Mini Boss
	if(settings["sMini Boss"])
	{
		if(settings["sSeal1"] && vars.watchers["scriptName"].Changed && vars.watchers["scriptName"].Current == "Act06_Room05" && vars.Boss[3,1] == 0)
		{
			vars.Boss[3,1] = 1;
			return true;
		}
		if(settings["sSeal2"] && vars.watchers["scriptName"].Changed && vars.watchers["scriptName"].Current == "Act06_Room06" && vars.Boss[3,2] == 0)
		{
			vars.Boss[3,2] = 1;
			return true;
		}
	}

	//Abyss Challenges
	if(settings["Abyss Challenges"])
	{
		if(vars.watchers["StageID"].Current == 7)
		{
			if(settings["chalL"] && vars.chal["chalL"].Current == vars.chal["chalL"].Old + 1) return true;
			if(settings["chalR"] && vars.chal["chalR"].Current == vars.chal["chalR"].Old + 1) return true;
			if(settings["chalC"] && vars.chal["chalC"].Current == vars.chal["chalC"].Old + 1) return true;
		}
	}

	//Cutscene dark tunnel
	if(settings["Cutscene"])
	{
		if(vars.cutscene["crystal 1"].Current == vars.cutscene["crystal 1"].Old + 1 && settings["crystal 1"]) return true;
		if(vars.cutscene["saveCat"].Current == vars.cutscene["saveCat"].Old + 1 && settings["saveCat"]) return true;
		if(vars.cutscene["IceFire"].Current == vars.cutscene["IceFire"].Old + 1 && settings["IceFire"]) return true;
		if(vars.cutscene["destory wood"].Current == vars.cutscene["destory wood"].Old + 1 && settings["destory wood"]) return true;
		if(vars.cutscene["destory crystal with fire"].Current == vars.cutscene["destory crystal with fire"].Old + 1 && settings["destory crystal with fire"]) return true;
		if(vars.cutscene["hatLost"].Current == vars.cutscene["hatLost"].Old + 1 && settings["hatLost"]) return true;
		if(vars.cutscene["hatGet"].Current == vars.cutscene["hatGet"].Old + 1 && settings["hatGet"]) return true;
		if(vars.cutscene["destory orb"].Current == vars.cutscene["destory orb"].Old + 1 && settings["destory orb"]) return true;
		if(vars.cutscene["destory 3 crytals"].Current == vars.cutscene["destory 3 crytals"].Old + 1 && settings["destory 3 crytals"]) return true;
		if(vars.cutscene["dark tunnel"].Current == vars.cutscene["dark tunnel"].Old + 1 && settings["dark tunnel"]) return true;
		if(vars.cutscene["destory crystal open teleport"].Current == vars.cutscene["destory crystal open teleport"].Old + 1 && settings["destory crystal open teleport"]) return true;
		if(vars.cutscene["open door abyss"].Current == vars.cutscene["open door abyss"].Old + 1 && settings["open door abyss"]) return true;
	}

	//Magic level
	if(settings["Magic"])
	{
		if(vars.magic["Arcane"].Current == 2 && vars.magic["Arcane"].Changed && settings["Arcane Lv.2"]) return true;
		if(vars.magic["Ice"].Current == 1 && vars.magic["Ice"].Changed && settings["Ice Lv.1"]) return true;
		if(vars.magic["Fire"].Current == 1 && vars.magic["Fire"].Changed && settings["Fire Lv.1"]) return true;
		if(vars.magic["Thunder"].Current == 1 && vars.magic["Thunder"].Changed && settings["Thunder Lv.1"]) return true;
		if(vars.magic["Absorption"].Current == 1 && vars.magic["Absorption"].Changed && settings["Absorption Lv.1"]) return true;
		if(vars.magic["Wind"].Current == 1 && vars.magic["Wind"].Changed && settings["Wind Lv.1"]) return true;
	}

	//Items
	if(settings["Items"])
	{
		foreach (var item in vars.items)
		{
			if(item.Changed && item.Current == 1)
			{
				vars.itemCount++;
				if(settings["anyItem"]) return true;
			}
		}
		if(settings["lastItem"] && vars.itemCount == 103) return true;
	}
	
	//Chest
	if(settings["Chest"])
	{
		if(vars.watchers["Chest"].Current == vars.watchers["Chest"].Old + 1) return true;
	}
}

gameTime
{
	if(vars.newVersion > '0')
	{
		if(settings["Boss IGT Sync"] && vars.trialtower["testmode"].Current == 1)
		{
			return TimeSpan.FromSeconds((int)(vars.trialtower["testtimer"].Current * 100.0) / 100.0);
		}
	}
}

isLoading
{
	//menu(true) && state == 0 (normal = 0, death = 1, cutscene = 2, pray = 3)
	if(settings["onSystemMenu"]) return ((vars.watchers["onSystemMenu"].Current && (vars.watchers["stageState"].Current == 0)) || (vars.watchers["assetCached"].Current == 255)); //|| !vars.watchers["progressLabel"].Current);
	else return (vars.watchers["assetCached"].Current == 255); //|| !vars.watchers["progressLabel"].Current);
}

reset
{
	return false;
}

//fix IGT ahead 0.01-0.04 after start
onStart
{
	vars.watchers["scriptName"].Current = "0";
	vars.watchers["scriptName"].Old = "0";
	vars.itemCount = 0;
	if(vars.newVersion > '0')
	{
		vars.IsDeadTT = 0;
		if(settings["Trial Tower"] && vars.trialtower["testmode"].Current == 0) timer.IsGameTimePaused = true;
		else timer.IsGameTimePaused = true;
	}
	else timer.IsGameTimePaused = true;
	Array.Clear(vars.Boss, 0, vars.Boss.Length);
}

exit
{
	timer.IsGameTimePaused = true;
}
