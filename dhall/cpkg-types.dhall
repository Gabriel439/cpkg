let OS = ./OS.dhall

let Arch = ./Arch.dhall

let Manufacturer = ./Manufacturer.dhall

let ABI = ./ABI.dhall

let TargetTriple = ./TargetTriple.dhall

let BuildVars = ./BuildVars.dhall

let VersionBound = ./VersionBound.dhall

let Dep = ./Dep.dhall

let EnvVar = ./EnvVar.dhall

let Proc = ./Proc.dhall

let Command = ./Command.dhall

in
{ OS            = OS
, BuildVars     = BuildVars
, VersionBound  = VersionBound
, Dep           = Dep
, Arch          = Arch
, Manufacturer  = Manufacturer
, ABI           = ABI
, TargetTriple  = TargetTriple
, Command       = Command
, EnvVar        = EnvVar
, Proc          = Proc
}
