(defun my-length(list)
  (if list
      (1+ (my-length(cdr list)))
      0))

(defun my-length2(lst)
  (labels ((len (lst acc)
        	(if lst 
            	(len (cdr lst) (1+ acc))
            	acc)))
    (len lst 0)))



(compile 'my-length2)
(print (my-length2 (loop for i from 1 to 10000
                        collect i)))
                       
