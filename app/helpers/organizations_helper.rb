module OrganizationsHelper
  def generate_tree(org)

    if org.children.size == 0
      s = content_tag(:li, "#{org.name} (#{org.type})")
    else
      s = content_tag(:li, "#{org.name} (#{org.type})" + org.children.map { |c| generate_tree(c) }.join)
    end

    content_tag(:ul, s)
  end
end
