;;;; package.lisp

(defpackage #:libguess
  (:use #:cl)
  (:export #:determine-encoding 
	   #:+guess-region-jp+
	   #:+guess-region-tw+
	   #:+guess-region-cn+ 
	   #:+guess-region-kr+
	   #:+guess-region-ru+
	   #:+guess-region-ar+
	   #:+guess-region-tr+
	   #:+guess-region-gr+
	   #:+guess-region-hw+
	   #:+guess-region-pl+
	   #:+guess-region-bl+))
