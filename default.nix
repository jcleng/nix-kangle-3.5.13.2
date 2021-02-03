with import <nixpkgs> {}; stdenv.mkDerivation {
  name = "kangle-3.5.13.2";

  # Source Code
  # See: https://nixos.org/nixpkgs/manual/#ssec-unpack-phase
  src = ./src;

  # Dependencies
  # See: https://nixos.org/nixpkgs/manual/#ssec-stdenv-dependencies
  buildInputs = [ coreutils gcc9 pcre openssl libaio zlib pcre];

  # Build Phases
  # See: https://nixos.org/nixpkgs/manual/#sec-stdenv-phases
  configurePhase = ''
    declare -xp
  '';
  buildPhase = ''
    echo "------1实际编译的地址(会吧bin目录放到该文件夹)out_dir:"
    echo "------2把源码(如: configure文件就在src里面)放到src目录:"
    echo $out
    echo $src
    echo "初始化环境:"
    ./configure --prefix=$out --exec-prefix=$out
    echo "开始编译:"
    make -j4
  '';
  installPhase = ''
    # nix-env -i -f default.nix
    echo "安装:"
    make install
  '';
}
