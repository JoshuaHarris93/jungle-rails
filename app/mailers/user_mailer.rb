class UserMailer < ApplicationMailer

    def email_confirmation
        @user = params[:user]
        @url = '/login'
        mail(to: @user.email, subject: 'Thank you for your order!')
    end

end