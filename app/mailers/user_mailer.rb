class UserMailer < ApplicationMailer
   
   def user_status 
    @user = params[:user]
    mail(to: @user.email, subject: 'Status of your account')
   end
   
    def post_status
    @user = params[:user]
    mail(to: @user.email, subject: 'Status of your recent post')
    end  
end