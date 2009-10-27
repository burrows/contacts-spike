class OrganizationNode < ActiveRecord::Base
  acts_as_tree
  belongs_to :contact, :polymorphic => true
end
