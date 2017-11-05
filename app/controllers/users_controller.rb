class UsersController < ApplicationController
  authem_for :user
  expose :user

  expose :qualifications do
    [ ["Select level of education", ""], "Highschool Diploma", "Pursuing Bachelors", "Pursuing Masters" ]
  end

  expose :subjects do
    [ ["Select a subject", ""], "Math", "Science", "Reading", "Spelling"]
  end

  def create
    user = User.new( user_params )

    if user.save
      if current_user.present?
        redirect_to child_path(user.id)
      else
        sign_in(user)
        redirect_to dashboard_path
      end

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
      :filepicker_url,
      :comments,
      :learning_style,
      languages: []
    )
  end
end
