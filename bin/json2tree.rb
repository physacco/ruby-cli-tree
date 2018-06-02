#!/usr/bin/env ruby
# encoding: utf-8

require_relative '../lib/cli-tree'

if ARGV.size == 0
  STDERR.puts "Usage: #{$0} input.json"
  exit 1
end

json = File.read ARGV.first
tree = TreeNode.from_json json
tree.print
