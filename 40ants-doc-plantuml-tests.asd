(defsystem "40ants-doc-plantuml-tests"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/doc-plantuml"
  :class :package-inferred-system
  :description "Provides tests for 40ants-doc-plantuml."
  :source-control (:git "https://github.com/40ants/doc-plantuml")
  :bug-tracker "https://github.com/40ants/doc-plantuml/issues"
  :pathname "t"
  :depends-on ("40ants-doc-plantuml-tests/core")
  :perform (test-op (op c)
                    (unless (symbol-call :rove :run c)
                      (error "Tests failed"))))
