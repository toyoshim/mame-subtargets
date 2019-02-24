---------------------------------------------------------------------------
--
--   shangha3.lua
--
--   Use make SUBTARGET=shangha3 to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["M680X0"] = true
CPUS["Z80"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["OKIM6295"] = true
SOUNDS["SPEAKER"] = true
SOUNDS["AY8910"] = true
SOUNDS["YM2612"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

VIDEOS["BUFSPRITE"] = true

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["BANKDEV"] = true
MACHINES["GEN_LATCH"] = true
MACHINES["Z80DAISY"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in shangha3.lst
--------------------------------------------------

function createProjects_mame_shangha3(_target, _subtarget)
	project ("mame_shangha3")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-shangha3"))
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
		MAME_DIR .. "src/mame/drivers/shangha3.cpp",
		MAME_DIR .. "src/mame/includes/shangha3.h",
		MAME_DIR .. "src/mame/video/shangha3.cpp",
	}
end

function linkProjects_mame_shangha3(_target, _subtarget)
	links {
		"mame_shangha3",
	}
end
