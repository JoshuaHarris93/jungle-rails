require 'rails_helper'

RSpec.describe User, type: :model do
  
  before :each do
  @user = User.new
  @user.name = "Josh"
  @user.email = " Test@test.com "
  @user.password = "HelloBob"
  @user.password_confirmation = "HelloBob"
  end

  context "when checking user fields" do
    
    it 'email is not valid' do
      
      @user.email = nil
      @user.valid?

      expect(@user).to_not be_valid

    end

    it 'password is not valid' do
      
      @user.password = nil
      @user.valid?

      expect(@user).to_not be_valid
    end
    
    it 'case insensitive' do
      user = User.new
      User.new(email: "Bob@gmail.com")
      
      user.valid?

      expect(user).to_not be_valid
    end

    it 'ignores whitespace' do
      user = User.new
      User.new(email: "   bob@gmail.com    ")
    user.valid?

    expect(user).to_not be_valid
  end

  end  

  context '.authenticate_with_credentials' do
    
    it 'is authenticating' do
      
      @user.save
      user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to_not be_nil
    
    end
  end

end
