# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/khangdc1/khang/ExeciseCPP/Execise3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/khangdc1/khang/ExeciseCPP/Execise3/build

# Include any dependencies generated for this target.
include CMakeFiles/khangdc1.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/khangdc1.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/khangdc1.dir/flags.make

CMakeFiles/khangdc1.dir/main.cpp.o: CMakeFiles/khangdc1.dir/flags.make
CMakeFiles/khangdc1.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/khangdc1/khang/ExeciseCPP/Execise3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/khangdc1.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/khangdc1.dir/main.cpp.o -c /home/khangdc1/khang/ExeciseCPP/Execise3/main.cpp

CMakeFiles/khangdc1.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/khangdc1.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/khangdc1/khang/ExeciseCPP/Execise3/main.cpp > CMakeFiles/khangdc1.dir/main.cpp.i

CMakeFiles/khangdc1.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/khangdc1.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/khangdc1/khang/ExeciseCPP/Execise3/main.cpp -o CMakeFiles/khangdc1.dir/main.cpp.s

# Object files for target khangdc1
khangdc1_OBJECTS = \
"CMakeFiles/khangdc1.dir/main.cpp.o"

# External object files for target khangdc1
khangdc1_EXTERNAL_OBJECTS =

khangdc1: CMakeFiles/khangdc1.dir/main.cpp.o
khangdc1: CMakeFiles/khangdc1.dir/build.make
khangdc1: calc/libcalc.a
khangdc1: CMakeFiles/khangdc1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/khangdc1/khang/ExeciseCPP/Execise3/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable khangdc1"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/khangdc1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/khangdc1.dir/build: khangdc1

.PHONY : CMakeFiles/khangdc1.dir/build

CMakeFiles/khangdc1.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/khangdc1.dir/cmake_clean.cmake
.PHONY : CMakeFiles/khangdc1.dir/clean

CMakeFiles/khangdc1.dir/depend:
	cd /home/khangdc1/khang/ExeciseCPP/Execise3/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/khangdc1/khang/ExeciseCPP/Execise3 /home/khangdc1/khang/ExeciseCPP/Execise3 /home/khangdc1/khang/ExeciseCPP/Execise3/build /home/khangdc1/khang/ExeciseCPP/Execise3/build /home/khangdc1/khang/ExeciseCPP/Execise3/build/CMakeFiles/khangdc1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/khangdc1.dir/depend

