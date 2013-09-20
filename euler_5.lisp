(defun give-divisors(num)
   	(loop for n from 1 to num
    		 collect n))

(defun give-even-divisors(num)    
	(remove-if-not (lambda(x)
              	 	(and (eql (mod x 10) 0)) (eql (mod x 9) 0))
               	   (remove-if (lambda (x) 
            					(oddp x))
         					  (give-divisors num))))

(defun is-div-wo-remainder(num divisor)
  (eq (apply '+ (mapcar (lambda (x) 
        	    			(mod num x)) 
      	    			(give-divisors divisor)))
      0))
  
(defun find-smallest-multiple-for-div(divisor)
  (mapcar (lambda (x)
           	(cons (is-div-wo-remainder x divisor) x))
          (give-even-divisors 3000000000)))

;(print (cdr (assoc T (find-smallest-multiple-for-div 20))))
;(print (give-odd-divisors 20))
;(print (give-even-divisors 3000))

(print (apply #'lcm (loop for n from 1 to 20 collect n)))