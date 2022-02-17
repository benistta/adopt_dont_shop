class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])

    if params[:search].present?
      @pets = Pet.where(name: params[:search])
    else
      @pets = []
    end
  end

  def new

  end


  def create
    application = Application.new(application_params)
    application.update(status: "In Progress")
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      redirect_to "/applications/new"
      flash[:alert] = "Error: #{error_message(application.errors)}"
    end
  end

  def update
    application = Application.find(params[:id])
    application.pets << Pet.find(params[:pet_id])
    # application.add_pet(pet)
    application.save
    redirect_to "/applications/#{application.id}"

  end


private
  def application_params

    params.permit(:name, :street_address, :city, :state, :zip_code, :description, :pet_id)
    .with_defaults(status: "In Progress")
  end
end
