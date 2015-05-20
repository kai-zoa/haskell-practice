module Laundry.LanguageHaskell where

add :: Int -> Int -> Int -- 型注釈
add x y = x + y

-- ↑と同じ関数だけどラムダ式を使って定義してみる
足す :: Int -> Int -> Int
足す = \ x y -> x + y

langDo :: Int -> Int
langDo = do \ x -> x

-- langDoWithWHere :: Int -> Int
-- langDoWithWHere = do
--   c
--   where
--     b = 2
--     c = 1 + b
