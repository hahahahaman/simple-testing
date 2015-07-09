;;;; package.lisp

(defpackage #:simple-testing
  (:use #:cl)
  (:export deftest
           check
           combine-results))

