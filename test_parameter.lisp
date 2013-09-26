(defun test (rest &rest)
  (print &rest) 
  (print rest))

(test '(1 2 3) '1)