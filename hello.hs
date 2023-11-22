import Html

main :: IO()
main = putStrLn (render myhtml)

myhtml :: HtmlDoc
myhtml =
  html_
    "My title"
    ( append_
      (h1_ "Heading")
      ( append_
        (p_ "Paragraph #1 <p>")
        (p_ "Paragraph #2")
      )
    )
