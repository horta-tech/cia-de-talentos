class Api::V1::StaffController < Api::V1::BaseController
  def index
    @staff = Staff.all
    
    render json: @staff
  end
end