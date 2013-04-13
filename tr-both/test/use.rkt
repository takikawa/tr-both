#lang racket

;(require "test.rkt")

;; error from untyped code
;(foo "foo" "bar")

(require (submod "test.rkt" #%tr-both))

;; contract error
(foo "foo" "bar")

