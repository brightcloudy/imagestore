class PhoneNumberController < ApplicationController
  before_action :authenticate_user!


  def index
    @numbers = PhoneNumber.where("user_id = ?", current_user.id)
    @new_number = PhoneNumber.new
  end

  def create
    existing_number = PhoneNumber.find_by(number: params[:phone_number][:number])
    if !existing_number.nil?
      flash[:error] = "Phone number already registered in system."
      redirect_to phone_number_index_path
      return
    end
    @number = PhoneNumber.new(params.require('phone_number').permit('number'))
    @number.user_id = current_user.id

    if @number.save
      flash[:success] = "Phone number added successfully."
      redirect_to phone_number_index_path
    else
      flash[:error] = "Error adding phone number!"
      redirect_to phone_number_index_path
    end
  end

  def destroy
    @number = PhoneNumber.find(params[:id])
    @number.destroy

    flash[:success] = "Phone number deleted successfully!"
    redirect_to phone_number_index_path
  end
end
