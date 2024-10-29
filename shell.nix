{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  shellHook =
    ''
      eval "$(/Users/van/miniconda3/bin/conda shell.zsh hook)"
      conda activate num-lin-alg
      make_emacs_info_happy -dir_file=.info/nix-profile/share/info -info_dir=~/.nix-profile/share/info
      export INFOPATH=$(pwd)/.info/nix-profile/share/info:$INFOPATH
      zsh
    '';

  buildInputs = [
    pkgs.git
    pkgs.pandoc           # to make a pdf of Jupyter notebooks
    pkgs.texliveFull      # xelatex, also needed to make a pdf of Jupyter notebooks
    pkgs.python312
  ];
}
