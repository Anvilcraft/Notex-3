# Notex-3
MZTE fork of the notex3 modpack

## building
Compiling requires [the haxe toolkit](https://haxe.org) to be installed, in order to compile KubeJS scripts and [modpacktools](https://github.com/Anvilcraft/modpacktools) to build the modpack.

Run these commands
```sh
# (only required on first build) install kubejs-haxe bindings
haxelib install kubejs
# build haxe scripts
./buildhaxe.sh
# use modpacktools to compile modpack
mpt buildtwitch
```
exports can be found in `build`

