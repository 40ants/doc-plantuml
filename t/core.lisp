(uiop:define-package #:40ants-doc-plantuml-tests/core
  (:use #:cl)
  (:import-from #:rove
                #:deftest
                #:ok
                #:testing))
(in-package #:40ants-doc-plantuml-tests/core)


(deftest test-example ()
  (ok t "Replace this test with something useful."))
