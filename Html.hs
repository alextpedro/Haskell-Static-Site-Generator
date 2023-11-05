module Html (
    HtmlDoc,
    HtmlStruct,
    html_,
    p_,
    h1_,
    append_,
    render
    )
    where

newtype HtmlDoc = HtmlDoc String

newtype HtmlStruct = HtmlStruct String

html_ :: String -> HtmlStruct -> HtmlDoc
html_ title content = 
    HtmlDoc 
        ( el "html" 
            ( el "head" (el "title" title)
                <> el "body" (getStructureString content)
            )
        )

p_ :: String -> HtmlStruct
p_ = HtmlStruct . el "p"

h1_ :: String -> HtmlStruct
h1_ = HtmlStruct . el "h1"

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

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