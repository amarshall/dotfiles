{
  :user {
    :plugins [
      [cider/cider-nrepl "0.7.0"]
      [lein-ancient "0.5.5"]
    ]
  }
  :dev {
    :dependencies [[clj-stacktrace "0.2.8"]]
    :injections [(require 'clj-stacktrace.repl)]
    :repl-options {
      :caught clj-stacktrace.repl/pst+
    }
  }
}
