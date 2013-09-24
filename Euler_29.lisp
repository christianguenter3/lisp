(defun gen(a b)
  (loop for i from a to b
	        collect i))		

(defun integer-cominations(a b)
  (let ((comb nil))
	  (mapc (lambda (x)
	          (mapc (lambda (y)
	            			(push (cons x y) comb))
	            	(gen a b)))
	   (gen a b))
   comb))

(defun powers(list)
	(mapcar (lambda (y)
	  			(append (expt (car y) (cdr y))))
	   		list))

(print (length(remove-duplicates(sort (powers(integer-cominations 2 100)) #'<))))