class AgenciesController < ApplicationController
  def show
    @agency = Agency.find(params[:id])
  end

  def create
    agency = Agency.create!(params[:agency])
    render :json => {
      :attributes => { :'data-org-id' => agency.organization_node.id },
      :data => {
        :title => "#{agency.name} (Agency)",
        :attributes => { :href => polymorphic_url(agency) }
      }
    }.to_json
  end
end
