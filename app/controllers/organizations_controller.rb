class OrganizationsController < ApplicationController
  def index
    @organizations = OrganizationNode.roots.map(&:contact)
  end
end
