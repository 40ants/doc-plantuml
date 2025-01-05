(uiop:define-package #:40ants-doc-plantuml
  (:use #:cl)
  (:import-from #:40ants-doc/locatives/base
                #:locate-object
                #:define-locative-type)
  (:import-from #:40ants-doc/locatives
                #:diagram)
  (:import-from #:40ants-doc-full/commondoc/builder
                #:to-commondoc)
  (:import-from #:str
                #:trim)
  (:import-from #:serapeum
                #:fmt)
  (:import-from #:40ants-doc-full/builder/vars)
  (:import-from #:40ants-doc-full/commondoc/image
                #:local-image)
  (:import-from #:40ants-plantuml)
  (:nicknames #:40ants-doc-plantuml/core)
  (:export #:defdiagram))
(in-package #:40ants-doc-plantuml)


(defclass diagram ()
  ((filename :initarg :filename
             :type string
             :reader diagram-filename)
   (code :initarg :code
         :type string
         :reader diagram-code)))


(defmacro defdiagram (name () &body code)
  (check-type name symbol)

  (let ((filename (fmt "images/~A.png"
                       (trim (string-downcase name)
                             :char-bag "@"))))
    `(defparameter ,name
       (make-instance 'diagram
                      :filename ,filename
                      :code (progn ,@code)))))


(define-locative-type diagram ()
  "Refers to a PlantUML diagram.")


(defmethod locate-object (symbol (locative-type (eql 'diagram)) locative-args)
  (let ((diagram (symbol-value symbol)))
    (check-type diagram diagram)
    (values diagram)))


(defmethod to-commondoc ((diagram diagram))
  (uiop:with-temporary-file (:pathname pathname
                             :type "png"
                             :keep t)
    (ensure-directories-exist pathname)
    
    (40ants-plantuml:render (diagram-code diagram)
                            pathname)
    (let ((image
            (local-image
             (namestring pathname)
             :target-filename (diagram-filename diagram))))
      (common-doc:make-paragraph image))))
