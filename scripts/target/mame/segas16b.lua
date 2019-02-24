---------------------------------------------------------------------------
--
--   segas16b.lua
--
--   Use make SUBTARGET=segas16b to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["M680X0"] = true
CPUS["MCS51"] = true
CPUS["Z80"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["OKIM6295"] = true
SOUNDS["SPEAKER"] = true
SOUNDS["UPD7759"] = true
SOUNDS["YM2151"] = true
SOUNDS["YM2413"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["CXD1095"] = true
MACHINES["GEN_LATCH"] = true
MACHINES["UPD4701"] = true
MACHINES["Z80DAISY"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in segas16b.lst
--------------------------------------------------

function createProjects_mame_segas16b(_target, _subtarget)
	project ("mame_segas16b")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-segas16b"))
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
		MAME_DIR .. "src/mame/drivers/segas16b.cpp",
		MAME_DIR .. "src/mame/machine/fd1089.cpp",
		MAME_DIR .. "src/mame/machine/fd1094.cpp",
		MAME_DIR .. "src/mame/machine/mc8123.cpp",
		MAME_DIR .. "src/mame/machine/segaic16.cpp",
		MAME_DIR .. "src/mame/video/sega16sp.cpp",
		MAME_DIR .. "src/mame/video/segas16b.cpp",
		MAME_DIR .. "src/mame/video/segaic16.cpp",
	}
end

function linkProjects_mame_segas16b(_target, _subtarget)
	links {
		"mame_segas16b",
	}
end
