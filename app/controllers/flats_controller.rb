class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @flat = Flat.find((params[:id]))
  end

# DELETE /restaurants/x

  def destroy
    @flat = Flat.find((params[:id]))
    @flat.destroy
    redirect_to flats_path(@flat), status: :see_other
  end

  private

  # Only allow a list of trusted parameters through.
  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :amenities)
  end

end
