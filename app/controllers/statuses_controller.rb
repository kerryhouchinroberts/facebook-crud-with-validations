class StatusesController < ApplicationController

  def index
    @statuses = Status.all
  end

  def show
    @status = Status.find[params(:id)]
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    if @status.save
      redirect to status_show[params(:id)], notice: 'Status successfully created.'
    else
      flash.now[:alert] = 'There were some errors that prevented your status from being saved'
      flash.now[:alert] << "<br>"
      flash.now[:alert] << @status.errors.full_messages.join("<br>")
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private
  def status_params
    params.require(:status).permit(:user, :likes)
  end

end
