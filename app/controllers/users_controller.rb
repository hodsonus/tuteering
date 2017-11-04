class UsersController < ApplicationController
  authem_for :user
  expose :user
  expose :qualifications do
    [ "Highschool Diploma", "Pursuing Bachelors", "Pursuing Masters" ]
  end

  def create
    user = User.new( user_params )

    if user.save
      sign_in(user)
      redirect_to dashboard_path
    else
      redirect_to new_user_path( type: "tutor" )
    end
  end

  def destroy
    sign_out_user
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(
      :bio,
      :kind,
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_name,
      :qualifications,
      :bakckground_checked,
      :age,
      :grade,
      :parent_id,
      :zipcode,
      languages: []
    )
  end
end
