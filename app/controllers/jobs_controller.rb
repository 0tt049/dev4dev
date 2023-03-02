class JobsController < ApplicationController
  before_action :set_job, only: :destroy
  before_action :set_user, only: %i[new create]

  def new
    @job = job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job, notice: 'Your job was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    redirect_to '/', status: :see_other
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def job_params
    params.require(:job).permit(:name, :description)
  end
end
