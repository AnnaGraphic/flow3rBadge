{ pkgs ? import <nixpkgs> {} }:

let
  mpremote-packageset = ps: with ps; [
    (
      buildPythonPackage rec {
        pname = "mpremote";
        version = "1.20.0";
        src = fetchPypi {
          inherit pname version;
          sha256 = "sha256-XDQnYqBHkTCd1JvOY8cKB1qnxUixwAdiYrlvnMw5jKI=";
        };
        doCheck = false;
        postPatch = ''
          ln -s ${./setup-mpremote.py} setup.py
          '';
        propagatedBuildInputs = [
          pyserial
          importlib-metadata
        ];
      }
    )
  ];
  python-with-mp-remote = pkgs.python3.withPackages mpremote-packageset;
in
pkgs.mkShell {
  nativeBuildInputs = [
    python-with-mp-remote
  ];
}
