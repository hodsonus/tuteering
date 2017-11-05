class TutorsController < ApplicationController
  expose :tutor_list do
    tutors = User.where(kind: "Tutor")

    if params[:zipcode].present?
      tutors = tutors.where( zipcode: params[:zipcode] )
    end

    if params[:subject].present?
      tutors = tutors.where( subject: params[:subject] )
    end

    if params[:rating].present?
      results = []
      tutors.each do |tutor|
        results << tutor if tutor.average_rating >= params[:rating].to_i
      end

    end
    if results.present?
      results
    else
      tutors
    end
  end

  expose :subjects do
    [ ["Select a subject", ""], "Math", "Science", "Reading", "Spelling"]
  end
end
