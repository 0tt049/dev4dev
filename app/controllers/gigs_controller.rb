class GigsController < ApplicationController
  def new
    @gig = Gig.new
    @user = current_user
    @slot = Slot.find(params[:slot_id])
  end

  def create
    @gig = Gig.new(gig_params)
    @slot = Slot.find(params[:slot_id])
    @gig.slot = @slot
    @gig.user = current_user
    if @gig.save
      redirect_to slot_path(params[:slot_id]), notice: 'Your gig was successfully created!'
    else
      render :new, status: :unprocessable_entity, notice: "Shit happened"
    end
  end

  def edit
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])
    if @gig.update(gig_params)
      redirect_to gigs_hired_path, notice: 'Gig updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    redirect_to slots_path, status: :see_other
  end


  def hired
    @gigs = Gig.where(user_id: current_user.id)
  end

  private

  def gig_params
    params.require(:gig).permit(:name, :description)
  end
end
