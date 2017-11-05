class User < ActiveRecord::Base
  has_many :reviews, foreign_key: :tutor_id
  has_many :users, foreign_key: :parent_id

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

    if n != 0
      return (sum/n)
    else
      return 0
    end

  end
end
