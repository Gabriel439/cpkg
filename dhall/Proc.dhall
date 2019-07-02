let EnvVar = ./EnvVar.dhall

in
{ program : Text
, arguments : List Text
, environment : Optional (List EnvVar)
, procDir : Optional Text
}
