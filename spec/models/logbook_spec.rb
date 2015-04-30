require 'rails_helper'

RSpec.describe Logbook, type: :model do
  it 'llenar un registro invalido de visita' do
    logbook = Logbook.new
    logbook.should_not be_valid
  end

  it 'llenar un registro valido de visita' do
    logbook = Logbook.new

    logbook.first_name = 'Juan Carlos'
    logbook.second_name =  'Moreno Dolores'
    #logbook.office = 'Recursos Humanos'
    #logbook.cell = Definir foto de la credencial
    #logbook.cell = Definir foto del visitante
    logbook.should be_valid
  end
end
