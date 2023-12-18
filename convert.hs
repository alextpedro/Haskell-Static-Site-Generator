module Convert where

import qualified Markup
import qualified Html
import qualified Html.Internal as HI

convertStructure :: Markup.Structure -> Html.HtmlStruct
convertStructure structure =
    case structure of 
        Markup.Heading 1 txt ->
            Html.h1_ txt

        Markup.Paragraph p ->
            Html.p_ p

        Markup.UnorderedList list ->
            Html.ul_ $ map Html.p_ list

        Markup.OrderedList list ->
            Html.ol_ $ map Html.p_ list

        Markup.CodeBlock list ->
            Html.code_ (unlines list)

empty_ :: Structure
empty_ = Structure ""

concatStructure :: [Structure] -> Structure
concatStructure list =
  case list of
    [] -> empty_
    x : xs -> x <> concatStructure xs

map convertStructure :: Markup.Document -> [Html.HtmlStruct]