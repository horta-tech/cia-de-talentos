class LeadsController < ApplicationController

  def create
    @lead = Lead.new(lead_params)
    authorize @lead
    @lead.save
    redirect_to root_path
  end

  private

  def lead_params
    params.require(:lead).permit(:name, :email, :phone)
  end

end
