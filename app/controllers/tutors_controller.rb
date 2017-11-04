class TutorsController < ApplicationController
  expose :tutor_list do
    tutors = User.where(kind: "Tutor")
    if params[:same_code] && params[:subject].present?
      tutors = tutors.where( zipcode: current_user.zipcode )
      tutors = tutors.where( subject: params[:subject] )
    elsif params[:same_code]
      tutors = tutors.where( zipcode: current_user.zipcode )
    elsif params[:subject].present?
      tutors = tutors.where( subject: params[:subject] )
    end

     tutors
  end

  expose :subjects do
    [ "Math", "Science", "Reading", "Spelling"]
  end
end
