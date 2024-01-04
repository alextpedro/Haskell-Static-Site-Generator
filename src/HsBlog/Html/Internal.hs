module HsBlog.Html.Internal where

import Numeric.Natural

newtype Html = Html String

newtype Structure = Structure String

type Title = String

html_ :: Title -> Html -> Structure
html_ title content = 
    Html 
        ( el "html" 
            ( el "head" (el "title" (escape title))
                <> el "body" (getStructureString content)
            )
        )

p_ :: String -> Structure
p_ = Structure . el "p" . escape

h_ :: Natural -> String -> Structure
h_ n = Structure . el ("h" <> show n) . escape

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

ul_ :: [Structure] -> Structure
ul_ = 
    Structure . el "ul" . concat . map (el "li" . getStructureString)

ol_ :: [Structure] -> Structure
ol_ = 
    Structure . el "ol" . concat . map (el "li" . getStructureString)

code_ :: String -> Structure
code_ = Structure . el "pre" . escape

{-append_ :: Structure -> Structure -> Structure
append_ c1 c2 = Structure (getStructureString c1 <> getStructureString c2)-}
instance Semigroup Structure where
    (<>) c1 c2 =
        Structure (getStructureString c1 <> getStructureString c2)

instance Monoid Structure where
    mempty = Structure ""

getStructureString :: Structure -> String
getStructureString content =
    case content of
        Structure str -> str

render :: Html -> String
render doc =
    case doc of 
        Html str -> str

escape :: String -> String
escape = 
    let
        escapeChar c =
            case c of
                '<' -> "&lt;"
                '>' -> "&gt;"
                '&' -> "&amp;"
                '"' -> "&quot;"
                '\'' -> "&#39;"
                _ -> [c]
    in 
        concat . map escapeChar
