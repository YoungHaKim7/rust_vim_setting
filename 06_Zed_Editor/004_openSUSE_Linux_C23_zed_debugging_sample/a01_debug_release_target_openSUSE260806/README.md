# justfile(C23, openSUSE 260806)

```justfile
# Detect OS
os := `uname`

# project name
project_name := `basename "$(pwd)"`
full_project_name := `pwd`

# clang & gcc basic & clang-format basic & cmake basic
clang := `which clang` 
clangpp := `which clang++` 
gcc := `which gcc`
clang_format_basic := `which clang-format`
cmake := `which cmake`

# compiler settings
# Find best clang version (21+) on Linux, fallback to system clang
clang_which := if os == "Linux" { \
    clang \
  } else if os == "Darwin" { \
    "/opt/homebrew/opt/llvm/bin/clang" \
  } else { \
    clang \
  }
clangpp_which := if os == "Linux" { \
    clangpp \
  } else if os == "Darwin" { \
    "/opt/homebrew/opt/llvm/bin/clang++" \
  } else { \
    clangpp \
  }
gcc_which := if os == "Linux" { \
	gcc
  } else if os == "Darwin" { \
    `sh -c 'if [ -x "/opt/homebrew/opt/gcc@15/bin/gcc-15" ]; then echo "/opt/homebrew/opt/gcc@15/bin/gcc-15"; exit 0; fi; for v in {14..30}; do if [ -x "/opt/homebrew/opt/llvm@$v/bin/clang" ]; then echo "/opt/homebrew/opt/llvm@$v/bin/clang"; exit 0; fi; done; echo "/opt/homebrew/opt/llvm/bin/clang"'` \
  } else { \
    gcc \
  }

# cmake settings(4.0)
cmake_which := if os == "Linux" { \
    cmake \
  } else if os == "Darwin" { \
    "/opt/homebrew/bin/cmake"
  } else { \
    cmake \
  }

# clang-format - find best version (21+) on Linux
clang_format := if os == "Linux" { \
    clang_format_basic \
  } else if os == "Darwin" { \
    "/opt/homebrew/opt/llvm/bin/clang-format" \
  } else { \
    clang_format_basic \
  }

# fmt .clang-format(linuxOS / macOS)
fmt_flags := if os == "Linux" { \
    ". -regex '.*\\.\\(cpp\\|hpp\\|cc\\|cxx\\|c\\|h\\)' -exec " \
    +clang_format+ \
    " -style=file -i {} \\;" \
  } else if os == "Darwin" { \
    ". -iname '*.cpp' \
    -o -iname '*.hpp' \
    -o -iname '*.cc' \
    -o -iname '*.c' \
    -o -iname '*.cxx' \
    -o -iname '*.c' \
    -o -iname '*.h' | " \
    +clang_format+ \
    " -style=file -i --files=/dev/stdin" \
  } else { \
    ". -regex '.*\\.\\(cpp\\|hpp\\|cc\\|cxx\\|c\\|h\\)' -exec " \
    +clang_format+ \
    " -style=file -i {} \\;" \
  }  

# fast fmt(LinuxOS / macOS)(Install "cargo install fd-find")
fm_flags := "-e c \
  -e h \
  -e cpp \
  -e hpp \
  -e cc \
  -e cxx -x " \
  +clang_format+  \
  " -style=file -i {} \\;"

# Source and target directories
src_dir := "src"
target_dir := "target"

# Files
source := src_dir+"/main.c"
target := target_dir+"/"+project_name

# Optimize (O2(RelWithDebInfo), O3(Release))
ldflags_optimize :=  "-std=c23 -Wall -O2 -pedantic -pthread -pedantic-errors -lm -Wextra -ggdb"

# Common flags
ldflags_common := "-std=c23 -pedantic -pthread -pedantic-errors -lm -Wall -Wextra -ggdb -Werror"
ldflags_debug := "-std=c23 -pthread -lm -Wall -Wextra -ggdb"
ldflags_emit_llvm := "-S -emit-llvm"
ldflags_assembly := "-Wall -save-temps"
ldflags_fsanitize_address := "-g -fsanitize=address -fno-omit-frame-pointer -c"
ldflags_fsanitize_object := "-g -fsanitize=address"
ldflags_fsanitize_thread := "-g -fsanitize=thread -fno-omit-frame-pointer -c"
ldflags_fsanitize_thread_object := "-g -fsanitize=thread"
ldflags_fsanitize_valgrind := "-fsanitize=address -g3"
ldflags_fsanitize_valgrind_O0 := "-O0 -g -std=c23 -pedantic -pthread -pedantic-errors -lm -Wall -Wextra -ggdb -Werror"
ldflags_fsanitize_leak := "-fsanitize=leak -g"

# (C)gcc compile(LinuxOS)
r:
	just fm
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	{{gcc_which}} {{ldflags_common}} -o ./{{target_dir}}/{{project_name}} {{source}}
	{{target}}

# (C)clang compile(Optimization/LinuxOS/ macOS)
ro:
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	{{clang_which}} {{ldflags_optimize}} -o ./{{target_dir}}/{{project_name}} {{source}}
	{{target}}

# cmake compile(LinuxOS)
cr:
	just fm
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	export CC={{gcc_which}}
	cmake -D CMAKE_BUILD_TYPE=Debug \
	      -D CMAKE_C_COMPILER={{gcc_which}} \
	      -G Ninja .
	ninja
	mv build.ninja CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log debug {{target_dir}}
	./{{target_dir}}/debug/{{project_name}}

# cmake compile(LinuxOS)
cro:
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	cmake -D CMAKE_BUILD_TYPE=RelWithDebInfo \
	      -D CMAKE_C_COMPILER={{gcc_which}} \
	      -D CMAKE_C_FLAGS_RELWITHDEBINFO_INIT="-O2 -g" \
	      -G Ninja .
	ninja
	mv build.ninja CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log relwithdebinfo {{target_dir}}
	./{{target_dir}}/relwithdebinfo/{{project_name}}

# cmake compile(LinuxOS)
cro3:
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	cmake -D CMAKE_BUILD_TYPE=Release \
	      -D CMAKE_C_COMPILER={{gcc_which}} \
	      -D CMAKE_C_FLAGS_RELEASE_INIT="-O3 -DNDEBUG" \
	      -G Ninja .
	ninja
	mv build.ninja CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log release {{target_dir}}
	./{{target_dir}}/release/{{project_name}}

# zig C compile(LinuxOS)
zr:
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	export CC={{gcc_which}}
	zig cc {{ldflags_common}} -o {{target}} {{source}}
	{{target}}
	
# cmake ctest
ctest:
	rm -rf build
	mkdir -p build
	cmake -D CMAKE_C_COMPILER={{gcc_which}} \
		  -S . -B build
	cmake --build build
	ctest --test-dir ./build

# clang build
b:
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	{{clang_which}} {{ldflags_debug}} -o {{target}} {{source}}

# clangd .cache(c23 LSP build)
clangd:
	rm -rf .cache {{target_dir}} build
	{{cmake_which}} -DCMAKE_BUILD_TYPE:STRING=Debug \
					-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
					-DCMAKE_C_COMPILER:FILEPATH={{clang_which}} \
					-DCMAKE_CXX_COMPILER:FILEPATH={{clangpp_which}} -Wno-unused-cli \
					-S {{full_project_name}} \
					-B {{full_project_name}}/debug \
					-G Ninja

# move target
move:
	rm -rf {{target_dir}}
	mkdir {{target_dir}}
	mv CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log build.ninja *.bc *.i *.s *.o *.ll a.out target

# .clang-format init(LinuxOS/macOS)
cl:
	rm -rf .clang-format
	{{clang_format}} -style=WebKit -dump-config > .clang-format

# .clang-format fmt(LinuxOS/ macOS)
fmt:
	find {{fmt_flags}}

# (fast).clang-format fmt(cargo install fd-find)(LinuxOS / macOS)
fm:
	fd {{fm_flags}}

# clang LLVM emit-file
ll:
	rm -rf target
	mkdir -p target
	cp -rf {{src_dir}}/*.* ./.
	{{clang_which}} {{ldflags_emit_llvm}} main.c
	mv *.ll {{target_dir}}
	{{clang_which}} {{ldflags_common}} -o {{target}} {{source}}
	mv *.cpp {{target_dir}}
	rm -rf *.out

# Assembly emit-file
as:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_assembly}} -o {{target}} {{source}}
	mv *.i {{target_dir}}
	mv *.o {{target_dir}}
	mv *.s {{target_dir}}
	mv *.bc {{target_dir}}

# Clang Sanitize(ASan=address / LSan=leak / TSan=thread / MSan=memory / UBSan=undefined (Undefined Behavior)
san SAN:
	rm -rf target
	mkdir -p target
	{{clang_which}} -g -fsanitize={{SAN}} -fno-omit-frame-pointer -c {{source}}
	{{clang_which}} -g -fsanitize={{SAN}} *.o 
	mv a.out *.o {{target_dir}}
	{{target_dir}}/a.out

# clang (ASan)fsanitize_address
asan:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_address}} {{source}}
	{{clang_which}} {{ldflags_fsanitize_object}} *.o 
	mv a.out *.o {{target_dir}}
	{{target_dir}}/a.out

# clang LSan_Leak_Sanitizer
lsan:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_leak}} {{source}} -o {{target}}
	{{target}}

# clang TSan_Thread_Sanitizer
tsan:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_thread}} {{source}}
	{{clang_which}} {{ldflags_fsanitize_thread_object}} *.o 
	mv a.out *.o {{target_dir}}
	{{target_dir}}/a.out

# leak memory check(valgrind)
[linux]
leaks:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_valgrind}} {{source}} -o {{target}}
	valgrind --leak-check=full {{target}}

# leak memory check(leaks / macOS)
[macos]
leaks:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_valgrind}} {{source}} -o {{target}}
	leaks --atExit -- {{target}}

# leak memory check(valgrind)
[linux]
valgrind:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_valgrind_O0}} {{source}} -o {{project_name}}
	mv {{project_name}} {{target_dir}}
	valgrind --leak-check=full {{target_dir}}/{{project_name}}

# valgrind --track-origins=yes 
[linux]
valgrind_detail:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_valgrind_O0}} {{source}} -o {{project_name}}
	mv {{project_name}} {{target_dir}}
	valgrind --leak-check=full --track-origins=yes {{target_dir }}/{{project_name}}

# valgrind --tool=memcheck --vgdb=yes --vgdb-error=0
[linux]
valgrind_memcheck:
	rm -rf target
	mkdir -p target
	{{clang_which}} -O0 -g {{source}} -o {{project_name}}
	mv {{project_name}} {{target_dir}}
	valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all --tool=memcheck --vgdb=yes --vgdb-error=0 {{target_dir }}/{{project_name}}
 
# thread check(data race)
thread:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_thread}} {{source}} -o {{target}}
	{{target}}

# object file emit-file
obj:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_assembly}} -o {{target}} {{source}}
	mv *.ii {{target_dir}}
	mv *.o {{target_dir}}
	mv *.s {{target_dir}}
	mv *.bc {{target_dir}}
	objdump --disassemble -S -C {{target_dir}}/main.o

# hex view("rg -i <search>" | "grep -rni <search>")
[linux]
xx:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_valgrind}} {{source}} -o {{project_name}}
	xxd -c 16 {{project_name}} > hex_print.txt
	mv {{project_name}} hex_print.txt {{target_dir}}

# hex view("rg -i <search>" | "grep -rni <search>")
[macos]
xx:
	rm -rf target
	mkdir -p target
	{{clang_which}} {{ldflags_fsanitize_valgrind}} {{source}} -o {{project_name}}
	xxd -c 16 {{project_name}} > hex_print.txt
	mv {{project_name}} {{project_name}}.* hex_print.txt {{target_dir}}

# clean files
clean:
	rm -rf {{target_dir}} *.out {{src_dir}}/*.out *.bc {{src_dir}}/target/ *.dSYM {{src_dir}}/*.dSYM *.i *.o *.s
	rm -rf build CMakeCache.txt CMakeFiles .cache

# C init(int main(void))
init:
	mkdir -p src
	echo '#include <stdio.h>' > src/main.c
	echo '' >> src/main.c
	echo 'int main(void) {' >> src/main.c
	echo '    printf("Hello world C lang ");' >> src/main.c
	echo '    return 0;' >> src/main.c
	echo '}' >> src/main.c
	echo '# BasedOnStyle: WebKit' > .clang-format
	echo '# LLVM, Google, Chromium, Mozilla, WebKit' >> .clang-format
	echo "" >> .clang-format
	echo 'BasedOnStyle: LLVM' >> .clang-format
	echo 'IndentWidth: 4' >> .clang-format
	echo 'ContinuationIndentWidth: 4' >> .clang-format
	echo 'IndentCaseLabels: false' >> .clang-format
	echo 'IndentCaseBlocks: false' >> .clang-format
	echo 'IndentGotoLabels: true' >> .clang-format
	echo 'IndentPPDirectives: None' >> .clang-format
	echo 'IndentExternBlock: NoIndent' >> .clang-format
	echo 'cmake_minimum_required(VERSION 4.0)' >> CMakeLists.txt
	echo '' >> CMakeLists.txt
	echo 'set(CMAKE_C_STANDARD 23)' >> CMakeLists.txt
	echo 'set(CMAKE_C_STANDARD_REQUIRED ON)' >> CMakeLists.txt
	echo 'set(CMAKE_C_EXTENSIONS OFF)' >> CMakeLists.txt
	echo '# set(CMAKE_EXPORT_COMPILE_COMMANDS ON)' >> CMakeLists.txt
	echo '' >> CMakeLists.txt
	echo 'get_filename_component(ProjectId ${CMAKE_CURRENT_SOURCE_DIR} NAME)' >> CMakeLists.txt
	echo 'string(REPLACE " " "_" ProjectId ${ProjectId})' >> CMakeLists.txt
	echo 'project(${ProjectId} LANGUAGES C)' >> CMakeLists.txt
	echo '' >> CMakeLists.txt
	echo '# Force GCC 15(LinuxOS)' >> CMakeLists.txt
	echo '# set(CMAKE_C_COMPILER "/opt/gcc-15/bin/gcc")' >> CMakeLists.txt
	echo '# Force GCC 15(macOS)' >> CMakeLists.txt
	echo '# set(CMAKE_C_COMPILER "/opt/homebrew/opt/gcc@15/bin/gcc-15")' >> CMakeLists.txt
	echo '# Force Clang 21(LinuxOS)' >> CMakeLists.txt
	echo '# set(CMAKE_C_COMPILER "/usr/bin/clang-21")' >> CMakeLists.txt
	echo '# Force Clang 21(macOS)' >> CMakeLists.txt
	echo '# set(CMAKE_CXX_COMPILER "/opt/homebrew/opt/llvm/bin/clang")' >> CMakeLists.txt
	echo '' >> CMakeLists.txt
	echo 'SET (CMAKE_C_FLAGS_INIT                "-Wall -std=c23")' >> CMakeLists.txt
	echo 'SET (CMAKE_C_FLAGS_DEBUG_INIT          "-g")' >> CMakeLists.txt
	echo 'SET (CMAKE_C_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG")' >> CMakeLists.txt
	echo 'SET (CMAKE_C_FLAGS_RELEASE_INIT        "-O3 -DNDEBUG")' >> CMakeLists.txt
	echo 'SET (CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-O2 -g")' >> CMakeLists.txt
	echo '' >> CMakeLists.txt
	echo 'SET (CMAKE_CXX_FLAGS_INIT                "-Wall -std=c++26")' >> CMakeLists.txt
	echo 'SET (CMAKE_CXX_FLAGS_DEBUG_INIT          "-g")' >> CMakeLists.txt
	echo 'SET (CMAKE_CXX_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG")' >> CMakeLists.txt
	echo 'SET (CMAKE_CXX_FLAGS_RELEASE_INIT        "-O3 -DNDEBUG")' >> CMakeLists.txt
	echo 'SET (CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-O2 -g")' >> CMakeLists.txt
	echo '' >> CMakeLists.txt
	echo '# Common compile flags' >> CMakeLists.txt
	echo 'add_compile_options(' >> CMakeLists.txt
	echo '    -pedantic' >> CMakeLists.txt
	echo '    -pthread' >> CMakeLists.txt
	echo '    -pedantic-errors' >> CMakeLists.txt
	echo '    -lm' >> CMakeLists.txt
	echo '    -Wall' >> CMakeLists.txt
	echo '    -Wextra' >> CMakeLists.txt
	echo '    -ggdb' >> CMakeLists.txt
	echo '    # -std=c23' >> CMakeLists.txt
	echo ')' >> CMakeLists.txt
	echo ''>> CMakeLists.txt
	echo '# Main executable with C sources' >> CMakeLists.txt
	echo 'add_executable(${ProjectId}' >> CMakeLists.txt
	echo '    src/main.c' >> CMakeLists.txt
	echo '    # src/mandelbrot.c' >> CMakeLists.txt
	echo ')' >> CMakeLists.txt
	echo '' >> CMakeLists.txt
	echo 'target_link_options(${ProjectId} PRIVATE -pthread -lm)' >> CMakeLists.txt
	echo '' >> CMakeLists.txt
	echo '# Output directory' >> CMakeLists.txt
	echo 'set_target_properties(${ProjectId} PROPERTIES' >> CMakeLists.txt
	echo '    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/target' >> CMakeLists.txt
	echo ')' >> CMakeLists.txt

# C init(int main(int argc, char* argv[]))
init2:
	mkdir -p src
	echo '# BasedOnStyle: WebKit' > .clang-format
	echo '# LLVM, Google, Chromium, Mozilla, WebKit' >> .clang-format
	echo "" >> .clang-format
	echo 'BasedOnStyle: WebKit' >> .clang-format
	echo 'IndentWidth: 4' >> .clang-format
	echo 'ContinuationIndentWidth: 4' >> .clang-format
	echo 'IndentCaseLabels: false' >> .clang-format
	echo 'IndentCaseBlocks: false' >> .clang-format
	echo 'IndentGotoLabels: true' >> .clang-format
	echo 'IndentPPDirectives: None' >> .clang-format
	echo 'IndentExternBlock: NoIndent' >> .clang-format
	echo '#include <stdio.h>' > src/main.c
	echo '' >> src/main.c
	echo 'int main(int argc, char* argv[]) {' >> src/main.c
	echo '    printf("Hello world C lang ");' >> src/main.c
	echo '    int i;' >> src/main.c
	echo '    ' >> src/main.c
	echo '    for (i=0; i < argc; i++) {' >> src/main.c
	echo '        printf("%s", argv[i]);' >> src/main.c
	echo '    }' >> src/main.c
	echo '    return 0;' >> src/main.c
	echo '}' >> src/main.c

# Debugging(VSCode codelldb ver)
codelldb:
	rm -rf .vscode
	mkdir -p .vscode
	echo '{' > .vscode/launch.json
	echo '    "version": "0.2.0",' >> .vscode/launch.json
	echo '    "configurations": [' >> .vscode/launch.json
	echo '        {' >> .vscode/launch.json
	echo '            "type": "lldb",' >> .vscode/launch.json
	echo '            "request": "launch",' >> .vscode/launch.json
	echo '            "name": "Launch",' >> .vscode/launch.json
	echo '            "program": "${workspaceFolder}/build/target/${workspaceFolderBasename}",' >> .vscode/launch.json
	echo '            "args": [],' >> .vscode/launch.json
	echo '            "cwd": "${workspaceFolder}"' >> .vscode/launch.json
	echo '            // "preLaunchTask": "C/C++: clang build active file"' >> .vscode/launch.json
	echo '        },' >> .vscode/launch.json
	echo '        {' >> .vscode/launch.json
	echo '            "name": "gcc - Build and debug active file",' >> .vscode/launch.json
	echo '            "type": "lldb",' >> .vscode/launch.json
	echo '            "request": "launch",' >> .vscode/launch.json
	echo '            "program": "${fileDirname}/build/target/${workspaceFolderBasename}",' >> .vscode/launch.json
	echo '            "args": [],' >> .vscode/launch.json
	echo '            "stopAtEntry": false,' >> .vscode/launch.json
	echo '            "cwd": "${fileDirname}",' >> .vscode/launch.json
	echo '            "environment": [],' >> .vscode/launch.json
	echo '            "externalConsole": false,' >> .vscode/launch.json
	echo '            "MIMode": "lldb"' >> .vscode/launch.json
	echo '            // "tasks": "C/C++: clang build active file"' >> .vscode/launch.json
	echo '        }' >> .vscode/launch.json
	echo '    ]' >> .vscode/launch.json
	echo '}' >> .vscode/launch.json
	echo '{' > .vscode/tasks.json
	echo '    "tasks": [' >> .vscode/tasks.json
	echo '        {' >> .vscode/tasks.json
	echo '            "type": "C_Cpp_Build",' >> .vscode/tasks.json
	echo '            "label": "C/C++: clang build active file",' >> .vscode/tasks.json
	echo '            "command": "{{clang_which}}",' >> .vscode/tasks.json
	echo '            "args": [' >> .vscode/tasks.json
	echo '                "-c",' >> .vscode/tasks.json
	echo '                "-fcolor-diagnostics",' >> .vscode/tasks.json
	echo '                "-fansi-escape-codes",' >> .vscode/tasks.json
	echo '                "-g",' >> .vscode/tasks.json
	echo '                "${file}",' >> .vscode/tasks.json
	echo '                "-o",' >> .vscode/tasks.json
	echo '                "${fileDirname}/build/target/${workspaceFolderBasename}"' >> .vscode/tasks.json
	echo '            ],' >> .vscode/tasks.json
	echo '            "options": {' >> .vscode/tasks.json
	echo '                "cwd": "${fileDirname}"' >> .vscode/tasks.json
	echo '            },' >> .vscode/tasks.json
	echo '            "problemMatcher": [' >> .vscode/tasks.json
	echo '                "$gcc"' >> .vscode/tasks.json
	echo '            ],' >> .vscode/tasks.json
	echo '            "group": {' >> .vscode/tasks.json
	echo '                "kind": "build",' >> .vscode/tasks.json
	echo '                "isDefault": true' >> .vscode/tasks.json
	echo '            },' >> .vscode/tasks.json
	echo '            "detail": "Task generated by Debugger."' >> .vscode/tasks.json
	echo '        }' >> .vscode/tasks.json
	echo '    ],' >> .vscode/tasks.json
	echo '    "version": "2.0.0"' >> .vscode/tasks.json
	echo '}' >> .vscode/tasks.json

# Debugging(VSCode)
vscode:
	rm -rf .vscode
	mkdir -p .vscode
	echo '{' > .vscode/launch.json
	echo '    "version": "0.2.0",' >> .vscode/launch.json
	echo '    "configurations": [' >> .vscode/launch.json
	echo '        {' >> .vscode/launch.json
	echo '            "type": "lldb",' >> .vscode/launch.json
	echo '            "request": "launch",' >> .vscode/launch.json
	echo '            "name": "Launch",' >> .vscode/launch.json
	echo '            "program": "${workspaceFolder}/target/${fileBasenameNoExtension}",' >> .vscode/launch.json
	echo '            "args": [],' >> .vscode/launch.json
	echo '            "cwd": "${workspaceFolder}"' >> .vscode/launch.json
	echo '            // "preLaunchTask": "C/C++: clang build active file"' >> .vscode/launch.json
	echo '        },' >> .vscode/launch.json
	echo '        {' >> .vscode/launch.json
	echo '            "name": "gcc - Build and debug active file",' >> .vscode/launch.json
	echo '            "type": "cppdbg",' >> .vscode/launch.json
	echo '            "request": "launch",' >> .vscode/launch.json
	echo '            "program": "${fileDirname}/target/${fileBasenameNoExtension}",' >> .vscode/launch.json
	echo '            "args": [],' >> .vscode/launch.json
	echo '            "stopAtEntry": false,' >> .vscode/launch.json
	echo '            "cwd": "${fileDirname}",' >> .vscode/launch.json
	echo '            "environment": [],' >> .vscode/launch.json
	echo '            "externalConsole": false,' >> .vscode/launch.json
	echo '            "MIMode": "lldb"' >> .vscode/launch.json
	echo '            // "tasks": "C/C++: clang build active file"' >> .vscode/launch.json
	echo '        }' >> .vscode/launch.json
	echo '    ]' >> .vscode/launch.json
	echo '}' >> .vscode/launch.json
	echo '{' > .vscode/tasks.json
	echo '    "tasks": [' >> .vscode/tasks.json
	echo '        {' >> .vscode/tasks.json
	echo '            "type": "cppbuild",' >> .vscode/tasks.json
	echo '            "label": "C/C++: clang build active file",' >> .vscode/tasks.json
	echo '            "command": "{{clang_which}}",' >> .vscode/tasks.json
	echo '            "args": [' >> .vscode/tasks.json
	echo '                "-c",' >> .vscode/tasks.json
	echo '                "-fcolor-diagnostics",' >> .vscode/tasks.json
	echo '                "-fansi-escape-codes",' >> .vscode/tasks.json
	echo '                "-g",' >> .vscode/tasks.json
	echo '                "${file}",' >> .vscode/tasks.json
	echo '                "-o",' >> .vscode/tasks.json
	echo '                "${fileDirname}/target/${fileBasenameNoExtension}"' >> .vscode/tasks.json
	echo '            ],' >> .vscode/tasks.json
	echo '            "options": {' >> .vscode/tasks.json
	echo '                "cwd": "${fileDirname}"' >> .vscode/tasks.json
	echo '            },' >> .vscode/tasks.json
	echo '            "problemMatcher": [' >> .vscode/tasks.json
	echo '                "$gcc"' >> .vscode/tasks.json
	echo '            ],' >> .vscode/tasks.json
	echo '            "group": {' >> .vscode/tasks.json
	echo '                "kind": "build",' >> .vscode/tasks.json
	echo '                "isDefault": true' >> .vscode/tasks.json
	echo '            },' >> .vscode/tasks.json
	echo '            "detail": "Task generated by Debugger."' >> .vscode/tasks.json
	echo '        }' >> .vscode/tasks.json
	echo '    ],' >> .vscode/tasks.json
	echo '    "version": "2.0.0"' >> .vscode/tasks.json
	echo '}' >> .vscode/tasks.json	
```

# fix 1
The real build is clean on both compilers under the project's strict flags. The LSP diagnostics you may see (`constexpr`/`count` "undeclared") are a clangd artifact — the language server is parsing the file without `-std=c23`, so it doesn't recognize the C23 `constexpr` keyword. The code itself is valid C23 and compiles cleanly (verified above with both `clang` and `gcc` under `-std=c23 -pedantic-errors -Werror`).

If you want clangd to stop flagging it, regenerate its compile database (the project has a recipe for this):

```
just clangd
```

## What changed

I replaced the interactive `kbhit()` busy-loop (`termios`/`fcntl` non-blocking I/O, only exits on `q`) with a small, self-terminating program built for debugger testing:

- **`sum_range()`** — a small static function, ideal for practicing **step-into**.
- **`values[]`** — a fixed array to **inspect/watch** in the variables pane.
- **Two loops** — good places for **breakpoints** and **stepping**.
- **`constexpr int count`** — a small C23 touch, since the whole project targets C23.
- **No interactivity** — it runs, prints, and exits cleanly, so every `just` recipe (debug/release/sanitizers/cmake) terminates on its own instead of hanging on keypresses.

Want me to also add a deliberately-steppable second function (e.g. recursion or a small bug to track down), or keep it at this minimal size?


# fix 2

- Fixed. All three cmake recipes now build cleanly (exit 0) and place the binary in the right subdir.

## Root cause of `cr`

`CMakeLists.txt` sets the output dir to a config-named folder:

```cmake
RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<LOWER_CASE:$<CONFIG>>"
```

The old `cr` didn't pass `-DCMAKE_BUILD_TYPE`, so `$<CONFIG>` was **empty** → the binary was emitted to the project root, not a `debug/` subdir. Then:

```just
mv {{project_name}} debug   # renamed the binary to a FILE named "debug"
mv debug {{target_dir}}     # moved that file into target/  →  target/debug is now a file
./target/debug/{{project_name}}   # "Not a directory"
```

## The fix

`cr` now passes `-D CMAKE_BUILD_TYPE=Debug`, so CMake emits the binary to `./debug/<project>` (matching the generator expression), and a single `mv` relocates that whole directory:

```just
cmake -D CMAKE_BUILD_TYPE=Debug -D CMAKE_C_COMPILER={{gcc_which}} -G Ninja .
ninja
mv build.ninja CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log debug {{target_dir}}
./{{target_dir}}/debug/{{project_name}}
```

I also fixed the two sibling recipes, which had the **same bug class**:
- **`cro`** (RelWithDebInfo) referenced `release/`, but that config emits to `relwithdebinfo/` — now matches. It also never created `target/` (it made an unused `build/`), so the multi-source `mv` would have failed.
- **`cro3`** (Release) had the same missing-`target/` problem — fixed.

Resulting layouts: `target/debug/`, `target/relwithdebinfo/`, `target/release/`.

One thing to note: `main.c` is an interactive `kbhit()` loop that only exits on `q`, so each recipe's final run line launches a program that waits for keypresses (I verified by piping `q` with a timeout). That's inherent to how the recipes are written — let me know if you'd rather drop the auto-run line.
