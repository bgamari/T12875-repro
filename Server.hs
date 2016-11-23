{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE CPP #-}

-- when this is defined the StaticKey lookup will fail
#define BROKEN

import Data.Bits
import GHC.Fingerprint.Type
import GHC.StaticPtr
import ALib.Types

#ifndef BROKEN
import ALib.Things
#endif

readFingerprint :: String -> Fingerprint
readFingerprint s =
    let x = read ("0x"++s) :: Integer 
    in Fingerprint (fromIntegral $ x `shiftR` 64) (fromIntegral x)

main :: IO ()
main = do 
    key <- readFingerprint <$> getContents :: IO StaticKey
#ifndef BROKEN
    print dummy
#endif
    print key
    Just thing <- unsafeLookupStaticPtr key :: IO (Maybe (StaticPtr AThing))
    print $ deRefStaticPtr thing

