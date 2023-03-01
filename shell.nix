let
  nixpkgs = builtins.getFlake github:NixOS/nixpkgs/nixos-unstable;
  pkgs = import nixpkgs {
    config.allowUnfree = true;
    config.cudaSupport = true;
  };
in

with pkgs;
with cudaPackages;

# TODO: use cudaPackages.backendStdenv when it's merged
(mkShell.override { stdenv = gcc11Stdenv; }) {
  packages = [
    cmake
    pkg-config
    cuda_nvcc
  ];
  buildInputs = [
    cudnn
    cuda_cudart
    cuda_nvrtc
    cuda_nvtx
    libcurand
    libcublas
    libcufft
    python3Packages.torch.dev
  ];

  env.TORCH_CUDA_ARCH_LIST = lib.concatStringsSep ";" [ "8.6" ];
}
