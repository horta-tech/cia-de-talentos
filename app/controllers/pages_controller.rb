class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :portfolio, :horta, :location, :chat]
  def chat
  end

  def location
  end

  def portfolio
    @customers = Customer.all
  end

  def horta
    @staff = Staff.all
  end
end
