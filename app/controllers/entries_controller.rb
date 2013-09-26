class EntriesController < ApplicationController

before_action :find_entry, only: %w(edit update show)

  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new entry_params
    if @entry.save
      flash[:notice] = "New entry successfully posted."
      redirect_to root_url
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
      redirect_to root_url
    else
      render "edit"
      flash[:notice] = "Entry not updated."
    end
  end

  def destroy
    Entry.find(params[:id]).destroy
    flash[:notice] = "Entry deleted."
  end

  private

  def find_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :post, :date_posted)
  end
end
