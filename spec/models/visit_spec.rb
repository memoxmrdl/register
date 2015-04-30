require 'rails_helper'

RSpec.describe Visit, type: :model do
  it 'un registro invalido' do
    visit = Visit.new

    visit.should_not be_valid
  end

  it 'un registro valido' do
    visit = Visit.new
    visit.register_at = DateTime.now

    visit.should be_valid
  end
end
