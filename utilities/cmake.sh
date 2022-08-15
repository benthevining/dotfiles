#!/bin/sh

# Exports some default configuration settings for CMake as environment variables

export CMAKE_BUILD_TYPE="${CMAKE_BUILD_TYPE:-Release}"
export CMAKE_CONFIG_TYPE="${CMAKE_CONFIG_TYPE:-$CMAKE_BUILD_TYPE}"
export VERBOSE="${VERBOSE:-1}"
export CMAKE_COLOR_DIAGNOSTICS="${CMAKE_COLOR_DIAGNOSTICS:-ON}"

export FETCHCONTENT_BASE_DIR="${FETCHCONTENT_BASE_DIR:-$HOME/cmake/FetchContent}"
export CPM_SOURCE_CACHE="${CPM_SOURCE_CACHE:-$FETCHCONTENT_BASE_DIR}"

case "$(uname -s)" in
	Darwin)
		export CMAKE_GENERATOR="${CMAKE_GENERATOR:-Xcode}"
		export CMAKE_BUILD_PARALLEL_LEVEL="${CMAKE_BUILD_PARALLEL_LEVEL:-$(sysctl hw.ncpu | sed -e "s/^hw.ncpu://")}"
		;;
	Windows)
		export CMAKE_GENERATOR="${CMAKE_GENERATOR:-'Visual Studio 17 2022'}"
		export CMAKE_BUILD_PARALLEL_LEVEL="${CMAKE_BUILD_PARALLEL_LEVEL:-$NUMBER_OF_PROCESSORS}"
		;;
	*) # Linux
		export CMAKE_GENERATOR="${CMAKE_GENERATOR:-'Ninja Multi-Config'}"
		export CMAKE_BUILD_PARALLEL_LEVEL="${CMAKE_BUILD_PARALLEL_LEVEL:-$(grep -c ^processor /proc/cpuinfo)}"
		;;
esac
