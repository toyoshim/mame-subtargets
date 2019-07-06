---------------------------------------------------------------------------
--
--   alpha68k.lua
--
--   Use make SUBTARGET=alpha68k to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["M680X0"] = true
CPUS["Z80"] = true
CPUS["MCS48"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["SPEAKER"] = true
SOUNDS["DAC"] = true
SOUNDS["YM2203"] = true
SOUNDS["YM2413"] = true
SOUNDS["YM3812"] = true
SOUNDS["AY8910"] = true
SOUNDS["VOLT_REG"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["GEN_LATCH"] = true
MACHINES["Z80DAISY"] = true
MACHINES["TTL74259"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in alpha68k.lst
--------------------------------------------------

function createProjects_mame_alpha68k(_target, _subtarget)
	project ("mame_alpha68k")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-alpha68k"))
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
		MAME_DIR .. "src/mame/drivers/alpha68k.cpp",
		MAME_DIR .. "src/mame/includes/alpha68k.h",
		MAME_DIR .. "src/mame/video/alpha68k.cpp",
	}
end

function linkProjects_mame_alpha68k(_target, _subtarget)
	links {
		"mame_alpha68k",
	}
end
