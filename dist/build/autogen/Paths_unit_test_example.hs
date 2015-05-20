module Paths_unit_test_example (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/kai/.cabal/bin"
libdir     = "/Users/kai/.cabal/lib/x86_64-osx-ghc-7.8.4/unit-test-example-0.0.0"
datadir    = "/Users/kai/.cabal/share/x86_64-osx-ghc-7.8.4/unit-test-example-0.0.0"
libexecdir = "/Users/kai/.cabal/libexec"
sysconfdir = "/Users/kai/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "unit_test_example_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "unit_test_example_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "unit_test_example_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "unit_test_example_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "unit_test_example_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
