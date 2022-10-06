class UserMailer < ApplicationMailer
   
   def post_status
    @user = params[:user]
    mail(to: @user.email, subject: 'Status of your recent post')
    end  
end