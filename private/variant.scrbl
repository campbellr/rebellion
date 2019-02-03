#lang scribble/manual

@(require (for-label racket/base
                     racket/contract/base
                     rebellion/variant)
          scribble/example)

@(define module-sharing-evaluator-factory
   (make-base-eval-factory (list 'racket/base 'rebellion/variant)))

@(define (make-evaluator)
   (define evaluator (module-sharing-evaluator-factory))
   (evaluator '(require rebellion/variant))
   evaluator)

@title{Variants}
@defmodule[rebellion/variant]

A @deftech{variant} is a value tagged with a keyword. Variants are used to
distinguish different kinds of values by name, without knowing anything about
the types of those values.

@defproc[(variant? [v any/c]) variant?]{
 A predicate for @tech{variants}.}

@defproc[(variant [#:<kw> v any/c]) variant?]{
 Constructs a @tech{variant} containing @racket[v] tagged with the given
 keyword, where @racket[#:<kw>] stands for any keyword.

 @(examples
   #:eval (make-evaluator) #:once
   (variant #:success 42)
   (variant #:failure 'oops))}

@defproc[(variant-value [var variant?]) any/c]{
 Returns the value contained in @racket[var].

 @(examples
   #:eval (make-evaluator) #:once
   (variant-value (variant #:success 42))
   (variant-value (variant #:failure 'oops)))}

@defproc[(variant-tag [var variant?]) keyword?]{
 Returns the tag keyword of @racket[var].

 @(examples
   #:eval (make-evaluator) #:once
   (variant-tag (variant #:success 42))
   (variant-tag (variant #:failure 'oops)))}
