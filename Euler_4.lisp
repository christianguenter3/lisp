(defun is-palin(number)
  (let ((s (prin1-to-string number)))
  	(equal (reverse s) s)))

(defun number-generator()
  (loop for i from 1 to 999
        collect i))

(defun products()
  (remove-duplicates (mapcan (lambda (x)
            			(mapcar (lambda (y)
              				(* x y))
              	  		(number-generator)))
          			 (number-generator))))

(defun highest-product()
  (remove-if (lambda (x) (equal (car x) nil))
    		 (mapcar (lambda (x)
            			(cons (is-palin x) x))
          		(products))))

(defun find-max()
  (let* ((max 0))
    (mapcar(lambda (x) 
             (if (> (cdr x) max)
                 (setf max (cdr x))))
           (highest-product))
  	max))

(print (find-max))