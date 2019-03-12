# Useful commands

Here lie some useful commands that are awesome but are usually too rarely used to remember. They are useful for...

- Validating a macOS binary's code signature
  ```
  codesign -v /Applications/Example.app
  ```

- Determining DNS info
  ```
  dig @8.8.8.8 example.com any
  ```

- Determining the architectures within a universal binary
  ```
  file
  ```

- Finding C/C++ standard libraries
  ```
  `clang -print-prog-name=cc1` -v
  `clang -print-prog-name=cc1plus` -v
  ```

- Updating all git submodules
  ```
  git submodule foreach git pull origin master
  ```

- Finding what package installed a binary (Ubuntu/Debian)
  ```
  dpkg -S `which examplebinary`
  ```

- Searching for a string/regex in git diff history
  ```
  git -Sstringtosearchfor --since=2012.2.17 --until=2012.3.14 -- pathname
  git --pickaxe-regex "regextosearchfor" --since=2012.2.17 --until=2012.3.14 --pathname
  ```

- Compiling Ruby with ruby-install and optimizations
  ```
  ruby-install --cleanup --jobs --src-dir "$TMPDIR" RUBY_PLATFORM RUBY_VERSION
  ```

- Getting an SSH key's fingerprint
  ```
  ssh-keygen -lf /path/to/keyfile
  ```

- Removing excessive trailing newlines from files
  ```
  find . -type f -print0 | xargs -0 perl -pi -w -e 'BEGIN{$/=undef}; s/(\n)+\Z/\n/'
  ```

- Removing (more than two) consecutive blank lines from files
  ```
  find . -type f -print0 | xargs -0 perl -pi -w -e 'BEGIN{$/=undef}; s/\n\n+/\n\n/'
  ```

- Removing excess padding in Ruby class/def/end blocks
  ```
  find app lib spec config -type f -iname '*.rb' -print0 | xargs -0 perl -pi -w -e 'BEGIN{$/=undef}; s/(\n *end\n)\n+( *end\n)/$1$2/'
  find app lib spec config -type f -iname '*.rb' -print0 | xargs -0 perl -pi -w -e 'BEGIN{$/=undef}; s/(\n *(class|def) [^\n]*\n)\n+/$1/'
  find app lib spec config -type f -iname '*.rb' -print0 | xargs -0 perl -pi -w -e 'BEGIN{$/=undef}; s/( do(\n|(\|[^|\n]+)?)\n)\n+/$1/'
  ```

- Finding the MTU used between two machines (test from boths ends)
  ```
  route get <machine name>
  ```

- Finding hosts on your LAN (best with sudo, change subnet accordingly)
  ```
  nmap -sn -oG - 192.168.1.0/24 | egrep '^Host:' | column -t
  ```
