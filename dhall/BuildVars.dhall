let TargetTriple = ./TargetTriple.dhall

let OS = ./OS.dhall

let Arch = ./Arch.dhall

in
{ installDir : Text
, currentDir : Text
, targetTriple : Optional TargetTriple
, isCross : Bool
, includeDirs : List Text
, preloadLibs : List Text
, shareDirs : List Text
, linkDirs : List Text
, binDirs : List Text
, buildOS : OS
, buildArch : Arch
, static : Bool
, cpus : Natural
}
