replicate :: Int -> a -> [a]
replicate n x = 
    if n <= 0 
        then 
            []
        else 
            x : replicate (n - 1) x     -- : cons operator prepend to a list. y:x = [y, x] so "prepend y to x"

even :: Int -> Bool
even n =
    if n == 0 
        then 
            True
        else 
            odd (n-1)

odd :: Int -> Bool
odd n =
    if n == 0
        then
            False
        else
            even (n-1)

isBright :: AnsiColor -> Bool
isBright ansicolor =
    case ansicolor of
        AnsiColor Bright _ -> True
        AnsiColor Dark _ -> False

ansiToUbuntu :: AnsiColor -> Color
ansiToUbuntu ansicolor =
    case ansicolor of
        AnsiColor brightness color ->
            case brightness of 
                Bright -> 
                    case color of 
                        Black -> RGB 129 131 131
                        Red -> RGB 255 0 0
                        Green -> RGB 0 255 0
                        Yellow -> RGB 255 255 0
                        Blue -> RGB 0 0 255
                        Magenta -> RGB 255 0 255
                        Cyan -> RGB 0 255 255
                        White -> RGB 255 255 255
                Dark ->
                    case color of
                        Black -> RGB 0 0 0
                        Red -> RGB 194 54 33
                        Green -> RGB 57 181 74
                        Yellow -> RGB 255 199 6
                        Blue -> RGB 0 111 184
                        Magenta -> RGB 118 38 113
                        Cyan -> RGB 44 181 233
                        White -> RGB 204 204 204

isEmpty :: [a] -> Bool
isEmpty list =
    case listToMaybe list of 
        Nothing -> True
        Just _ -> False

isEmpty :: [a] -> Bool
isEmpty list =
    case list of 
        [] -> True
        _ -> False