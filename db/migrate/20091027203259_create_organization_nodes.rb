class CreateOrganizationNodes < ActiveRecord::Migration
  def self.up
    create_table :organization_nodes do |t|
      t.references :contact, :polymorphic => true
      t.integer :parent_id
      t.timestamps
    end
  end

  def self.down
    drop_table :organization_nodes
  end
end
