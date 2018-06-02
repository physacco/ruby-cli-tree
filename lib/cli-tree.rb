class TreeNode
  VERSION = '1.0.0'

  attr_accessor :name, :children

  def initialize(name, children = [])
    @name = name
    @children = children
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
