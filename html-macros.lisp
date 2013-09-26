(load "C:\\Users\\Guenterc\\Documents\\lisp\\xml-macros")

(defmacro html(&body body)
	`(tag html ()
		,@body))

(defmacro body(&body body)
	`(tag body()
		,@body))

(html
	(body
		(princ "Hello World")))