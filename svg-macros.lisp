(load "C:\\Users\\Guenterc\\Documents\\lisp\\xml-macros")
(load "C:\\Users\\Guenterc\\Documents\\lisp\\simple_file")

(defmacro svg (width height &body body)
	`(tag svg (xmlns "http://www.w3.org/2000/svg"
			   "xmlns:xlink" "http://www.w3.org/1999/xlink"
			   height ,height
			   width ,width)
	,@body))

(defun brightness (col amt)
	(mapcar (lambda (x)
		(min 255  (max 0 ( + x amt))))
	col))

(defun svg-style (color)
  	(print color)
	(format nil
		"~{fill:rgb(~a,~a,~a);stroke:rgb(~a,~a,~a)~}"
		(append color
			(brightness color -100))))

(defun circle (center radius color)
	(tag circle (cx (car center)
				 cy (cdr center)
				 r radius
				 style (svg-style color))))

(defun polygon (points color)
	(tag polygon (points (format nil "~{~a,~a ~}" (mapcan (lambda (tp)
														 	(list (car tp) (cdr tp)))
														 	points))
					style (svg-style color))))

(defun random-walk (value length)
	(unless (zerop length)
		(cons value
			(random-walk (if (zerop (random 2))
						 	 (1- value)
						   (1+ value))
						 (1- length)))))

(defun write-random-file(thunk)
	(let1 file (concatenate 'string (prin1-to-string (random 1000)) ".svg")
		(print file)
		(to-file (concatenate 'string "C:\\Users\\Guenterc\\Documents\\lisp\\" file)
			     thunk)))

; (write-random-file (lambda() (svg 300 300
; 								(circle '(50 . 50) 50 '(255 0 0))
; 								(circle '(100 . 100) 50 '(0 0 255))
; 								(circle '(200 . 200) 100 '(255 128 128)))))

; (write-random-file (lambda () (svg 300 300
; 								(loop repeat 10
; 									do (polygon (append '((0 . 200))
; 														(loop for x 
; 															  for y in (random-walk 100 400)
; 															  collect (cons x y))
; 														'((400 . 200)))
; 												(loop repeat 3
; 													collect (random 256)))))))
