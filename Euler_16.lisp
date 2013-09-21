(defun split (string)
  (let ((s (prin1-to-string string)))    
  	(loop for i from 0 to (1- (length s))
          collect (subseq s i (1+ i)))))

(defun quer-sum(n)
  (apply #'+ (mapcar (lambda(x)
                        (parse-integer x))
                      (split n))))

(print (quer-sum (expt 2 1000)))