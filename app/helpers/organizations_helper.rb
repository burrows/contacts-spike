module OrganizationsHelper
  def generate_tree(organizations)
    content_tag(:ul,
      content_tag(:li,
        content_tag(:a, "<ins>&nbsp;</ins>Contacts", :href => '#') +
        content_tag(:ul, organizations.map { |o| generate_tree_node(o) }.join)))
  end

  def generate_tree_node(org)
    link = content_tag(:a, "<ins>&nbsp;</ins>#{org.name} (#{org.type})",
                       :href => polymorphic_url(org))
    opts = { :rel => 'default', 'data-org-id' => org.organization_node.id }

    org.children.any? ?
      content_tag(:li, link + content_tag(:ul, org.children.map { |c| generate_tree_node(c) }.join), opts) :
      content_tag(:li, link, opts)
  end
end
