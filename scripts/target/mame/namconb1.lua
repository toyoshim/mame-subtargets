---------------------------------------------------------------------------
--
--   namconb1.lua
--
--   Use make SUBTARGET=namconb1 to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["M37710"] = true
CPUS["M6502"] = true
CPUS["M680X0"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["SPEAKER"] = true
SOUNDS["C140"] = true
SOUNDS["C352"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["EEPROMDEV"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in namconb1.lst
--------------------------------------------------

function createProjects_mame_namconb1(_target, _subtarget)
	project ("mame_namconb1")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-namconb1"))
	addprojectflags()
	precompiledheaders()

	includedirs {
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/devices",
		MAME_DIR .. "src/mame",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "3rdparty",
		GEN_DIR  .. "mame/layout",
	}

	files {
		MAME_DIR .. "src/mame/drivers/namconb1.cpp",
		MAME_DIR .. "src/mame/drivers/namcos2.cpp",
		MAME_DIR .. "src/mame/machine/namcomcu.cpp",
		MAME_DIR .. "src/mame/machine/namcos2.cpp",
		MAME_DIR .. "src/mame/machine/namcoic.cpp",
		MAME_DIR .. "src/mame/machine/namco_c148.cpp",
		MAME_DIR .. "src/mame/machine/namco_c139.cpp",
		MAME_DIR .. "src/mame/video/namconb1.cpp",
		MAME_DIR .. "src/mame/video/namcos2.cpp",
		MAME_DIR .. "src/mame/video/namco_c116.cpp",

	}
end

function linkProjects_mame_namconb1(_target, _subtarget)
	links {
		"mame_namconb1",
	}
end
