require 'rails_helper'

RSpec.describe Logbook, type: :model do
  before do
    def image_credential
      File.new Rails.root.join('spec', 'tests_files', 'credencial.jpg')
    end

    def image_photo
      File.new Rails.root.join('spec', 'tests_files', 'foto.png')
    end
  end

  it 'llenar un registro invalido' do
    logbook = Logbook.new

    logbook.should_not be_valid
  end

  it 'llenar un registro valido' do
    logbook = Logbook.new

    logbook.first_name = 'Juan Carlos'
    logbook.second_name =  'Moreno Dolores'
    logbook.credential = image_credential
    logbook.photo = image_photo

    logbook.should be_valid
  end

  it 'llenar un registro con visita a una oficina' do
    visit = create(:visit, office: create(:office))

    logbook = Logbook.new
    logbook.first_name = 'Jose Guillermo'
    logbook.second_name = 'Moreno Dolores'
    logbook.credential = image_credential
    logbook.photo = image_photo
    logbook.save

    visit.logbook = logbook
    visit.save

    logbook.visits.size.should == 1
  end

  it 'llenar un registro con mas de dos visitas a una oficina' do
    office = create(:office)
    visit = create(:visit, office: office)
    visit_yesterday = create(:visit, register_at: 1.day.ago, office: office)

    logbook = Logbook.new
    logbook.first_name = 'Alberto'
    logbook.second_name = 'Moreno Dolores'
    logbook.credential = image_credential
    logbook.photo = image_photo
    logbook.save

    visit.logbook = logbook
    visit.save

    visit_yesterday.logbook = logbook
    visit_yesterday.save

    logbook.visits.size.should == 2
  end
end
