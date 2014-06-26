{
 :dev {
        :dependencies [[clj-stacktrace "0.2.8"]]
        :injections [(require 'clj-stacktrace.repl)]
        :repl-options {
                       :caught clj-stacktrace.repl/pst+
                       }
        }
 }
