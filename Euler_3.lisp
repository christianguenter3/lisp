(defparameter *largest* 1)
(defparameter *number* 13195)

(defun get-largest-prime-factor(counter)
  (print counter)
  (cond ((>= counter *number*)0)
        ((eq (mod counter *number*) 0)
         (setf *largest* counter)
         (get-largest-prime-factor(1+ counter)))
        (t (get-largest-prime-factor(1+ counter))))
  )

(get-largest-prime-factor 1)
(print *largest*)