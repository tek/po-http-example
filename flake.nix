{
  description = "A Haskell project";

  inputs.hix.url = "github:tek/hix?ref=0.5.6";

  outputs = {hix, ...}: hix.lib.flake {
    hackage.versionFile = "ops/version.nix";

    cabal = {
      license = "BSD-2-Clause-Patent";
      license-file = "LICENSE";
      author = "Author";
      ghc-options = ["-Wall"];
    };

    overrides = {hackage, unbreak, ...}: {
      exon = unbreak;
      polysemy-resume = unbreak;
      polysemy = hackage "1.9.1.0" "05mhzjz6hz0dnxsn3cc0l6yyj5ch35gn8xfnx0a1gn3q8yljfg2a";
      flatparse = hackage "0.4.1.0" "0z9q5qb3yz4phvj1wq06dld745m98yk4gvkmj1vkq7hda0mn182a";
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
