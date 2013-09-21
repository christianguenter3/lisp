(defun gen-seq(n)
	(if (= n 1)
   		(cons 1 nil)
 		(let ((new (if (evenp n) (/ n 2)
     				             (+ (* 3 n ) 1))))
         (cons n (gen-seq new)))))

(defun gen-1-mil()
  (loop for i from 1 to 1000000
        collect i))

(defun find-longest-seq()
  (let ((longest (cons 0 nil)))
	(mapcan (lambda (x) 
           		(let ((val (length(gen-seq x))))
                   (if (> val (car longest))
                       (setf longest (cons val (cons x nil))))))
             (gen-1-mil))
  (print longest)))

(find-longest-seq)

;(print (gen-seq 13))
;(print (length(gen-seq 13)))