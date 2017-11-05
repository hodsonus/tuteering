class User < ActiveRecord::Base
  has_many :reviews, foreign_key: :tutor_id

  include Authem::User

  def full_name
    "#{first_name} #{last_name}"
  end

  def all_messages(tutor_id)
    messages = Message.where(parent_id: id)
    results = []
    messages = messages.order("created_at ASC")

    messages.each do |message|
      results << message if message.tutor_id == tutor_id
    end

    results

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

  def tutor_messages
  end

  def parent_messages
    possible_messages = Message.where(parent_id: id)
    messages = []
    possible_messages.each do |message1|
      possible_messages.each do |message2|
        messages << message2 if message1.tutor_id == message2.tutor_id
      end
    end
  end
end
