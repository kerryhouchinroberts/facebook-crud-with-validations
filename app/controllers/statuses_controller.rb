class StatusesController < ApplicationController

  def index
    @statuses = Status.all
  end

  def show
    @status = Status.find(params[:id])
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to status_path(@status), notice: 'Status successfully created.'
    else
      flash.now[:alert] = 'There were some errors that prevented your status from being saved'
      flash.now[:alert] << "<br>"
      flash.now[:alert] << @status.errors.full_messages.join("<br>")
      render :new
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def destroy
    @status = Status.find(params[:id])
    if @status.destroy
      redirect_to statuses_path, notice: 'Status was sucessfully deleted.'
    end
  end

  private
  def status_params
    params.require(:status).permit(:status_message, :user, :likes)
  end

end
