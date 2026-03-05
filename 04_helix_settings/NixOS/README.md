# nixos (helix)
- https://docs.helix-editor.com/package-managers.html#nixos
- https://docs.cachix.org/installation
```bash
$ nix profile install --accept-flake-config nixpkgs#cachix --extra-experimental-features flakes --extra-experimental-features nix-command
warning: 'install' is a deprecated alias for 'add'
error: An existing package already provides the following file:

         /nix/store/siqy0d2pwvkjzx8rmmdlkw38d1rf9f11-cachix-1.10.1-bin/share/fish/vendor_completions.d/cachix.fish

       This is the conflicting file from the new package:

         /nix/store/q7rh6v6flhvyiyfz2q9lwhip8jbax1ym-cachix-1.10.1-bin/share/fish/vendor_completions.d/cachix.fish

       To remove the existing package:

         nix profile remove cachix

       The new package can also be added next to the existing one by assigning a different priority.
       The conflicting packages have a priority of 5.
       To prioritise the new package:

         nix profile add flake:nixpkgs#legacyPackages.x86_64-linux.cachix --priority 4

       To prioritise the existing package:

         nix profile add flake:nixpkgs#legacyPackages.x86_64-linux.cachix --priority 6

~ took 3s 
$ cachix use helix

This user doesn't have permissions to configure binary caches.

You can either:

a) Run the same command as root to write NixOS configuration.

b) Add the following to your configuration.nix to add your user as trusted 
   and then try again:

  nix.settings.trusted-users = [ "root" "gy" ];


~ 
$ sudo cachix use helix
[sudo] password for gy: 
Sorry, try again.
[sudo] password for gy: 
Cachix configuration written to /etc/nixos/cachix.nix.
Binary cache helix configuration written to /etc/nixos/cachix/helix.nix.

To start using cachix add the following to your /etc/nixos/configuration.nix:

    imports = [ ./cachix.nix ];

Then run:

    $ sudo nixos-rebuild switch

```
