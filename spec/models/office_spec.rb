require 'rails_helper'

RSpec.describe Office, type: :model do
  it 'Un registro oficina invalido' do
    office = Office.new

    office.should_not be_valid
  end

  it 'Un registro oficina valido' do
    office = Office.new
    office.name = 'Modulo de computadoras'

    office.should be_valid
  end

  it 'Cuando un registro oficina ya existe' do
    create(:office)

    office = Office.new
    office.name = 'Laboratorio'

    office.should_not be_valid
  end
end
