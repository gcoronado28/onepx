class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new secure_params
    if @image.save
      # We redirect to index instead of redirecting to a create view.
      # With notice, we add the object name to the flash object, which will send info between views.
      return redirect_to images_path, notice: t('.created', model: @image.class.model_name.human)
    end
    render :new
  end

  private
  def secure_params
    params.require(:image).permit :name, :description, :category, :tags_text
  end
end
