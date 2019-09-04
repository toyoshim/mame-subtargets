---------------------------------------------------------------------------
--
--   toaplan1.lua
--
--   Use make SUBTARGET=toaplan1 to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["M680X0"] = true
CPUS["TMS32010"] = true
CPUS["Z80"] = true
CPUS["Z180"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["SPEAKER"] = true
SOUNDS["YM3812"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

VIDEOS["BUFSPRITE"] = true

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["GEN_LATCH"] = true
MACHINES["TTL74259"] = true
MACHINES["Z80DAISY"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in toaplan1.lst
--------------------------------------------------

function createProjects_mame_toaplan1(_target, _subtarget)
	project ("mame_toaplan1")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-toaplan1"))
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
		MAME_DIR .. "src/mame/drivers/toaplan1.cpp",
		MAME_DIR .. "src/mame/includes/toaplan1.h",
		MAME_DIR .. "src/mame/machine/toaplan1.cpp",
		MAME_DIR .. "src/mame/video/toaplan_scu.cpp",
		MAME_DIR .. "src/mame/video/toaplan_scu.h",
		MAME_DIR .. "src/mame/video/toaplan1.cpp",
	}
end

function linkProjects_mame_toaplan1(_target, _subtarget)
	links {
		"mame_toaplan1",
	}
end
