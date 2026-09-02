#pragma once

#include "Plugin.Core.hpp"

extern "C"
{
	// This is the entry point of the plugin.
	// More functions can be exported and imported in the engine.
	DLL void Init();
}