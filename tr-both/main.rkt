#lang racket/base

(module reader syntax/module-reader
  typed/racket/no-check
  #:read -read
  #:read-syntax -read-syntax

  (define (-read-syntax source-name in)
    (define (read-until-eof)
      (let loop ([stxs '()])
        (define stx (read-syntax source-name in))
        (if (eof-object? stx)
            (reverse stxs)
            (loop (cons stx stxs)))))
    (cond [(eof-object? (peek-byte in)) eof]
          [else
           (define stxs (read-until-eof))
           #`(begin
              #,@stxs
              (module #%tr-both typed/racket
                #,@stxs))]))

  (define (-read [in (current-input-port)])
    (syntax->datum (-read-syntax (object-name in) in))))

