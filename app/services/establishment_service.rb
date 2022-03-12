class EstablishmentService

  def initialize(params)
    @establishment_params = params
  end

  def create_establishment
    Establishment.create!(@establishment_params)
  end

end