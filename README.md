# Using libtorch with nix-shell

Enter the dev environment with `nix-shell` or `direnv allow` and build:

```bash
cmake -B build/ -S . -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_INSTALL_RPATH=/run/opengl-driver/lib
cmake --build build/
./build/some
```

Note: `-DCMAKE_EXPORT_COMPILE_COMMANDS` will generate
`./build/compile_commands.json` for your `nvim-lspconfig`, and
`-DCMAKE_INSTALL_RPATH` will ensure our binary knows to find `libcuda.so` where
it belongs
