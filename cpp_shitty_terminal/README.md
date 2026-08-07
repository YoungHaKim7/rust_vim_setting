- https://github.com/pg83/shitty


```bash
st -font 'Hack Nerd Font' -fontsize 40
```

# openSUSE Install(260807)

```bash
sudo zypper install wayland-protocols-devel ragel rsvg-convert
sudo zypper --non-interactive install glslang-devel
```

## Root cause

The build graph (`third_party/plt/build.py:42`) runs:
```python
protocol_root = pkg_config_variable("wayland-protocols", "pkgdatadir")
```
That `pkg-config --variable=pkgdatadir wayland-protocols` call fails because the `wayland-protocols` pkg-config package isn't installed. On openSUSE Tumbleweed it ships as `wayland-protocols-devel`.

I checked all the build's other Wayland/font/Vulkan deps — `wayland-client`, `xkbcommon`, `freetype2`, `fontconfig`, `harfbuzz`, and `vulkan` are all already present. **`wayland-protocols` is the only thing missing.**

## Fix

Run this (the `!` prefix runs it in this session so output lands here):

```
! sudo zypper install wayland-protocols-devel
```

The package provides `pkgconfig(wayland-protocols) = 1.49`, which is exactly what the failing call needs. After it installs, re-run `./build -j 8` and it should get past the graph-import stage.

Want me to run the build again once you've installed it?

sudo needs a password, so I can't install it directly — but the diagnosis is clear and no code change is needed. Here's the situation and fix:

## Diagnosis

The build compiles the Vulkan compute shader (`render.comp`) into SPIR-V for 17 pixel-format variants. That step shells out to `glslangValidator` (hardcoded in `build.py:284`):

```
FAIL render_shader_rgba8_unorm.inc: ... FileNotFoundError: 'glslangValidator'
```

Your machine has Vulkan runtime/tooling (`vulkaninfo` works) but **not** the shader validator. On openSUSE, `glslangValidator` ships in the `glslang-devel` package — it isn't a separate binary package, which is why `which glslangValidator` misses it.

(`spirv-cross` is *also* referenced in `build.py`, but only inside the `if darwin:` Metal block — it won't run on Linux, so you don't need it.)

## Fix

Install the one missing package (needs your sudo password, so run it yourself):

```
! sudo zypper --non-interactive install glslang-devel
```

The `!` prefix runs it here so the output lands in the session; or run it in your own terminal. After it finishes, re-run:

```
./build -j 8
```

The build calls `glslangValidator` through `PATH`, so once installed it'll be picked up automatically — no config change required.

Want me to kick off `./build -j 8` again once you've confirmed the package is installed?
