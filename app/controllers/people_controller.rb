class PeopleController < ApplicationController
  def show
    @person = Person.find(params[:id])
  end

  def create
    person = Person.create!(params[:person])
    render :json => {
      :attributes => { :'data-org-id' => person.organization_node.id },
      :data => {
        :title => "#{person.name} (Person)",
        :attributes => { :href => polymorphic_url(person) }
      }
    }.to_json
  end
end
