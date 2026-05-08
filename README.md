## TLDR; Building and serving locally

``` shell
nix-shell --run 'bundle exec jekyll serve'
```

## Using Nix to build Jekyll sites

Jekyll is a Ruby application... Like always, we need to convert a native build script (`Gemfile` in this case)
to a Nix derivation. Bundix does that (Step 1). Then we create a simple nix-shell (Step 2) that uses that derivation
and call `bundler`, the Ruby build tool, which builds the site (Step 3).

### Step 1: Bundix

``` shellsession
❯ nix-shell -p bundler -p bundix --run 'bundler update; bundler lock; bundler package --no-install --path vendor; bundix; rm -rf vendor .bundle'
```

This is only needed when something about Ruby Gems setup needs to be changed (e.g., update or add gems).

### Step 2: standard `shell.nix`

``` nix
with (import <nixpkgs> {});
let
  gems = bundlerEnv {
    name = "your-package";
    inherit ruby;
    gemdir = ./.;
  };
in stdenv.mkDerivation {
  name = "your-package";
  buildInputs = [gems ruby];
}
```

### Step 3: run

(what is said in TLDR; above)

## Troubleshooting

## Hash mismatch

E.g.:

``` 
error: hash mismatch in fixed-output derivation '/nix/store/1szw62nnrd2vy1873jaydhq9w56aqlwc-ffi-1.17.4.gem.drv':
         specified: sha256-nT2xTC6uB0s4L6nAg/6VrsbgoUUdoknqsJbDQAK8dS0=
            got:    sha256-vNFkLgbw0W/J4JrG1Jw6cpi5eJvLWBJzAvk05DfWCs8=
```

What helps is to `rm Gemfile.lock gemset.nix` and re-run Steps 1 and 3 above.
