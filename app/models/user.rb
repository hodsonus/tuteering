class User < ActiveRecord::Base
  has_many :reviews, foreign_key: :tutor_id

  include Authem::User

  def full_name
    "#{first_name} #{last_name}"
  end

  def children
    User.all.each_with_object([]) do |user, children|
      children << user if user.parent_id == id
    end
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
