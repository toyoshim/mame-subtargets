---------------------------------------------------------------------------
--
--   toaplan2.lua
--
--   Use make SUBTARGET=toaplan2 to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["M680X0"] = true
CPUS["NEC"] = true
CPUS["Z80"] = true
CPUS["Z180"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["OKIM6295"] = true
SOUNDS["SPEAKER"] = true
SOUNDS["YM2151"] = true
SOUNDS["YM3812"] = true
SOUNDS["YMZ280B"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

VIDEOS["BUFSPRITE"] = true

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["BANKDEV"] = true
MACHINES["EEPROMDEV"] = true
MACHINES["GEN_LATCH"] = true
MACHINES["TICKET"] = true
MACHINES["UPD4992"] = true
MACHINES["Z80DAISY"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in toaplan2.lst
--------------------------------------------------

function createProjects_mame_toaplan2(_target, _subtarget)
	project ("mame_toaplan2")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-toaplan2"))
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

files{
	MAME_DIR .. "src/mame/drivers/toaplan2.cpp",
	MAME_DIR .. "src/mame/includes/toaplan2.h",
	MAME_DIR .. "src/mame/video/toaplan2.cpp",
	MAME_DIR .. "src/mame/video/gp9001.cpp",
	MAME_DIR .. "src/mame/video/gp9001.h",
	MAME_DIR .. "src/mame/machine/nmk112.cpp",
	MAME_DIR .. "src/mame/machine/nmk112.h",
}
end

function linkProjects_mame_toaplan2(_target, _subtarget)
	links {
		"mame_toaplan2",
	}
end
