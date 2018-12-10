module Package.C.Type.Vars ( ConfigureVars (..)
                           , BuildVars (..)
                           , InstallVars (..)
                           ) where

import           Package.C.Type.Shared

data ConfigureVars = ConfigureVars { installDir   :: FilePath
                                   , targetTriple :: Maybe Platform
                                   , includeDirs  :: [ FilePath ]
                                   , linkDirs     :: [ FilePath ]
                                   , binDirs      :: [ FilePath ]
                                   , configOS     :: OS
                                   }

data BuildVars = BuildVars { cpus    :: Int
                           , osBuild :: OS
                           }

data InstallVars = InstallVars { installPath :: FilePath
                               , installOS   :: OS
                               }
