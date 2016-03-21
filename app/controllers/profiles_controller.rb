class ProfilesController < ApplicationController
    def new
        # form where a user can fill out their own profile.
        @user = User.find( params[:user_id] )   #find who is logged in
        @profile = Profile.new          #build profile for user that is logged in
    end
    
    def create 
        @user = User.find( params[:user_id] )
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Profile Updated!"
            redirect_to user_path( params[:user_id] )
        else
            flash[:danger] = "No Way! Please shck the form."
            render action: :new
        end
    end

    private
        def profile_params
            # param whitelist
            params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
        end
end