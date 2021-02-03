# Nix pack kangle-3.5.13.2(linux-centos7)


## Build or Install in Nix Environment

### Build

To build this program by Nix, clone or download this project and run the following command at the root directory of the project:

```bash
nix-build
```

or the long version by specifying the file: `nix-build default.nix`, or even doing instantiate and realise step-by-step: `nix-store -r $(nix-instantiate default.nix)`.

### Install

To install this program in Nix Environment, run the following command at the root directory of the project:

```bash
nix-env -i -f default.nix
```

or the long version: `nix-env --install --file default.nix`.

### Inspect

You can get the out path by running `nix-store -q --outputs $(nix-instantiate default.nix)` or `nix eval '("${import ./default.nix}")'` before installation, or `nix-env -q --out-path --no-name hello` after installing.

To see the contents of the .drv file, run: `nix show-derivation $(nix-instantiate default.nix)` or `nix show-derivation $(nix-store -q --deriver $(nix eval '("${import ./default.nix}")' | cut -d '"' -f 1))`.


## References

- [Nix Pills](https://nixos.org/nixos/nix-pills/)

## run

```shell
# debug run
sudo ~/.nix-profile/bin/kangle -d 3
# centos runing
# wsl not runing
```
### Share Use

```shell
# add channel
nix-channel --add https://github.com/jcleng/nix-kangle-3.5.13.2/archive/master.tar.gz kangle

# use cachix binary file
cachix use jcleng-pub

# update
nix-channel --update

# search
nix-env -aqP|grep kangle

# install
nix-env -i kangle
```
