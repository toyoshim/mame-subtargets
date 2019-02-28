---------------------------------------------------------------------------
--
--   konamigx.lua
--
--   Use make SUBTARGET=konamigx to build
--
---------------------------------------------------------------------------


--------------------------------------------------
-- Specify all the CPU cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

CPUS["M680X0"] = true
CPUS["TMS57002"] = true

--------------------------------------------------
-- Specify all the sound cores necessary for the
-- drivers referenced in tiny.lst.
--------------------------------------------------

SOUNDS["SPEAKER"] = true
SOUNDS["K054539"] = true
SOUNDS["K056800"] = true

--------------------------------------------------
-- specify available video cores
--------------------------------------------------

--------------------------------------------------
-- specify available machine cores
--------------------------------------------------

MACHINES["ADC083X"] = true
MACHINES["EEPROMDEV"] = true
MACHINES["K053252"] = true

--------------------------------------------------
-- specify available bus cores
--------------------------------------------------

--------------------------------------------------
-- This is the list of files that are necessary
-- for building all of the drivers referenced
-- in konamigx.lst
--------------------------------------------------

function createProjects_mame_konamigx(_target, _subtarget)
	project ("mame_konamigx")
	targetsubdir(_target .."_" .. _subtarget)
	kind (LIBTYPE)
	uuid (os.uuid("drv-mame-konamigx"))
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
		MAME_DIR .. "src/mame/drivers/konamigx.cpp",
		MAME_DIR .. "src/mame/machine/konamigx.cpp",
		MAME_DIR .. "src/mame/video/konamigx.cpp",
		MAME_DIR .. "src/mame/video/konami_helper.cpp",
		MAME_DIR .. "src/mame/video/k053246_k053247_k055673.cpp",
		MAME_DIR .. "src/mame/video/k053936.cpp",
		MAME_DIR .. "src/mame/video/k053246_k053247_k055673.cpp",
		MAME_DIR .. "src/mame/video/k053250.cpp",
		MAME_DIR .. "src/mame/video/k054156_k054157_k056832.cpp",
		MAME_DIR .. "src/mame/video/k054338.cpp",
		MAME_DIR .. "src/mame/video/k055555.cpp",
	}
end

function linkProjects_mame_konamigx(_target, _subtarget)
	links {
		"mame_konamigx",
	}
end
