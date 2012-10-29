;;;; libguess.asd

(asdf:defsystem #:libguess
  :serial t
  :description "ffi wrapper for libguess"
  :author "SANO Masatoshi  <snmsts@gmail.com>"
  :license "MIT"
  :components ((:file "package")
               (:file "guess"))
  :depends-on (:cffi))

