with (import <nixpkgs> {});
let
  gems = bundlerEnv {
    name = "my-website-deps";
    inherit ruby;
    gemdir = ./.;
  };
in stdenv.mkDerivation {
  name = "my-website";
  buildInputs = [gems ruby];
}
