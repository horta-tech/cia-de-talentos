class PhotosController < ApplicationController

  def create
    @photo = Photo.new(photo_params)
    authorize @photo
    @photo.save
    redirect_to edit_customer_path(@photo.customer_id)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    authorize @photo
    redirect_to edit_customer_path(@photo.customer_id)
  end

  private

  def photo_params
    params.require(:photo).permit(:upload, :customer_id)
  end

end
