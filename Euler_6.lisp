(defun gen-list(limit)
  (loop for i from 1 to limit
  			  collect i))

(defun sum-of-squares(limit)
	(apply #'+ (mapcar (lambda (x)
                      		(* x x))
                       (gen-list limit))))

(defun square-of-sum(limit)
  (let ((sum (apply #'+ (gen-list limit))))
    (* sum sum)))

(defun diff(number)
  (- (square-of-sum number) (sum-of-squares number)))
  
 
(print (diff 10))
(print (diff 100))