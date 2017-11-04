class User < ActiveRecord::Base
  has_many :reviews, foreign_key: :tutor_id

  include Authem::User

  def full_name
    "#{first_name} #{last_name}"
  end

  def average_rating
    n = 0
    sum = 0

    reviews.each do |review|
      sum += review.rating
      n += 1
    end

    return (sum/n)

  end
end
