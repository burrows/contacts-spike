module Organizable
  def self.included(klass)
    klass.before_create :init_organization_node
    klass.has_one :organization_node, :as => :contact, :dependent => :destroy
  end

  def parent
    self.organization_node.parent.try(:contact)
  end

  def children
    self.organization_node.children.map(&:contact)
  end

  def add_child(child)
    self.organization_node.children << child.organization_node
  end

  private

  def init_organization_node
    self.build_organization_node
  end
end
