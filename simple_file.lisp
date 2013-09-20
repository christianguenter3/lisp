(defun print-something()
  (princ "Hello File!")
  (prin1 "Dies ist ein weiterer Test"))

(defun to-file(fname thunk)
  (with-open-file( *standard-output*
                   fname
                   :direction :output
                   :if-exists :supersede)                                   
                (funcall thunk)))
(to-file "C:\\Users\\Guenterc\\Documents\\lisp\\testfile.txt" 
         (lambda() (print-something)))