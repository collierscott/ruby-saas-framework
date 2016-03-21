class ProfilesController < ApplicationController
    def new
        # form where a user can fill out their own profile.
        @user = User.find( params[:user_id] )   #find who is logged in
        @profile = @user.build_profile          #build profile for user that is logged in
    end
end