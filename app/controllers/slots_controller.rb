class SlotsController < ApplicationController
  def index
    @gigs = Gig.all
    all_slots = Slot.all
    @slots = []

    # Lists all that don't have a gig yet/not bought
    all_slots.each { |slot| @slots << slot unless @gigs.where(slot: slot.id).present? }

    # Filter by programming language
    @slots = @slots.find_all { |slot| slot.programming_language == params[:format] } if params[:format].present?
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
      redirect_to @slot, notice: 'Slot updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy
    redirect_to slots_path, status: :see_other
  end

  def owned
    @slots = Slot.where(user_id: current_user.id)
  end

  private

  def slot_params
    params.require(:slot).permit(:price, :programming_language, :start_date, :end_date, :start_time, :end_time)
  end
end
