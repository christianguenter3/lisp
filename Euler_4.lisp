(defun is-palin(number)
  (let ((s (prin1-to-string number)))
  	(equal (reverse s) s)))

(defun number-generator()
  (loop for i from 1 to 99
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
  (reduce (lambda (max item)
            (if (> (cdr item) max)
                (cdr item)
             max))
          (highest-product)
          :initial-value 0))

(print (find-max))