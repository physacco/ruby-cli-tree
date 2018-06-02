# encoding: utf-8

require_relative 'lib/cli-tree'

Gem::Specification.new do |s|
  s.name        = 'cli-tree'
  s.version     = TreeNode::VERSION
  s.date        = '2018-06-02'

  s.summary     = 'A command line printer of tree structures (e.g. directory tree) written in Ruby.'
  s.description = <<EOF
This library can be used to build a tree structure, and render or print it
like an ASCII graph. It can be used to implement a directory tree printer
or something like that.

Example:

    require 'cli-tree'

    tree = TreeNode.new("root", [
      TreeNode.new("foo", [
        TreeNode.new("bar"),
        TreeNode.new("baz")
      ])
    ])

    puts tree.render
    # or simply
    tree.print

Output:

    root
    └── foo
        ├── bar
        └── baz
EOF

  s.authors     = ['physacco']
  s.email       = ['physacco@gmail.com']
  s.homepage    = 'https://github.com/physacco/ruby-cli-tree'
  s.license     = 'MIT'

  s.files       = Dir['lib/**/*.rb'] + Dir['bin/*'] +
                  ['README.md', 'LICENSE', 'ruby-cli-tree.gemspec']
  s.executables = ['tree.rb']

  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.0.0'
end
