{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flakeutils.url = "github:numtide/flake-utils";
  };

  outputs = inputs:
    inputs.flakeutils.lib.eachDefaultSystem (system:
      let
        pkgs = import inputs.nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };
      in
      rec {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            pkgs.nodejs
          ];
          shellHook = ''
          '';
        };
      }
    );
}
