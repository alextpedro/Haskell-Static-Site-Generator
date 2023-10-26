main = putStrLn myhtml
myhtml = makeHtml "My page title" "My page content"

wrapHTML content = "<html><body>" <> content <> "</body></html>"

html_ content = "<html>" <> content <> "</html>"
body_ content = "<body>" <> content <> "</body>"
head_ content = "<head>" <> content <> "</head>"
title_ content = "<title>" <> content <> "</title>"

makeHtml title body = html_ (head_ (title_ title) <> body_ body)