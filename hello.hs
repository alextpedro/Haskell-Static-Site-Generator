main :: IO()
main = putStrLn myhtml

myhtml :: String
myhtml = makeHtml "My page title" (h1_ "Hello, World!" <> p_ "This is a paragraph.")

wrapHTML :: String -> String
wrapHTML content = "<html><body>" <> content <> "</body></html>"

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_  = el "head"

title_ :: String -> String
title_ = el "title"

p_ :: String -> String
p_ = el "p"

h1_ :: String -> String
h1_ = el "h1"

makeHtml :: String -> String -> String
makeHtml title body = html_ (head_ (title_ title) <> body_ body)

el :: String -> String -> String
el tag content =
    "<" <> tag <> ">" <> content <> "</" <> tag <> ">"