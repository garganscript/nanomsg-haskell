{
  description = "nanomsg-haskell dependencies";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
          buildInputs = [ pkgs.gmp pkgs.nanomsg pkgs.pkg-config ];
      in
      {
        devShells.default = pkgs.mkShell {
          inherit buildInputs;
        };
      }
    );
}
