{ lib, stdenv, fetchFromGitHub, nim }:

stdenv.mkDerivation rec {
  pname = "nitchrevived";
  version = "0.1.7.3";

  src = fetchFromGitHub {
    owner = "gnuvalerie";
    repo = "nitchrevived";
    rev = "b7a35f5e70a11508ef48329cdaf2693353365bf9";
    sha256 = "sha256-5Ig0GQNn01bL15wJh8bRY2mJzZHeR+1YCyf0qoDuWpY=";
  };

  nativeBuildInputs = [ nim ];

  buildPhase = ''
    find src -type f -name '*.nim' -exec sed -i 's/exitcode/exitCode/g' {} +
    export HOME=$TMPDIR
    nim c --opt:size --hints:off --warnings:off -d:release src/nitchrevived.nim
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp src/nitchrevived $out/bin/
  '';

  meta = with lib; {
    description = "Incredibly fast system fetch written in Nim";
    homepage = "https://github.com/gnuvalerie/nitchrevived";
    license = licenses.mit;
    maintainers = [ maintainers.gnuvalerie ];
    platforms = platforms.linux;
  };
}