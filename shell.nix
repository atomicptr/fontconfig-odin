{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    fontconfig
    odin
    pkg-config
  ];
}
