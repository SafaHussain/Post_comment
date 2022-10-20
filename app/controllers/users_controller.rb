class UsersController < ApplicationController
    def show
    @user = User.find(params[:id])
   
    end

    def approve
        
        @user = User.find(params[:id])
        @user.update(status: "active")
        redirect_to 'http://localhost:3000/admin/user'
    end    
    
    def calculator
        respond_to do|format|
            format.js {render :layout => false }
        end
    end
end