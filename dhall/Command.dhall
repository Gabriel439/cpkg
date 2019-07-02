let Proc = ./Proc.dhall

in
< CreateDirectory : { dir : Text }
| MakeExecutable : { file : Text }
| Call : Proc
| SymlinkBinary : { file : Text }
| SymlinkManpage : { file : Text, section : Natural }
| Symlink : { tgt : Text, linkName : Text }
| Write : { file : Text, contents : Text }
| CopyFile : { src : Text, dest : Text }
| Patch : { patchContents : Text }
>
