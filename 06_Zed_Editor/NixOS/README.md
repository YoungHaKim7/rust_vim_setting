# zed (nix run으로 실행)
- https://wiki.nixos.org/wiki/Zed

```bash
sudo nix run github:zed-industries/zed --extra-experimental-features nix-command --extra-experimental-features flakes

sudo ZED_ALLOW_ROOT=true nix run github:zed-industries/zed --extra-experimental-features nix-command --extra-experimental-features flakes 
```

The issue is that you're not configured as a trusted user in Nix, so the Zed flake's substituter configuration is being ignored. Here are your options:

You have a few options to add `ZED_ALLOW_ROOT=true`:

## Option 1: Inline with command (no file modification needed)
```bash
sudo ZED_ALLOW_ROOT=true nix run github:zed-industries/zed --extra-experimental-features nix-command --extra-experimental-features flakes
```

## Option 2: Add to fish config (~/.config/fish/config.fish)
Add this line anywhere in the file (e.g., after line 55, near other environment variables):

```fish
set -gx ZED_ALLOW_ROOT true
```

## Option 3: Add to shell.nix (project-specific)
Modify your `shell.nix` to include the environment variable:

```nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    rustc
    cargo
    rust-analyzer
    llvmPackages.clang
  ];
  shellHook = ''
    export ZED_ALLOW_ROOT=true
  '';
}
```

**Recommendation:** Use **Option 1** (inline) if you only need this occasionally, or **Option 2** (fish config) if you want it set permanently for all sessions.

## Option 1: Add yourself as a trusted user (recommended)

Edit `/etc/nix/nix.conf` (as root) and add:

```conf
trusted-users = gy
```

Or allow all users:

```conf
trusted-users = *
```

Then restart the nix-daemon:

```bash
sudo systemctl restart nix-daemon
```

Now the original `nix run` command should work.

## Option 2: Run with sudo (quick workaround)

```bash
sudo nix run github:zed-industries/zed --extra-experimental-features nix-command --extra-experimental-features flakes
```

## Option 3: Configure substituters system-wide

Add to `/etc/nix/nix.conf`:

```conf
extra-substituters = https://zed.cachix.org https://cache.garnix.io
extra-trusted-public-keys = zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU= cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=
```

Then restart the daemon with `sudo systemctl restart nix-daemon`.

---

**Option 1** is the cleanest for development, as it lets you run experimental Nix commands without sudo.
