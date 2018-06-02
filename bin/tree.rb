#!/usr/bin/env ruby
# encoding: utf-8

require_relative '../lib/cli-tree'

def get_tree_node(path)
  name = File.basename(path)
  if File.directory?(path)
    children = []
    Dir.new(path).each do |entry|
      next if ['.', '..'].include?(entry)
      entry_path = File.join(path, entry)
      children << get_tree_node(entry_path)
    end
    TreeNode.new(name, children)
  else
    TreeNode.new(name)
  end
end

top_dir = ARGV.first || '.'
tree = get_tree_node(top_dir)
tree.print
