#lang setup/infotab
(define name "json")
(define blurb
  (list "Implements the JSON data exchange format."))
(define primary-file "main.rkt")
(define categories '(datastructures))
(define scribblings '(("json.scrbl" ())))
(define release-notes
  '((ul (li "Updated for Racket (.ss " rarr " .rkt).")
        (li "Fix for " (a ([href "http://planet.racket-lang.org/trac/ticket/21"]) "bug 21") ".")
        (li "Fix for " (a ([href "http://planet.racket-lang.org/trac/ticket/141"]) "bug 141") ".")
        (li "Fix for " (a ([href "http://planet.racket-lang.org/trac/ticket/265"]) "bug 265") ".")
        (li "Fix for " (a ([href "http://planet.racket-lang.org/trac/ticket/291"]) "bug 291") ".")
        (li "Fix for " (a ([href "http://planet.racket-lang.org/trac/ticket/317"]) "bug 317") "."))))
(define repositories '("4.x"))
(define required-core-version "4.0.0.0")
(define version "4")
