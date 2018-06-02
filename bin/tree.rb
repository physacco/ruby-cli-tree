#!/usr/bin/env ruby
# encoding: utf-8

require 'getoptlong'
require_relative '../lib/cli-tree'

Program = File.basename $0

Usage = <<EOF
Usage: #{Program} [options] [dir]

Options:
  -h, --help                Print this help message and exit
  -v, --version             Print version information and exit
  -a, --all                 All files are printed, including hidden files

Arguments:
  dir                       The directory to traverse (Default: .)
EOF

VersionInfo = "#{Program} v#{TreeNode::VERSION}"

def parse_arguments
  opts = GetoptLong.new(
    ['--help',     '-h', GetoptLong::NO_ARGUMENT],
    ['--version',  '-v', GetoptLong::NO_ARGUMENT],
    ['--all',      '-a', GetoptLong::NO_ARGUMENT],
  )

  show_all = false

  begin
    opts.each do |opt, arg|
      case opt
        when '--help'
          puts Usage
          exit 0
        when '--version'
          puts VersionInfo
          exit 0
        when '--all'
          show_all = true
      end
    end
  rescue GetoptLong::Error
    exit 1
  end

  return {
    show_all: show_all,
    arguments: ARGV,
  }
end

def get_tree_node(path, **kwargs)
  name = File.basename(path)
  if File.directory?(path)
    children = []
    Dir.new(path).each do |entry|
      next if ['.', '..'].include?(entry)
      next if entry.start_with?('.') && !kwargs[:show_all]
      entry_path = File.join(path, entry)
      children << get_tree_node(entry_path, **kwargs)
    end
    TreeNode.new(name, children)
  else
    TreeNode.new(name)
  end
end

args = parse_arguments
dir = args.delete(:arguments).first || '.'
tree = get_tree_node(dir, **args)
tree.print
