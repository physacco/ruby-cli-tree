# ruby-cli-tree

A command line printer of tree structures (e.g. directory tree) written in Ruby.

This library can be used to build a tree structure, and render or print it
like an ASCII graph. It can be used to implement a directory tree printer
or something like that.

Example:

```ruby
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
```

Output:

```
root
└── foo
    ├── bar
    └── baz
```
