# zed (nix run으로 실행)
- https://wiki.nixos.org/wiki/Zed

```bash
sudo nix run github:zed-industries/zed --extra-experimental-features nix-command --extra-experimental-features flakes
```

The issue is that you're not configured as a trusted user in Nix, so the Zed flake's substituter configuration is being ignored. Here are your options:

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
