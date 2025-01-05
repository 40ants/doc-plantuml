(defsystem "40ants-doc-plantuml-docs"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/doc-plantuml"
  :class :package-inferred-system
  :description "Provides documentation for 40ants-doc-plantuml."
  :source-control (:git "https://github.com/40ants/doc-plantuml")
  :bug-tracker "https://github.com/40ants/doc-plantuml/issues"
  :pathname "docs"
  :depends-on ("40ants-doc-plantuml"
               "40ants-doc-plantuml-docs/index"))
