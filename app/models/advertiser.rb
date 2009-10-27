class Advertiser < ActiveRecord::Base
  has_one :organization_node, :as => :contact
end
