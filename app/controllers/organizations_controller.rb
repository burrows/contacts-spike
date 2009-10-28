class OrganizationsController < ApplicationController
  def index
    @organizations = OrganizationNode.roots.map(&:contact)
  end

  def move
    node = OrganizationNode.find(params[:node])
    ref  = OrganizationNode.find(params[:ref])
    type = params[:type]

    if type == 'before' || type == 'after'
      if ref.parent
        ref.parent.children << node
      else
        node.update_attribute(:parent_id, nil)
      end
    else
      ref.children << node
    end

    render :nothing => true
  end
end
