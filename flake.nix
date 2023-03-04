{
  description = "My Lean package";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    lean = {
      url = "github:leanprover/lean4";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, lean, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import lean.inputs.nixpkgs { inherit system; };
      leanPkgs = lean.packages.${system};
      pkg = leanPkgs.buildLeanPackage {
        name = "main";  # must match the name of the top-level .lean file
        src = ./.;
      };
    in {
      packages = pkg // {
        inherit (leanPkgs) lean;
        default = pkg.modRoot;
      };

      devShells = {
        default = pkgs.mkShell {
          buildInputs = [ pkg.modRoot pkgs.elan ];
        };
      };

    });
}
