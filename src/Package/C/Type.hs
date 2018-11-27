module Package.C.Type ( CPkg (..)
                      , ConfigureVars (..)
                      -- * Helper functions
                      , cPkgDhallToCPkg
                      ) where

import qualified Data.Text            as T
import qualified Package.C.Dhall.Type as Dhall

newtype ConfigureVars = ConfigureVars { _installDir :: String
                                      }

-- TODO: handle linking against various libraries in weird include dirs
-- TODO: versions
data CPkg = CPkg { _pkgName          :: String
                 , _pkgUrl           :: String
                 , _configureCommand :: ConfigureVars -> [ String ]
                 , _buildCommand     :: [ String ]
                 , _installCommand   :: [ String ]
                 }

cfgVarsToDhallCfgVars :: ConfigureVars -> Dhall.ConfigureVars
cfgVarsToDhallCfgVars (ConfigureVars dir) = Dhall.ConfigureVars (T.pack dir)

cPkgDhallToCPkg :: Dhall.CPkg -> CPkg
cPkgDhallToCPkg (Dhall.CPkg name url cfgCmd buildCmd installCmd) =
    CPkg (T.unpack name) (T.unpack url) (\cfg -> T.unpack <$> cfgCmd (cfgVarsToDhallCfgVars cfg)) (T.unpack <$> buildCmd) (T.unpack <$> installCmd)
