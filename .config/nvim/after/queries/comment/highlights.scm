;; extends

; Custom comment tags, layered on top of nvim-treesitter's comment query.
; Each capture needs a matching highlight group (see hl_add in chadrc.lua).

((tag
  (name) @comment.debug @nospell
  ("(" @punctuation.bracket
    (user) @constant
    ")" @punctuation.bracket)?
  ":" @punctuation.delimiter)
  (#any-of? @comment.debug "DEBUG"))

("text" @comment.debug @nospell
  (#any-of? @comment.debug "DEBUG"))
