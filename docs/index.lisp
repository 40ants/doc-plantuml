(uiop:define-package #:40ants-doc-plantuml-docs/index
  (:use #:cl)
  (:import-from #:pythonic-string-reader
                #:pythonic-string-syntax)
  #+quicklisp
  (:import-from #:quicklisp)
  (:import-from #:named-readtables
                #:in-readtable)
  (:import-from #:40ants-doc
                #:defsection
                #:defsection-copy)
  (:import-from #:40ants-doc-plantuml-docs/changelog
                #:@changelog)
  (:import-from #:docs-config
                #:docs-config)
  (:import-from #:40ants-doc/autodoc
                #:defautodoc)
  (:import-from #:40ants-doc-plantuml
                #:defdiagram)
  (:import-from #:serapeum
                #:eval-always)
  (:export #:@index
           #:@readme
           #:@changelog))
(in-package #:40ants-doc-plantuml-docs/index)

(in-readtable pythonic-string-syntax)


(defmethod docs-config ((system (eql (asdf:find-system "40ants-doc-plantuml-docs"))))
  ;; 40ANTS-DOC-THEME-40ANTS system will bring
  ;; as dependency a full 40ANTS-DOC but we don't want
  ;; unnecessary dependencies here:
  #+quicklisp
  (ql:quickload "40ants-doc-theme-40ants")
  #-quicklisp
  (asdf:load-system "40ants-doc-theme-40ants")
  
  (list :theme
        (find-symbol "40ANTS-THEME"
                     (find-package "40ANTS-DOC-THEME-40ANTS"))))


(defsection @index (:title "40ants-doc-plantuml - An extension to 40ants-doc Common Lisp documentation library to render PlantUML diagrams inside of the documentation."
                    :ignore-words ("JSON"
                                   "HTTP"
                                   "TODO"
                                   "Unlicense"
                                   "UML"
                                   "PlantUML"
                                   "REPL"
                                   "ASDF:PACKAGE-INFERRED-SYSTEM"
                                   "ASDF"
                                   "40A"
                                   "API"
                                   "URL"
                                   "URI"
                                   "RPC"
                                   "GIT"))
  (40ants-doc-plantuml system)
  "
[![](https://github-actions.40ants.com/40ants/doc-plantuml/matrix.svg?only=ci.run-tests)](https://github.com/40ants/doc-plantuml/actions)

![Quicklisp](http://quickdocs.org/badge/40ants-doc-plantuml.svg)
"
  (@installation section)
  (@usage section)
  (@api section))


(defsection @readme (:title "40ants-doc-plantuml - An extension to 40ants-doc Common Lisp documentation library to render PlantUML diagrams inside of the documentation."
                     :ignore-words ("JSON"
                                    "HTTP"
                                    "TODO"
                                    "Unlicense"
                                    "UML"
                                    "PlantUML"
                                    "REPL"
                                    "ASDF:PACKAGE-INFERRED-SYSTEM"
                                    "ASDF"
                                    "40A"
                                    "API"
                                    "URL"
                                    "URI"
                                    "RPC"
                                    "GIT"))
  (40ants-doc-plantuml system)
  "
[![](https://github-actions.40ants.com/40ants/doc-plantuml/matrix.svg?only=ci.run-tests)](https://github.com/40ants/doc-plantuml/actions)

![Quicklisp](http://quickdocs.org/badge/40ants-doc-plantuml.svg)
"
  (@installation section)
  ;; Because generated diagram images can't be published in the "master" branch
  ;; we have to create a separate readme section without an image.
  (@short-usage section)
  (@api section))


(defsection @installation (:title "Installation")
  """
You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :40ants-doc-plantuml)
```
""")


(eval-always
  (defparameter *diagram-code* "
@startuml
start
if (Are you\\nusing\\nCommon Lisp?) then (yes)
  label space1
  label space2
  :Cool!;
else (no)
  :Go learn it!;
  if (Do you know\\nwhere\\nto start?) then (yes)
    :Just do it!;
  else (no)
    :Open lisp-lang.org;
  endif
  :Join the\\ncommunity.;
endif
:You are\\nmarvelous!;
end
@enduml
")

  
  (defparameter *shared-doc* (format nil "
Use DEFDIAGRAM macro to define a diagram:

```
(defdiagram @demo ()
  \"
~A
\")
```

Then you can include this diagram into a documentation section:

```
(defsection @example (:title \"Example\")
  \"Here is our diagram:\"
  (@demo diagram))
```
"
                                     *diagram-code*)))


(defsection @short-usage (:title "Usage")
  #.*shared-doc*
  "
and image will be rendered like this:

![](https://40ants.com/doc-plantuml/images/demo.png)
")


(defsection @usage (:title "Usage")
  #.*shared-doc*
  "and image will be rendered like this:"
  (@demo diagram))


(defdiagram @demo ()
  *diagram-code*)


(defautodoc @api (:system "40ants-doc-plantuml"))
