# nvim configs for rust development

recently, i develop serveral projects in Rust by `Vscode` but i can't delvelop smoothly with
'Vscode' because it consumes so much CPUs and resources
so, i decide to develop Project by `Neovim`.
when i search about nvim config for Rust development, There are several variations of nvim
configs that i can't choose proper approach

Finally, i made my nvim config for mt self, and i share this configuration for those in need

it is based on [cosynvim](https://github.com/glepnir/cosynvim)

## Prerequisite
you should install package below
- lazy-git

## How to use
just paste this project in `$HOME/.config/nvim`

and then run command in nvim `:PackerInstall`
also you need to install `rust-analyzer` and `codelldb`. these can be install by `Mason`

run `:MasonInstall rust-analyzer codelldb`. it will install rust_analyzer and codelldb

## Note
this configuration is being delveloped continousely, it might have some error while you use this.

feel free to give issues to me then, i will figure out the issues

