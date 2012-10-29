;;;; guess.lisp

(in-package #:libguess)

(defvar *library-loaded* nil)

(defun load-library ()
  (unless *library-loaded*
    (cffi:load-foreign-library "libguess.so")
    (cffi:defcfun ("libguess_determine_encoding" %libguess-determine-encoding) :string
      (inbuf :pointer)
      (length :int)
      (region :string))
    (setf *library-loaded* t)))

(defun determine-encoding (vector region)
  (load-library)
  (let* ((length (length vector))
	 (ptr (cffi:foreign-alloc :unsigned-char
				  :count length)))
    (dotimes (i length)
      (setf (cffi:mem-ref ptr :unsigned-char i)
	    (elt vector i)))
    (values (read-from-string (format nil ":~(~a~)" (%libguess-determine-encoding ptr length region))))))

(defconstant +guess-region-jp+ (if (boundp '+guess-region-jp+)+guess-region-jp+ "japanese"))
(defconstant +guess-region-tw+ (if (boundp '+guess-region-tw+)+guess-region-tw+ "taiwanese"))
(defconstant +guess-region-cn+ (if (boundp '+guess-region-cn+)+guess-region-cn+ "chinese"))
(defconstant +guess-region-kr+ (if (boundp '+guess-region-kr+)+guess-region-kr+ "korean"))
(defconstant +guess-region-ru+ (if (boundp '+guess-region-ru+)+guess-region-ru+ "russian"))
(defconstant +guess-region-ar+ (if (boundp '+guess-region-ar+)+guess-region-ar+ "arabic"))
(defconstant +guess-region-tr+ (if (boundp '+guess-region-tr+)+guess-region-tr+ "turkish"))
(defconstant +guess-region-gr+ (if (boundp '+guess-region-gr+)+guess-region-gr+ "greek"))
(defconstant +guess-region-hw+ (if (boundp '+guess-region-hw+)+guess-region-hw+ "hebrew"))
(defconstant +guess-region-pl+ (if (boundp '+guess-region-pl+)+guess-region-pl+ "polish"))
(defconstant +guess-region-bl+ (if (boundp '+guess-region-bl+)+guess-region-bl+ "baltic"))
