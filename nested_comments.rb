class NestedComments
  def output_list_items(comments, depth=0)
    __ = indent(depth)
    comments.each do |comment|
      if (children = children_of(comment))
        puts __ + "<li>#{comment.nesting}"
        output_list children, depth.succ
        puts __ + "</li>"
      else
        puts __ + "<li>#{comment.nesting}</li>"
      end
    end
  end

  def indent(depth)
    "  " * depth
  end

  def root_comments
    comment_groups[nil]
  end

  def children_of(comment)
    comment_groups[comment.id]
  end

  def comment_groups
    @groups ||= @data.group_by(&:parent_id)
  end

  def initialize(data)
    @data = data
  end

  def output_list(comments, depth=0)
    __ = "  " * depth
    puts __ + "<ul>"
    output_list_items comments, depth.succ
    puts __ + "</ul>"
  end

  def show
    output_list root_comments
  end

  def self.show_expected_results(comments)
    new(comments).show
  end
end
