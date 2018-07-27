# Convert Ruby hashrocket (:foo => "bar") to Ruby 1.9 style (foo: "bar")
`s@:\([a-zA-Z_]\+\)\s*=>@\=submatch(1) . ": "@gc`
