require 'rails_helper'

RSpec.describe User, type: :model do
  it 'debe ser invalido' do
    user = User.new
    user.should_not be_valid
  end

  it 'debe ser valido' do
    user = User.new

    user.email = 'test@servidor.com'
    user.password = '1PasteldeLimon2'

    user.should be_valid
  end

  it 'cuando un usuario es Administrador' do
    user = create(:user_admin)

    user.admin?.should == true
  end

  it 'cuando un usuario no es Administrador' do
    user = create(:user_not_admin)

    user.admin?.should == false
  end
end
