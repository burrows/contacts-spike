module OrganizationsHelper
  def generate_tree(organizations)
    content_tag(:ul,
      content_tag(:li,
        content_tag(:a, "<ins>&nbsp;</ins>Contacts", :href => '#') +
        content_tag(:ul, organizations.map { |o| generate_tree_node(o) }.join)))
  end

  def generate_tree_node(org)
    link = content_tag(:a, "<ins>&nbsp;</ins>#{org.name} (#{org.type})", :href => '#')

    org.children.any? ?
      content_tag(:li, link + content_tag(:ul, org.children.map { |c| generate_tree_node(c) }.join)) :
      content_tag(:li, link, :rel => 'default')
  end
end
