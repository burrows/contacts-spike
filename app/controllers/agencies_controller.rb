class AgenciesController < ApplicationController
  def show
    @agency = Agency.find(params[:id])
  end
end
