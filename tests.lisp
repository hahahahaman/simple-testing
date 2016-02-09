(in-package :cl-user)
(defpackage #:simple-testing.tests
  (:nicknames :stest.tests)
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

(deftest test-failure ()
  "Test that failure works."
  (format t "~%Failure expect:~%")
  (check
    (eql 1 2)
    (eql (equalp nil t) t)))

(defun run-all-tests ()
  (test-arithmetic)
  (test-failure))

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
