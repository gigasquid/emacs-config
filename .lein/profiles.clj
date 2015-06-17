{:user {:plugins [[lein-pprint "1.1.1"]
                  [lein-localrepo "0.4.0"]
                  [cider/cider-nrepl "0.9.0"]
                  [lein-maven-s3-wagon "0.2.3"]
                  [lein-ancient "0.5.5"]
                  [chestnut/lein-template "0.5.0"]
                  [com.jakemccrary/lein-test-refresh "0.9.0"]
                  [lein-deps-tree "0.1.2"]]
        :test-refresh {:notify-command ["terminal-notifier" "-title" "Tests" "-message"]}}}
