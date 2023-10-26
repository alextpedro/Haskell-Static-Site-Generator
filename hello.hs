main = putStrLn myhtml
myhtml = html_ (body_ "Hello, world!") 

wrapHTML content = "<html><body>" <> content <> "</body></html>"

html_ content = "<html>" <> content <> "</html>"
body_ content = "<body>" <> content <> "</body>"