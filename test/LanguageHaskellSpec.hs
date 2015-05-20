module LanguageHaskellSpec where

-- import Laundry.LanguageHaskell
import Test.Hspec
-- import Test.Hspec.QuickCheck (prop)
-- import Test.QuickCheck hiding ((.&.))

spec :: Spec
spec = do
    -- 警告がうざいのでコメントアウト
    -- describe "四則演算" $ do
    --   it "5 + 2" $
    --     5 + 2 `shouldBe` 7
    --   it "5 - 2" $
    --     5 - 2 `shouldBe` 3
    --   it "5 * 2" $
    --     5 * 2 `shouldBe` 10
    --   it "5 / 2" $
    --     5 / 2 `shouldBe` 2.5
    --   it "5 / 2 の整数値" $
    --     div 5 2 `shouldBe` 2
    --   it "5 / 2 の余り" $
    --     mod 5 2 `shouldBe` 1
    --   it "5 / 2 の整数値、関数バッククォートで括ると中置演算子にできる" $
    --     5 `div` 2 `shouldBe` 2
    --   it "modも中置演算子にする" $
    --     5 `mod` 2 `shouldBe` 1
    --   it "逆に括弧で囲むことで中置演算子を関数にできる" $
    --     ((+) 5 2) `shouldBe` 7

    describe "インクリメントする関数" $ do
      let increment :: Int -> Int -- これが型注釈
          increment n = n + 1
      it "n++" $
        (increment 1) `shouldBe` 2

    describe "引数を復数取る関数" $ do
      let add :: Int -> Int -> Int -- 引数はすべてカリー化されるのでこういう書き方になる
          add x y = x + y
      it "1 = 1 + 1" $
        (add 1 1) `shouldBe` 2

    describe "関数は日本語でも書ける" $ do
      let 足す :: Int -> Int -> Int
          足す = \ x y -> x + y
      it "1 = 1 + 1" $
        (足す 1 1) `shouldBe` 2

    describe "ラムダ式で関数を定義する" $ do
      let add :: Int -> Int -> Int
          add = \ x y -> x + y
      it "1 = 1 + 1" $
        (add 1 1) `shouldBe` 2

    describe "引数として関数を受け取る高階関数" $ do
      let f :: (Int -> Int) -> Int
          f callback = callback 1
      it "n++" $
        (f (\x -> x + 1)) `shouldBe` 2 -- ラムダ式で匿名関数を渡している

    describe "関数を返す高階関数" $ do
      let add :: Int -> Int -> Int
          add x = \y -> x + y
          addOne = add 1
      it "返された関数に1を渡す" $
        (addOne 1) `shouldBe` 2
      it "実は引数を続けて書いても返された関数に1を渡しているのと同じ" $
        (add 1 1) `shouldBe` 2

    describe "カリー化" $ do
      let add1 :: Int -> Int -> Int -- 型注釈からして一緒
          add1 x y = x + y
          add2 :: Int -> Int -> Int
          add2 x = \y -> x + y
          add3 :: Int -> Int -> Int
          add3 = \x -> \y -> x + y -- この書き方が実態だと思えば良い
      it "復数引数を取る関数" $
        (add1 1 1) `shouldBe` 2
      it "関数を返す高階関数。やっていることは一緒" $
        (add2 1 1) `shouldBe` 2
      it "これも同じ。どう書いても実態は引数の数だけ関数がネストしているのと同じため" $
        (add3 1 1) `shouldBe` 2

    describe "部分適用" $ do
      let add :: Int -> Int -> Int -- 型注釈からして一緒
          add x y = x + y
          addOne = add 1 -- カリー化されるため引数が足りない場合、高階関数と同じことが起きる
      it "部分適用された関数を呼び出す" $
        (addOne 1) `shouldBe` 2
