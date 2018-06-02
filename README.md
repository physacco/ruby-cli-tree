# ruby-cli-tree

A command line printer of tree structures (e.g. directory tree) written in Ruby.

This library can be used to build a tree structure, and render or print it
like an ASCII graph.

e.g. it can be used to implement a directory tree printer
just like the Linux utility [tree](http://mama.indstate.edu/users/ice/tree/). See [bin/tree.rb](bin/tree.rb)

## Installation

```shell
gem install cli-tree
```

## Usage

1. `require 'cli-tree'`
2. Create a **TreeNode**: `tree = TreeNode.new(node_name, children = [])`
3. Add more **TreeNode** objects to `children`: `tree.children << child_node`
4. Add more **TreeNode** objects to `child_node`, and so on.
5. Call `puts tree.render` or `tree.print` to print the tree.

## Example

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
