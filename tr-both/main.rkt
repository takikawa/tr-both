#lang racket/base

(module reader syntax/module-reader
  tr-both/lang
  #:read -read
  #:read-syntax -read-syntax

  (require (rename-in typed/racket
                      [read -read]
                      [read-syntax -read-syntax])))

