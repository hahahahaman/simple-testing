(in-package :cl-user)
(defpackage #:simple-testing.tests
  (:use #:cl #:simple-testing)
  (:export run-all-tests))

(in-package :simple-testing.tests)

(deftest test-+ ()
  (check
   (= (+ 1 2) 3)
   (= (+ 1 2 3) 6)
   (= (+ -1 -3) -4)))

(deftest test-* ()
  (check
   (= (* 2 2) 4)
   (= (* 3 5) 15)))

(deftest test-arithmetic ()
  "Testing built in arithmetic operators."
  (combine-results
    (test-+)
    (test-*)))

(defun run-all-tests ()
  (test-arithmetic))

;;; Hooking into ASDF
(defmethod asdf:perform ((o asdf:test-op)
                         (c (eql (asdf:find-system :simple-testing.tests))))
  (format t "~2&*******************~@
                ** Starting test **~@
                *******************~%~%")
  (handler-bind ((style-warning #'muffle-warning)) (run-all-tests))
  (format t "~2&*****************************************~@
                **            Tests finished           **~@
                *****************************************~%"))
