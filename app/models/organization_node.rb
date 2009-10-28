class OrganizationNode < ActiveRecord::Base
  acts_as_tree
  belongs_to :contact, :polymorphic => true

  named_scope :roots, :conditions => 'parent_id IS NULL'
end
