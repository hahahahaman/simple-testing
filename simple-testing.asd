;;;; simple-testing.asd

(asdf:defsystem #:simple-testing
  :description "Describe simple-testing here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :serial t
  :components ((:file "package")
               (:file "simple-testing")))

(asdf:defsystem #:simple-testing.tests
  :depends-on (:simple-testing)
  :serial t
  :components ((:file tests)))

;; code from chanl project
(defmethod asdf:perform ((op asdf:test-op)
                         (system (eql (asdf:find-system :simple-testing))))
  (format t "~2&***************************************~@
                ** Loading simple-testing unit tests **~@
                ***************************************~%")
  (asdf:oos 'asdf:load-op :simple-testing.tests)
  (asdf:oos 'asdf:test-op :simple-testing.tests))
