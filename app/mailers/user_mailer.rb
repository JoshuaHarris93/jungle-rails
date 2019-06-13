class UserMailer < ApplicationMailer

    def welcome_email
        @user = params[:user]
        @url = '/login'
        mail(to: @user.email, subject: 'Thank you for your order!')
    end
    
end