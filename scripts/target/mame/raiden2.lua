---------------------------------------------------------------------------
--
--   raiden2.lua
--
--   Use make SUBTARGET=raiden2 to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["NEC"] = true
CPUS["Z80"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["OKIM6295"] = true
SOUNDS["SPEAKER"] = true
SOUNDS["YM2151"] = true
SOUNDS["YM3812"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

VIDEOS["BUFSPRITE"] = true

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["EEPROMDEV"] = true
MACHINES["Z80DAISY"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in raiden2.lst
--------------------------------------------------

function createProjects_mame_raiden2(_target, _subtarget)
	project ("mame_raiden2")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-raiden2"))
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
		MAME_DIR .. "src/mame/audio/seibu.cpp",
		MAME_DIR .. "src/mame/drivers/raiden2.cpp",
		MAME_DIR .. "src/mame/includes/raiden2.h",
		MAME_DIR .. "src/mame/machine/r2crypt.cpp",
		MAME_DIR .. "src/mame/machine/seibucop/seibucop.cpp",
		MAME_DIR .. "src/mame/machine/seibuspi.cpp",
		MAME_DIR .. "src/mame/video/raiden2.cpp",
		MAME_DIR .. "src/mame/video/seibu_crtc.cpp",
	}
end

function linkProjects_mame_raiden2(_target, _subtarget)
	links {
		"mame_raiden2",
	}
end
