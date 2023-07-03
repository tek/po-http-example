{
  description = "A Haskell project";

  inputs.hix.url = "github:tek/hix?ref=0.5.6";
  inputs.polysemy-http.url = "github:tek/polysemy-http";

  outputs = {hix, polysemy-http, ...}: hix.lib.flake {
    hackage.versionFile = "ops/version.nix";
    depsFull = [polysemy-http];

    cabal = {
      license = "BSD-2-Clause-Patent";
      license-file = "LICENSE";
      author = "Author";
      ghc-options = ["-Wall"];
    };

    packages.po-http-example = {
      src = ./.;
      cabal.meta.synopsis = "A Haskell project";

      library = {
        enable = true;
        dependencies = [
          "polysemy-http"
        ];
      };

      executable.enable = true;

      test = {
        enable = true;
        dependencies = [
          "hedgehog >= 1.1 && < 1.3"
          "tasty ^>= 1.4"
          "tasty-hedgehog >= 1.3 && < 1.5"
        ];
      };

    };
  };
}
