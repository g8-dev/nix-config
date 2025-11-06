{ inputs, ... }: {

  # For every flake input, aliases 'pkgs.inputs.${flake}' to
  # 'inputs.${flake}.packages.${pkgs.system}' or
  # 'inputs.${flake}.legacyPackages.${pkgs.system}'
  flake-inputs = final: _: {
    inputs = builtins.mapAttrs (_: flake:
      let
        legacyPackages = (flake.legacyPackages or { }).${final.system} or { };
        packages = (flake.packages or { }).${final.system} or { };
      in if legacyPackages != { } then legacyPackages else packages) inputs;
  };
  modifications = final: prev: {
    nchat = prev.nchat.overrideAttrs (old: rec {
      version = "4.41";
      pname = "nchat";
      src = prev.fetchFromGitHub {
        owner = "d99kris";
        repo = pname;
        rev = "v${version}";
        hash = "sha256-P+QprQDXUv5uCa/6+RXYImWDL0DIG+p8KFiGPwK+q0g=";
      };
      cmakeFlags = [ ];
    });
  };

  neorg = inputs.neorg-overlay.overlays.default;
}
