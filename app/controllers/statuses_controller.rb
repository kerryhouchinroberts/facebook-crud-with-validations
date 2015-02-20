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
      redirect_to status_path(@status), notice: 'Status was successfully created.'
    else
      flash.now[:alert] = @status.errors.full_messages.join("<br>")
      render :new
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])

    if @status.update_attributes(status_params)
      redirect_to status_path(@status), notice: 'Status was successfully updated.'
    else
      flash.now[:alert] = @status.errors.full_messages.join("<br>")
      render :edit
    end
  end

  def destroy
    @status = Status.find(params[:id])
    if @status.destroy
      redirect_to statuses_path, notice: 'Status was sucessfully deleted.'
    end
  end

  def like
    @status = Status.find(params[:id])
    @like = Status.increment_counter(:likes, @status)
    redirect_to root_path
  end

  private
  def status_params
    params.require(:status).permit(:status_message, :user, :likes)
  end

end
