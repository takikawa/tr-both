#lang racket

(require rackunit)

(let ()
  (local-require "test.rkt")

  ;; error from untyped code
  (check-exn exn:fail? (λ () (foo "foo" "bar"))))

(let ()
  (local-require (submod "test.rkt" #%tr-both))

  ;; contract error
  (check-exn exn:fail:contract:blame? (λ () (foo "foo" "bar"))))

