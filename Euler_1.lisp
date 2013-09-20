(defvar *sum* 0)
(defvar *upper-limit* 1000)

(defun 3-or-5-divisor(int)
  (cond ((zerop int) '0)
  		((or (zerop (mod int 3)) 
       		 (zerop (mod int 5) 0))
       		      (setf *sum* (+ *sum* int ))
            	  (3-and-5-divisor (1- int)))
    	(t 	  (3-and-5-divisor(1- int)))))
  
(setf *sum* 0)
(3-or-5-divisor 999)
(print *sum*)		