;;;; package.lisp

(defpackage #:simple-testing
  (:nicknames :stest)
  (:use #:cl)
  (:export deftest
           check
           combine-results
           run-tests))
