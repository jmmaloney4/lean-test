```shell
nix build .#lean-dev -o .lean-toolchain
code .
```
Then set the lean toolchain path to `.lean-toolchain`, and restart the lean server.
