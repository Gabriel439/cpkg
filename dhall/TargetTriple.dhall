let Arch = ./Arch.dhall

let Manufacturer = ./Manufacturer.dhall

let OS = ./OS.dhall

let ABI = ./ABI.dhall

in
{ arch : Arch
, manufacturer : Optional Manufacturer
, os : OS
, abi : Optional ABI
}
