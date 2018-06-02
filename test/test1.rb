require_relative '../lib/cli-tree'

tree = TreeNode.new("root", [
  TreeNode.new("foo", [
    TreeNode.new("bar"),
    TreeNode.new("baz")
  ])
])

puts tree.render

json = tree.to_json(indent: "  ", space: " ", object_nl: "\n", array_nl: "\n")
puts json

tree2 = TreeNode.from_json(json)
tree2.print
