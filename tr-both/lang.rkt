#lang typed/racket/no-check

(require (for-syntax racket/base syntax/parse)
         (for-syntax (only-in typed/racket/no-check #%module-begin)))

(provide (except-out (all-from-out typed/racket/no-check) #%module-begin)
         (rename-out [-#%module-begin #%module-begin])
         #%app)

(define-syntax (-#%module-begin stx)
  (syntax-parse stx
    [(_ e ...)
     (syntax/loc stx
       (#%module-begin
        (module #%tr-both typed/racket e ...)
        e ...))]))

