class V1::EstablishmentsController < ApplicationController

  # POST /v1/establishments
  def create
    establishment = EstablishmentService.new(establishment_params).create_establishment
    render json: establishment
  end

  def establishment_params
    params.require(:establishment).permit(:name, :registration_number,
                                          address_attributes: address_attributes,
                                          users_attributes: user_attributes)
  end

  def address_attributes
    [:id, :city, :state, :country, :zip]
  end

  def user_attributes
    [:id, :firstname, :lastname, :email, :date_of_birth, :phone]
  end

end
