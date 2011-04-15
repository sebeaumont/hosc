-- | Byte-level encoding and decoding functions.
module Sound.OpenSoundControl.Byte where

import Data.Binary
import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString.Lazy.Char8 as BC
import Data.Int
import Sound.OpenSoundControl.Cast

-- | Encode a signed 8-bit integer.
encode_i8 :: Int -> B.ByteString
encode_i8 n = encode (fromIntegral n :: Int8)

-- | Encode a signed 16-bit integer.
encode_i16 :: Int -> B.ByteString
encode_i16 n = encode (fromIntegral n :: Int16)

-- | Encode a signed 32-bit integer.
encode_i32 :: Int -> B.ByteString
encode_i32 n = encode (fromIntegral n :: Int32)

-- | Encode an unsigned 16-bit integer.
encode_u32 :: Int -> B.ByteString
encode_u32 n = encode (fromIntegral n :: Word32)

-- | Encode a signed 64-bit integer.
encode_i64 :: Integer -> B.ByteString
encode_i64 n = encode (fromIntegral n :: Int64)

-- | Encode an unsigned 64-bit integer.
encode_u64 :: Integer -> B.ByteString
encode_u64 n = encode (fromIntegral n :: Word64)

-- | Encode a 32-bit IEEE floating point number.
encode_f32 :: Double -> B.ByteString
encode_f32 = encode . f32_i32 . realToFrac

-- | Encode a 64-bit IEEE floating point number.
encode_f64 :: Double -> B.ByteString
encode_f64 = encode . f64_i64

-- | Encode an ASCII string.
encode_str :: String -> B.ByteString
encode_str = BC.pack

-- | Decode a signed 8-bit integer.
decode_i8 :: B.ByteString -> Int
decode_i8 b = fromIntegral (decode b :: Int8)

-- | Decode a signed 16-bit integer.
decode_i16 :: B.ByteString -> Int
decode_i16 b = fromIntegral (decode b :: Int16)

-- | Decode a signed 32-bit integer.
decode_i32 :: B.ByteString -> Int
decode_i32 b = fromIntegral (decode b :: Int32)

-- | Decode an unsigned 32-bit integer.
decode_u32 :: B.ByteString -> Int
decode_u32 b = fromIntegral (decode b :: Word32)

-- | Decode a signed 64-bit integer.
decode_i64 :: B.ByteString -> Integer
decode_i64 b = fromIntegral (decode b :: Int64)

-- | Decode an unsigned 64-bit integer.
decode_u64 :: B.ByteString -> Integer
decode_u64 b = fromIntegral (decode b :: Word64)

-- | Decode a 32-bit IEEE floating point number.
decode_f32 :: B.ByteString -> Double
decode_f32 b = realToFrac (i32_f32 (decode b :: Int32))

-- | Decode a 64-bit IEEE floating point number.
decode_f64 :: B.ByteString -> Double
decode_f64 b = i64_f64 (decode b :: Int64)

-- | Decode an ASCII string.
decode_str :: B.ByteString -> String
decode_str = BC.unpack
