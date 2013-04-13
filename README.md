`#lang tr-both`

This is an experimental language that came up in discussion in the PRL. A
module written in `#lang tr-both` has the syntax of a Typed Racket module.
However, the module is actually untyped, and comes with a submodule
`#%tr-both` that is typed.

The intention of the submodule is that Typed Racket's `require` could
be instrumented to check if a `#%tr-both` submodule exists and, if so,
`require` it instead of the untyped version.

