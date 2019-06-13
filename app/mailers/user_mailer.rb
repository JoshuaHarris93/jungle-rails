class UserMailer < ApplicationMailer


    def email_confirmation
        @user = params[:user]
        @url = '/login'
        
    end
end