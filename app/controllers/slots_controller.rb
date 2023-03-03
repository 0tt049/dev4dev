class SlotsController < ApplicationController
  def index
    @slots = Slot.all

    @slots = @slots.where(programming_language: params[:format]) if params[:format].present?
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
    @slot.user = @user
    if @slot.save
      redirect_to slot_path(@slot), notice: 'Your slot was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @slot = Slot.find(params[:id])
  end

  def update
    @slot = Slot.find(params[:id])
    if @slot.update(slot_params)
      redirect_to @slot, notice: 'Article was successfully created.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy
    redirect_to slots_path, status: :see_other
  end

  private

  def slot_params
    params.require(:slot).permit(:price, :programming_language, :start_date, :end_date, :start_time, :end_time)
  end
end
