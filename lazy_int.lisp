(load "C:\\Users\\Guenterc\\Documents\\lisp\\lazy")

(defparameter *integers*
  (labels ((f (n)
              (lazy-cons n (f (1+ n)))))
          (f 1)))

; (print (lazy-car *integers*))
; (print (lazy-car (lazy-cdr *integers*)))

; (print (take 10 *integers*))
; (print(take 10 (make-lazy '(a b c d e f g h i j k l m n o p q r s t u v w x y z))))
; (print(take-all (make-lazy '(a b c d e f g h i j k l m n o p q r s t u v w x y z))))

(print (take 10 (lazy-mapcar #'sqrt *integers*)))
(print (take 10 (lazy-mapcan (lambda (x)
                               (if (evenp x)
                                   (make-lazy (list x))
                                   (lazy-nil)))
                             *integers*)))

(print (lazy-find-if #'oddp (make-lazy '(2 4 6 7 8 10))))

(print (lazy-nth 4 (make-lazy '(a b c d e f g))))