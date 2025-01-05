#-asdf3.1 (error "40ants-doc-plantuml requires ASDF 3.1 because for lower versions pathname does not work for package-inferred systems.")
(defsystem "40ants-doc-plantuml"
  :description "An extension to 40ants-doc Common Lisp documentation library to render PlantUML diagrams inside of the documentation."
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/doc-plantuml"
  :source-control (:git "https://github.com/40ants/doc-plantuml")
  :bug-tracker "https://github.com/40ants/doc-plantuml/issues"
  :class :40ants-asdf-system
  :defsystem-depends-on ("40ants-asdf-system")
  :pathname "src"
  :depends-on ("40ants-doc-plantuml/core")
  :in-order-to ((test-op (test-op "40ants-doc-plantuml-tests"))))
