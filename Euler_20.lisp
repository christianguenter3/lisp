(load "C:\\Users\\Guenterc\\Documents\\lisp\\split")

(defun faculty(n)
  (reduce #'* (loop for i from 1 to n
        		 collect i)))

(defun sum(n)
  (reduce #'+ (mapcar (lambda(x)             
                        (digit-char-p x))
                      n)))

(print (sum(split(prin1-to-string (faculty 100)))))