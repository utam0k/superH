-- data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

-- area :: Shape -> Float
-- area (Circle _ _ r) = pi * r ^ 2
-- area (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

area :: Shape -> Float
area (Circle _ r) = pi * r ^ 2
area (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)

main :: IO ()
main = do
    -- print $ area $ Circle 10 20 10
    -- print $ area $ Rectangle 0 0 100 100
    -- print $ Circle 10 20 5
    -- print $ map (Circle 10 20) [4,5,6,6]
    print $ area (Rectangle (Point 0 0) (Point 100 100))
    print $ area (Circle (Point 0 0) 24)
    print $ nudge (Circle (Point 34 34) 10) 5 10
    print $ nudge (baseRect 40 100) 60 23
