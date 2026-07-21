# justfile sample(C++26 , openSUSE260721)

```justfile
# Detect OS
os := `uname`

# project name
project_name := `basename "$(pwd)"`
full_project_name := `pwd`

# clang & g++ basic & clang-format basic & cmake basic
clang := `which clang`
clangpp := `which clang++`
gpp := `which g++`
clang_format_basic := `which clang-format`
cmake := `which cmake`

# compiler settings
clang_which := if os == "Linux" { \
  "/usr/bin/clang++" \
  } else if os == "Darwin" { \
    "/opt/homebrew/opt/llvm/bin/clang++" \
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
gpp_which := if os == "Linux" { \
    "/usr/bin/g++" \
  } else if os == "Darwin" { \
    "/opt/homebrew/opt/gcc@15/bin/g++-15" \
  } else { \
    gpp \
  }

# cmake settings(4.0)
cmake_which := if os == "Linux" { \
    cmake \
  } else if os == "Darwin" { \
    "/opt/homebrew/bin/cmake"
  } else { \
    cmake \
  }

# clang-format 21
clang_format := if os == "Linux" { \
    "clang-format" \
  } else if os == "Darwin" { \
    "/opt/homebrew/opt/llvm/bin/clang-format" \
  } else { \
    clang_format_basic \
  }

# fmt .clang-format(linuxOS / macOS)
fmt_flags := if os == "Linux" { \
    ". -regex '.*\\.\\(cpp\\|hpp\\|cc\\|cxx\\|ixx\\|cppm\\|c\\|h\\)' -exec " \
    +clang_format+ \
    " -style=file -i {} \\;" \
  } else if os == "Darwin" { \
    ". -iname '*.cpp' \
    -o -iname '*.hpp' \
    -o -iname '*.cc' \
    -o -iname '*.c' \
    -o -iname '*.cxx' \
    -o -iname '*.cppm' \
    -o -iname '*.ixx' \
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
  -e cppm \
  -e ixx \
  -e cc \
  -e cxx -x " \
  +clang_format+  \
  " -style=file -i {} \\;"

# Source and target directories
src_dir := "./src"
target_dir := "./target"

# Files
source := src_dir+"/main.cpp"
target := target_dir+"/"+project_name

# Optimize (O2(RelWithDebInfo), O3(Release))
ldflags_optimize :=  "-std=c++2c -Wall -O2 -pedantic -pthread -pedantic-errors -lm -Wextra -ggdb"
ldflags_optimize03 :=  "-std=c++2b -Wall -O3 -pedantic -pthread -pedantic-errors -lm -Wextra -ggdb"
# Optimize LTO
ldflags_optimize_lto := "-flto"

# Common flags
ldflags_common := "-std=c++2c -pedantic -pthread -pedantic-errors -lm -Wall -Wextra -ggdb -Werror"
ldflags_debug := "-std=c++2c -pthread -lm -Wall -Wextra -ggdb"
ldflags_emit_llvm := "-S -emit-llvm"
ldflags_assembly := "-Wall -save-temps"
ldflags_fsanitize_address := "-g -fsanitize=address -fno-omit-frame-pointer -c"
ldflags_fsanitize_object := "-g -fsanitize=address"
ldflags_fsanitize_thread := "-g -fsanitize=thread -fno-omit-frame-pointer -c"
ldflags_fsanitize_thread_object := "-g -fsanitize=thread"
ldflags_fsanitize_valgrind := "-fsanitize=address -g3"
ldflags_fsanitize_valgrind_O0 := "-O0 -g -std=c23 -pedantic -pthread -pedantic-errors -lm -Wall -Wextra -ggdb -Werror"
ldflags_fsanitize_leak := "-fsanitize=leak -g"

# (C)gpp compile(LinuxOS)
r:
	just fm
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	{{gpp_which}} {{ldflags_common}} -o {{target_dir}}/{{project_name}} {{source}}
	{{target}}

# (C)clang compile(Optimization/LinuxOS/ macOS)
ro:
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	{{clang_which}} {{ldflags_optimize}} -o {{target_dir}}/{{project_name}} {{source}}
	{{target}}

# (C)g++ compile(Optimization03) / https://clang.llvm.org/docs/UsersManual.html
ro3:
	rm -rf target
	mkdir -p target
	g++ {{ldflags_optimize03}} -o {{target}} {{source}}
	{{target}}

# (C)g++ compile(Optimization03 + LTO) / https://clang.llvm.org/docs/UsersManual.html
rolto:
	rm -rf target
	mkdir -p target
	g++ {{ldflags_optimize_lto}} {{ldflags_optimize03}} -o {{target}} {{source}}
	{{target}}

# cmake compile debug(LinuxOS)
cr:
	just fm
	rm -rf target
	mkdir -p target
	export CXX={{clangpp}}
	cmake -D CMAKE_BUILD_TYPE=Debug \
	      -D CMAKE_CXX_COMPILER={{clangpp}} \
	      -G Ninja .
	ninja
	mv build.ninja CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log target
	mv debug target
	./target/debug/{{project_name}}

# cmake compile release O3(LinuxOS)
cr3:
	just fm
	rm -rf target
	mkdir -p target
	export CXX={{clangpp_which}}
	cmake -D CMAKE_BUILD_TYPE=Release \
	      -D CMAKE_CXX_FLAGS_RELEASE_INIT="-O3 -DNDEBUG" \
	      -D CMAKE_CXX_COMPILER={{clangpp_which}} \
	      -G Ninja .
	ninja
	mv build.ninja CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log target
	mv release target
	./target/release/{{project_name}}

# cmake compile release O2(LinuxOS)
cro:
	rm -rf target
	mkdir -p target
	cmake -D CMAKE_BUILD_TYPE=RelWithDebInfo \
	      -D CMAKE_CXX_COMPILER={{clangpp_which}} \
	      -D CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT="-O2 -g" \
	      -G Ninja .
	ninja
	mv build.ninja CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log target
	mv relwithdebinfo target
	./target/relwithdebinfo/{{project_name}}

# cmake compile release O3(LinuxOS)
cro3:
	rm -rf target
	mkdir -p target
	cmake -D CMAKE_BUILD_TYPE=Release \
	      -D CMAKE_CXX_COMPILER={{clangpp_which}} \
	      -D CMAKE_CXX_FLAGS_RELEASE_INIT="-O3 -DNDEBUG" \
	      -G Ninja .
	ninja
	mv build.ninja CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log target
	mv release target
	./target/release/{{project_name}}

# zig C compile(LinuxOS)
zr:
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	export CXX={{gpp_which}}
	zig c++ {{ldflags_common}} -o {{target}} {{source}}
	{{target}}

# cmake ctest
ctest:
	rm -rf target
	mkdir -p target
	cmake -D CMAKE_CXX_COMPILER={{gpp_which}} \
		  -S . -B target
	cmake --build target
	ctest --test-dir ./target

# clang build(target folder)
b:
	rm -rf {{target_dir}}
	mkdir -p {{target_dir}}
	{{clang_which}} {{ldflags_debug}} -o {{target}} {{source}}

# clangd .cache(c23 LSP build)
clangd:
	rm -rf build target .cache
	{{cmake_which}} -DCMAKE_BUILD_TYPE:STRING=Debug \
					-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
					-DCMAKE_C_COMPILER:FILEPATH={{clang_which}} \
					-DCMAKE_CXX_COMPILER:FILEPATH={{clangpp_which}} --no-warn-unused-cli \
					-S {{full_project_name}} \
					-B {{full_project_name}}/target \
					-G Ninja

# move target
move:
	rm -rf {{target_dir}}
	mkdir {{target_dir}}
	mv CMakeCache.txt CMakeFiles cmake_install.cmake .ninja_deps .ninja_log build.ninja *.bc *.i *.s *.o *.ll a.out target

# .clang-format init(LinuxOS/macOS)
cl:
	rm -rf .clang-format
	{{clang_format}} -style=LLVM -dump-config > .clang-format

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

# Clang Sanitize(ASan=address / LSan=leak / TSan=thread / MSan=memory / UBSan=undefined (Undefined Behavior) / https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
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
	valgrind --leak-check=full {{target_dir }}/{{project_name}}

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
	rm -rf build CMakeCache.txt CMakeFiles .cache build.ninja cmake_install.cmake .ninja_deps .ninja_log target

# C++ 26 init(int main(void))
init:
	mkdir -p src
	echo '# BasedOnStyle: LLVM' > .clang-format
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
	echo '#include <print>' > src/main.cpp
	echo '' >> src/main.cpp
	echo 'int main(void) {' >> src/main.cpp
	echo '        std::print("Hello world Cpp 26 lang ");' >> src/main.cpp
	echo '    return 0;' >> src/main.cpp
	echo '}' >> src/main.cpp

# C++ 20 init(int main(void))
init2:
	mkdir -p src
	echo '# BasedOnStyle: LLVM' > .clang-format
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
	echo '#include <iostream>' > src/main.cpp
	echo '' >> src/main.cpp
	echo 'int main() {' >> src/main.cpp
	echo '        std::cout << ("Hello world Cpp 20 lang ") << std::endl;' >> src/main.cpp
	echo '    return 0;' >> src/main.cpp
	echo '}' >> src/main.cpp

# C++ init(int main(int argc, char* argv[]))
init3:
	mkdir -p src
	echo '# BasedOnStyle: LLVM' > .clang-format
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
	echo '#include <iostream>' > src/main.cpp
	echo '' >> src/main.cpp
	echo 'int main(int argc, char* argv[]) {' >> src/main.cpp
	echo '    std::cout << "Hello world C lang " << std::endl;' >> src/main.cpp
	echo '    int i;' >> src/main.cpp
	echo '    ' >> src/main.cpp
	echo '    for (i=0; i < argc; i++) {' >> src/main.cpp
	echo '        printf("%s", argv[i]);' >> src/main.cpp
	echo '    }' >> src/main.cpp
	echo '    return 0;' >> src/main.cpp
	echo '}' >> src/main.cpp

# C++ init(int main(int argc, char** argv))
init4:
	mkdir -p src
	echo '# BasedOnStyle: LLVM' > .clang-format
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
	echo '#include <iostream>' > src/main.cpp
	echo '#include <vector>' >> src/main.cpp
	echo '#include <algorithm>' >> src/main.cpp
	echo '#include <iterator>' >> src/main.cpp
	echo '' >> src/main.cpp
	echo 'template <typename C>' >> src/main.cpp
	echo 'void reverse_sort(C& c)' >> src/main.cpp
	echo '{' >> src/main.cpp
	echo '    sort(begin(c), end(c), [](auto x, auto y){ return x > y; });' >> src/main.cpp
	echo '}' >> src/main.cpp
	echo '' >> src/main.cpp
	echo 'int main(int argc, char** argv) {' >> src/main.cpp
	echo '    std::cout << "Hello world C++ reverse sort " << std::endl;' >> src/main.cpp
	echo '    std::vector<int> v= {3, 7, 2, 9};' >> src/main.cpp
	echo '    ' >> src/main.cpp
	echo '    std::sort(begin(v), end(v));' >> src/main.cpp
	echo '    std::copy(cbegin(v), cend(v), std::ostream_iterator<int>(std::cout, ", "));' >> src/main.cpp
	echo '    std::cout << std::endl;' >> src/main.cpp
	echo '    ' >> src/main.cpp
	echo '    // sort(begin(v), end(v), [](auto x, auto y){ return x > y; });' >> src/main.cpp
	echo '    reverse_sort(v); ' >> src/main.cpp
	echo '    std::copy(begin(v), end(v), std::ostream_iterator<int>(std::cout, ", "));' >> src/main.cpp
	echo '    std::cout << std::endl;' >> src/main.cpp
	echo '    std::cout << "number of arguments: " << argc << std::endl;' >> src/main.cpp
	echo '    for (int i = 0; i < argc; ++i) {' >> src/main.cpp
	echo '        std::cout << "argv[" << i << "]: " << argv[i] << std::endl;' >> src/main.cpp
	echo '    }' >> src/main.cpp
	echo '    ' >> src/main.cpp
	echo '    if (argc < 2) {' >> src/main.cpp
	echo '        std::cout << "Usage: " << argv[0] << " <name>" << std::endl;' >> src/main.cpp
	echo '        return 1;' >> src/main.cpp
	echo '    }' >> src/main.cpp
	echo '    ' >> src/main.cpp
	echo '    std::cout << "Hello, " << argv[1] << "!" << std::endl;' >> src/main.cpp
	echo '    ' >> src/main.cpp
	echo '    return 0;' >> src/main.cpp
	echo '}' >> src/main.cpp

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
	echo '            "program": "${workspaceFolder}/target/debug/${workspaceFolderBasename}",' >> .vscode/launch.json
	echo '            "args": [],' >> .vscode/launch.json
	echo '            "cwd": "${workspaceFolder}"' >> .vscode/launch.json
	echo '            // "preLaunchTask": "C/C++: clang build active file"' >> .vscode/launch.json
	echo '        },' >> .vscode/launch.json
	echo '        {' >> .vscode/launch.json
	echo '            "name": "g++ - Build and debug active file",' >> .vscode/launch.json
	echo '            "type": "lldb",' >> .vscode/launch.json
	echo '            "request": "launch",' >> .vscode/launch.json
	echo '            "program": "${fileDirname}/target/debug/${workspaceFolderBasename}",' >> .vscode/launch.json
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
	echo '                "${fileDirname}/target/debug/${workspaceFolderBasename}"' >> .vscode/tasks.json
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
	echo '            "name": "g++ - Build and debug active file",' >> .vscode/launch.json
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

# Result

```bash
Hello world C++ 26 lang

Number of CPU cores: 20
Total elements: 100000
Chunk size: 5000
Total sum of sqrt(1..100000): 21082008.97

```

# single thread code

- Perfect! The code compiled and ran successfully. Here's what I did to convert it from parallel chunks to single-threaded:

**Key changes made:**

1. **Removed parallel execution headers** - Removed `<execution>`, `<thread>`, and `<algorithm>` (for `std::for_each`)

2. **Removed chunking logic** - Eliminated:
   - `std::thread::hardware_concurrency()` 
   - Chunk size calculation
   - `std::vector<double> partial_sums`
   - The parallel `std::for_each` loop with `std::execution::par`

3. **Simplified to single transform-and-sum** - Now it just:
   - Transforms the entire vector with `std::sqrt` in one pass
   - Sums the transformed values directly

**Output shows it works correctly:**
```
Hello world C++ - Single-threaded version

Total elements: 100000
Total sum of sqrt(1..100000): 2.1082e+07
```

The clangd warnings about `std::ranges` are false positives - the code compiles and runs perfectly with GCC. The language server might need its compile commands database refreshed.

Your code is now a clean, simple single-threaded implementation without any parallel chunks or threading complexity.

