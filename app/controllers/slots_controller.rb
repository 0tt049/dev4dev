class SlotsController < ApplicationController
  def index
    @slots = Slot.all
  end

  def show
    @slot = Slot.find(params[:id])
  end

  def new
    @slot = Slot.new
    @user = current_user
  end

  def create
    @slot = Slot.new(slot_params)
    @user = current_user
    @slot.user_id = @user.id
    if @slot.save
      redirect_to slot_path(@slot), notice: 'Your slot was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def slot_params
    params.require(:slot).permit(:price, :programming_language, :start_date, :end_date, :start_time, :end_time)
  end
end
