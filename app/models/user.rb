class User < ActiveRecord::Base

    has_secure_password

    validates :email, :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }
    validates :password, presence: true
    validates :password_confirmation, presence: true

    def authenticate_with_credentials(email, password)
        
        user = User.find_by_email(email).where(email = @user.email)
        if user.email && user.password
            @user = user
          else
            @user = nil
        end
        # find the user with that email from the database
        # if you have a user, and the password matches, return that user
    end

end
