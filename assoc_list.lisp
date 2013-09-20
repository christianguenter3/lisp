(defparameter *drink-order* '((bill . double-espresso)
                              (lisa . latte-macchiato)
                              (linda . pure-coffe)))

(print (assoc 'lisa *drink-order*))
(push '(lisa . cappucino) *drink-order*)

(print (assoc 'bill *drink-order*))
(print (assoc 'lisa *drink-order*))
(print *drink-order*)