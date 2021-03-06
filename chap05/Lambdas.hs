chain :: Integer -> [Integer]
chain 1 = [1]
chain n
    | even n = n : chain (n `div` 2)
    | odd  n = n : chain (n * 3 + 1)

numLongChains :: Int
numLongChains  = length (filter (\xs -> length xs > 15) (map chain [1..10]))

addthree :: Int -> Int -> Int -> Int
addthree x y z = x + y + z

addthree' :: Int -> Int -> Int -> Int
addthree' = \x -> \y -> \z -> x + y + z

flip' :: (a -> b -> c) -> b -> a -> c
flip' f =  \x y -> f y x

main :: IO ()
main = do
    print $ numLongChains
    print $ map (+3) [1,6,3,2]
    print $ map ( \x -> x + 3 ) [1,6,3,2]
    print $ zipWith (\ a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]
    print $ map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]
