(defun split(s)
  (map 'list
       (lambda(c)
         c)
       s))

(defun quer-sum(n)
  (reduce #'+ (mapcar (lambda(x)
                        (char-int x))
                      (split n))))

(print (quer-sum (prin1-to-string (expt 2 1000))))