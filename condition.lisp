(print (if '(1)
		   'TRUE
		   'FALSE))

(defun my-length(list)
  	(if list
       (1+ (my-length (cdr list)))
           0))

(print (my-length '(Dies ist ein Test)))
   

(defvar *test* nil)

(defun pudding-eater(person)
  (cond ((eq person 'Christian) (setf *test* 'stupid-lisp-alien)
         						'(curse you lisp alien - you ate my pudding))
        (t   					'(why you eat my pudding stranger?))))