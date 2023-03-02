class GigsController < ApplicationController
  before_action :set_gig, only: :destroy
  before_action :set_user, only: %i[new create]

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
    @gig.user = @user
    if @gig.save
      redirect_to @gig, notice: 'Your gig was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # @gig.destroy
    # redirect_to '/', status: :see_other
  end

  private

  def gig_params
    params.require(:gig).permit(:name, :description, :slot_id)
  end

  def set_gig
    @gig = Gig.find(params[:id])
  end

  def set_slot
    @user = User.find(params[:user_id])
  end
end
