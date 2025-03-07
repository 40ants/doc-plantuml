(uiop:define-package #:40ants-doc-plantuml-ci/ci
  (:use #:cl)
  (:import-from #:40ants-ci/jobs/linter)
  (:import-from #:40ants-ci/jobs/run-tests
                #:run-tests)
  (:import-from #:40ants-ci/jobs/docs
                #:build-docs)
  (:import-from #:40ants-ci/workflow
                #:defworkflow)
  (:import-from #:40ants-ci/steps/sh
                #:sh))
(in-package #:40ants-doc-plantuml-ci/ci)


(defworkflow linter
  :on-push-to "master"
  :by-cron "0 10 * * 1"
  :on-pull-request t
  :cache t
  :jobs ((40ants-ci/jobs/linter:linter
          :asdf-systems ("40ants-doc-plantuml"
                         "40ants-doc-plantuml-docs"
                         "40ants-doc-plantuml-tests")
          :check-imports t)))

(defworkflow docs
  :on-push-to "master"
  :by-cron "0 10 * * 1"
  :on-pull-request t
  :cache t
  :jobs ((build-docs :asdf-system "40ants-doc-plantuml-docs"
                     :steps (list
                             (sh "Install PlantUML"
                                 "sudo apt-get install -y plantuml")))))


(defworkflow ci
  :on-push-to "master"
  :by-cron "0 10 * * 1"
  :on-pull-request t
  :cache t
  :jobs ((run-tests
          :asdf-system "40ants-doc-plantuml"
          :lisp ("sbcl-bin"
                 "ccl-bin")
          :coverage t)))
