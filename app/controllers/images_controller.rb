class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show update destroy ]
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end
  def update
  end
  def destroy
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.expect(image: [:small_image])
  end
end
