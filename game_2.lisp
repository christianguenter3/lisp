((load "C:\\Users\\Guenterc\\Documents\\lisp\\graph_util")

(defparameter *congestion-city-node* nil)
(defparameter *congestion-city-edges* nil)
(defparameter *cisited-nodes* nil)
(defparameter *node-num* 30)
(defparameter *edge-num* 45)
(defparameter *worm-num* 3)
(defparameter *cop-odds* 15)

(defun random-node ()
(1+ (random *node-num*)))

(defun edge-pair (a b)
  (unless (eql a b)
    (list (cons a b ) (cons b a))))

(defun make-edge-list ()
  (apply #'append (loop repeat *edge-num*
         		        collect (edge-pair (random-node) (random-node)))))
  
(defun direct-edges (node edge-list)
  (remove-if-not (lambda (x)
                   (eql (car x) node))
                 edge-list)
  
(print (make-edge-list)))