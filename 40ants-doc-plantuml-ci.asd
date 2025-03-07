(defsystem "40ants-doc-plantuml-ci"
  :author "Alexander Artemenko <svetlyak.40wt@gmail.com>"
  :license "Unlicense"
  :homepage "https://40ants.com/doc-plantuml"
  :class :package-inferred-system
  :description "Provides CI settings for 40ants-doc-plantuml."
  :source-control (:git "https://github.com/40ants/doc-plantuml")
  :bug-tracker "https://github.com/40ants/doc-plantuml/issues"
  :pathname "src"
  :depends-on ("40ants-ci"
               "40ants-doc-plantuml-ci/ci"))
