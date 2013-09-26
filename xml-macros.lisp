(load "C:\\Users\\Guenterc\\Documents\\lisp\\simple_macro")

(defun print-tag  (name alst closingp)
	(princ #\<)
	(when closingp
		(princ #\/))
	(princ (string-downcase name))
	(mapc (lambda (att)
			(format t " ~a=\"~a\"" (string-downcase (car att)) (cdr att)))
		  alst)
	(princ #\>))

(defmacro tag (name atts &body body)
	`(progn (print-tag ',name 
			 		   (list ,@(mapcar (lambda (x)
			 		   				    `(cons ', (car x) ,(cdr x)))
			 		   				   (pairs atts)))
			 		   nil)
	,@body(print-tag ',name nil t)))

; (print-tag 'html '() nil)
; (print-tag 'a '((href www.google.de)) nil)
; (print-tag 'a '() T)
; (print-tag 'html () T)

; (tag mytag (color 'blue height (+ 4 5)))
; (tag a (href "www.google.de" ))

; (tag body nil 
; 	(tag mytag (color 'blue height (+ 4 5)))
; 	(tag a (href "www.google.de" )))