class EntriesController < ApplicationController

before_action :find_entry, only: %w(edit update show)
before_action :user_logged_in, only: %w(new create edit update destroy dashboard)

  def index
    @entry = Entry.order("date_posted DESC").page(params[:page]).per(4)
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new entry_params
    @entry.user_id = current_user.id
    if @entry.save
      flash[:notice] = "New entry successfully posted."
      redirect_to dashboard_url
    else
      render "new"
      flash[:notice] = "Entry not created."
    end
  end

  def edit
  end

  def update
    if @entry.update entry_params
      flash[:notice] = "Entry successfully updated."
      redirect_to dashboard_url
    else
      render "edit"
      flash[:notice] = "Entry not updated."
    end
  end

  def destroy
    Entry.find(params[:id]).destroy
    flash[:notice] = "Entry deleted."
    redirect_to dashboard_url
  end

  def dashboard
    @entry = current_user.entries.order("date_posted DESC").page(params[:page]).per(4)
  end

  private

  def find_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(
      :title, :post, :date_posted, :entry_image, :entry_image_url, :remove_entry_image, :retained_entry_image, :user_id
    )
  end
end
