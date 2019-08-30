---------------------------------------------------------------------------
--
--   supbtime.lua
--
--   Use make SUBTARGET=supbtime to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["H6280"] = true
CPUS["M680X0"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["C6280"] = true
SOUNDS["SPEAKER"] = true
SOUNDS["YM2151"] = true
SOUNDS["OKIM6295"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["GEN_LATCH"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

BUSES["GENERIC"] = true

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in supbtime.lst
--------------------------------------------------

function createProjects_mame_supbtime(_target, _subtarget)
	project ("mame_supbtime")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-supbtime"))
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
		MAME_DIR .. "src/mame/drivers/supbtime.cpp",
		MAME_DIR .. "src/mame/includes/supbtime.h",
		MAME_DIR .. "src/mame/includes/tumbleb.h",
		MAME_DIR .. "src/mame/machine/decocrpt.cpp",
		MAME_DIR .. "src/mame/machine/decocrpt.h",
		MAME_DIR .. "src/mame/video/deco16ic.cpp",
		MAME_DIR .. "src/mame/video/deco16ic.h",
		MAME_DIR .. "src/mame/video/decospr.cpp",
		MAME_DIR .. "src/mame/video/decospr.h",
		MAME_DIR .. "src/mame/video/supbtime.cpp",
		MAME_DIR .. "src/mame/video/tumbleb.cpp",
	}
end

function linkProjects_mame_supbtime(_target, _subtarget)
	links {
		"mame_supbtime",
	}
end
