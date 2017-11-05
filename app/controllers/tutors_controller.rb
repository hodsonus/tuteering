class TutorsController < ApplicationController
  expose :days_of_week do
    { "Select availibility"=> "", Monday: "M", Teusday: "T", Wednesday: "W", Thursday: "R", Friday: "F", Saturday: "S", Sunday: "Sn"}
  end

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

    if params[:availibility].present?
      final = []

      if results.present?
        results.each do |tutor|
          tutor.availibility.each do |day|
            final << tutor if final.include?(day)
            break
          end
        end
      else
        tutors.each do |tutor|
          tutor.availibility.each do |day|
            if params[:availibility].include?(day)
              final << tutor
              break
            end
          end
        end
      end

    end

    if final.present? && results.present?
      final
    elsif final.present?
      final
    elsif results.present?
      results
    else
      tutors
    end
  end

  expose :subjects do
    [ ["Select a subject", ""], "Math", "Science", "Reading", "Spelling"]
  end
end
