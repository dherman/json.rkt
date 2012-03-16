#lang racket/base

(require rackunit
         "../main.rkt")

;; Basic jexpr tests
(check-true (jsexpr? #\null))
(check-true (jsexpr? #t))
(check-true (jsexpr? #f))
(check-true (jsexpr? "I am string"))
(check-true (jsexpr? 12))
(check-true (jsexpr? -12))
(check-true (jsexpr? -1.0))
(check-true (jsexpr? 1E10))
(check-true (jsexpr? '(1E10 #t "string")))
(check-true (jsexpr? (hasheq 'foo "string")))
(check-true (jsexpr? (hasheq 'foo 10)))
(check-false (jsexpr? 3+4i))

;; Test reading json
(check-equal? (read-json (open-input-string "-23")) -23 "Parsing negative ints")
(check-equal? (read-json (open-input-string "0.023")) .023 "Parsing decimals")
(check-equal? (read-json (open-input-string "2")) 2 "Parsing a lone number")
(check-equal? (read-json (open-input-string " 2")) 2 "value is preceded by whitespace")
(check-equal? (read-json (open-input-string "1.0E10")) 10000000000.0)
(check-equal? (read-json (open-input-string "1.0E+10")) 10000000000.0)
(check-equal? (read-json (open-input-string "1.0E-10")) 1e-10)
(check-equal? (read-json (open-input-string "1.0E-3")) 0.001)
(check-equal? (read-json (open-input-string "{ }")) #hasheq())
(check-equal? (read-json (open-input-string "[ ]")) '())
(check-equal? (read-json (open-input-string "true")) #t) ;;A lone boolean
(check-equal? (read-json (open-input-string "\"ok\"")) "ok")



;; Test using sample json files
(check-equal? (let ([in (open-input-file "json-samples/pass1.json")])
                (read-json in))
              (read (open-input-file "json-samples/pass1.rkt")))

(check-equal? (let ([in (open-input-file "json-samples/pass3.json")])
                (read-json in))
              '#hasheq(
                       (|JSON Test Pattern pass3| . 
                              #hasheq(
                                      (|The outermost value| . "must be an object or array.") 
                                      (|In this test| . "It is an object.")))))


(check-equal? (let ([in (open-input-file "json-samples/pass2.json")])
                (read-json in))
              '((((((((((((((((((("Not too deep"))))))))))))))))))))