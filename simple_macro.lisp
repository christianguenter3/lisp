(defmacro let1 (var val &body body)
  `(let ((,var ,val))
     ,@body))

; (let1 foo (+ 2 3)
;       (print(* foo foo)))

(defmacro split (list yes no)
  `(if ,list 
      (let ((head (car ,list))
            (tail (cdr ,list)))
        ,yes)
      ,no))

; (print(split '(2 3)
;       	 (format t "This can be split into ~a and ~a." head tail)
;        	 (format t "This cannot be split")))

(defun pairs (lst)
  (labels ((f (lst acc)
              (split lst
                     (if tail 
                         (f (cdr tail) (cons (cons head (car tail)) acc))
                         (reverse acc))
                     (reverse acc))))
          (f lst nil)))

;(print(pairs '(a b c d e f g h i j)))

(defmacro recurse (vars &body body)
  (let1 p (pairs vars)
        `(labels ((self ,(mapcar #'car p)
                        ,@body))
                 (self ,@(mapcar #'cdr p)))))

(defun my-length (lst)
  (recurse (lst lst 
            acc 0)
           (split lst
              (self tail (1+ acc))
              acc)))

;(print (my-length '(1 2 3 4 5)))