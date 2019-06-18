class User < ActiveRecord::Base

    has_secure_password

    # before_validation :downcase_email

    validates :email, :name, presence: true
    validates :email, :case_sensitive => false, uniqueness: true
    validates :password, length: { minimum: 6 }
    validates :password, presence: true
    validates :password_confirmation, presence: true


    def self.authenticate_with_credentials(email, password)
        user = User.find_by_email(email)
        
        if user && user.authenticate(password)
            user
          else
            nil
        end
        # find the user with that email from the database
        # if you have a user, and the password matches, return that user    
    end

#     private

# def downcase_email
#   self.email = email.downcase if email.present?
# end

end
