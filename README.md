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

**TreeNode** methods:
* `initialize(name, children = [])`
* `TreeNode.from_h(hash)`: hash is `{name: "string", children: [hash1, ...]}`
* `TreeNode.from_json(json)`: similar to `from_h`
* `to_h`: convert TreeNode to Hash
* `to_json(**kwargs)`: kwargs refer to [JSON#generate](http://ruby-doc.org/stdlib-2.0.0/libdoc/json/rdoc/JSON.html#method-i-generate)
* `render`: draw an ASCII tree graph
* `print(stream: STDOUT, prefix: '')`: puts the rendered text to a stream

## Example

```ruby
require 'cli-tree'

# the tree and all nodes are TreeNode objects
tree = TreeNode.new("root", [
  TreeNode.new("foo", [
    TreeNode.new("bar"),
    TreeNode.new("baz"),
  ])
])

puts tree.render
```

or build the tree from a Hash or JSON:

```ruby
require 'cli-tree'

data = {
  name: "root",  # every node must have a name
  children: [    # and an optional children array
    {  # non-leaf child must be a Hash
      name: "foo",
      children: [
        "bar",  # leaf child can be a String
        "baz",
      ],
    },
  ],
}

tree = TreeNode.from_h(data)
tree.print
```

Output:

```
root
└── foo
    ├── bar
    └── baz
```
