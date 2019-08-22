---------------------------------------------------------------------------
--
--   chinagat.lua
--
--   Use make SUBTARGET=chinagat to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["HD6309"] = true
CPUS["M6800"] = true
CPUS["M6805"] = true
CPUS["M6809"] = true
CPUS["MCS48"] = true
CPUS["Z80"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["SPEAKER"] = true
SOUNDS["YM2151"] = true
SOUNDS["YM2203"] = true
SOUNDS["OKIM6295"] = true
SOUNDS["MSM5205"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["Z80DAISY"] = true
MACHINES["GEN_LATCH"] = true
MACHINES["BANKDEV"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in chinagat.lst
--------------------------------------------------

function createProjects_mame_chinagat(_target, _subtarget)
	project ("mame_chinagat")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-chinagat"))
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
		MAME_DIR .. "src/mame/drivers/chinagat.cpp",
		MAME_DIR .. "src/mame/drivers/ddragon.cpp",
		MAME_DIR .. "src/mame/includes/ddragon.h",
		MAME_DIR .. "src/mame/video/ddragon.cpp",
	}
end

function linkProjects_mame_chinagat(_target, _subtarget)
	links {
		"mame_chinagat",
	}
end
