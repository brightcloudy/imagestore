class ImageController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :index]

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params.require('image').permit('document'))
    @image.user_id = current_user.id
    @image.random_url = SecureRandom.hex(3)
    if @image.save
      flash[:success] = "Image uploaded successfully!"
      redirect_to image_path(@image.random_url)
    else
      flash[:error] = "Image upload failed."
      redirect_to :back
    end
  end

  def show
    @image = Image.find_by(random_url: params[:random_url])
  end

  def index
    @images = Image.where("user_id = ?", current_user.id)
  end

  def destroy
    @image = Image.find_by(random_url: params[:random_url])
    @image.destroy

    flash[:success] = "Image #{params[:random_url]} deleted successfully."

    redirect_to images_path
  end

end
