module HsBlog.Convert where

import qualified HsBlog.Markup as Markup
import qualified HsBlog.Html as Html

convert :: Html.Title -> Markup.Document -> Html.Html
convert title = Html.html_ title . foldMap convertStructure

convertStructure :: Markup.Structure -> Html.Structure
convertStructure structure =
    case structure of 
        Markup.Heading 1 txt ->
            Html.h_ n txt

        Markup.Paragraph p ->
            Html.p_ p

        Markup.UnorderedList list ->
            Html.ul_ $ map Html.p_ list

        Markup.OrderedList list ->
            Html.ol_ $ map Html.p_ list

        Markup.CodeBlock list ->
            Html.code_ (unlines list)

{-empty_ :: Structure
empty_ = Structure ""

concatStructure :: [Structure] -> Structure
concatStructure list =
  case list of
    [] -> empty_
    x : xs -> x <> concatStructure xs

map convertStructure :: Markup.Document -> [Html.HtmlStruct]-}