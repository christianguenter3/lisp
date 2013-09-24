(load "C:\\Users\\Guenterc\\Documents\\lisp\\palin")

(defun generator()
  (let ((sum))
   	 (loop for i
	       from 1 
	       to 25
           do collect (loop for j 
		                           from i
		                     	   to 25
			       				   collect (* j j)))))

(defun sublist(a b list)
  (loop for i 
        from a
        to b
        collect (nth i list)))

(defun build-list(list)
  (loop for k 
        from 0
        to (1- (length list))
        collect (sublist 0 k list)))

(defun sum(list)
  (mapcar (lambda(x)
              (apply #'+ x))
            list))

;(print (sum(build-list(generator))))
;(print (sum(build-list(reverse(generator)))))
(print (generator))