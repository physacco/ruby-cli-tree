require 'json'

class TreeNode
  VERSION = '1.0.0'

  attr_accessor :name, :children

  def initialize(name, children = [])
    @name = name
    @children = children
  end

  def TreeNode.from_h(hash)
    if hash.is_a?(Hash)
      raw_children = hash.has_key?(:children) ? hash[:children] : []
      children = raw_children.map{|ch| TreeNode.from_h(ch)}
      TreeNode.new hash[:name], children
    else
      TreeNode.new hash
    end
  end

  def TreeNode.from_json(json)
    hash = JSON.parse json, symbolize_names: true
    TreeNode.from_h hash
  end

  def to_h
    {
      name: @name,
      children: @children.map{|node| node.to_h}
    }
  end

  def to_json(**kwargs)
    JSON.generate(to_h, **kwargs)
  end

  def render
    lines = [@name]
    @children.each_with_index do |child, index|
      child_lines = child.render
      if index < @children.size - 1
        child_lines.each_with_index do |line, idx|
          prefix = (idx == 0) ? "├── " : "|   "
          lines << "#{prefix}#{line}"
        end
      else
        child_lines.each_with_index do |line, idx|
          prefix = (idx == 0) ? "└── " : "    "
          lines << "#{prefix}#{line}"
        end
      end
    end
    lines
  end

  def print(stream: STDOUT, prefix: '')
    stream.puts render.map{|line| "#{prefix}#{line}\n"}
  end
end
