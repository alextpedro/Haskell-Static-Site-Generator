module Html.Internal where
    newtype HtmlDoc = HtmlDoc String

    newtype HtmlStruct = HtmlStruct String

    html_ :: String -> HtmlStruct -> HtmlDoc
    html_ title content = 
        HtmlDoc 
            ( el "html" 
                ( el "head" (el "title" (escape title))
                    <> el "body" (getStructureString content)
                )
            )

    p_ :: String -> HtmlStruct
    p_ = HtmlStruct . el "p" . escape

    h1_ :: String -> HtmlStruct
    h1_ = HtmlStruct . el "h1" . escape

    el :: String -> String -> String
    el tag content =
        "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

    ul_ :: [HtmlStruct] -> HtmlStruct
    ul_ = 
        HtmlStruct . el "ul" . concat . map (el "li" . getStructureString)

    ol_ :: [HtmlStruct] -> HtmlStruct
    ol_ = 
        HtmlStruct . el "ol" . concat . map (el "li" . getStructureString)

    code_ :: String -> HtmlStruct
    code_ = HtmlStruct . el "pre" . escape

    append_ :: HtmlStruct -> HtmlStruct -> HtmlStruct
    append_ c1 c2 = HtmlStruct (getStructureString c1 <> getStructureString c2)

    getStructureString :: HtmlStruct -> String
    getStructureString content =
        case content of
            HtmlStruct str -> str

    render :: HtmlDoc -> String
    render doc =
        case doc of 
            HtmlDoc str -> str

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
