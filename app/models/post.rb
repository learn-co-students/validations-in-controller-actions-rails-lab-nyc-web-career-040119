require 'byebug'
class Post < ActiveRecord::Base
  validate :must_have_title,:category_must_be_fiction_or_nonfiction, :content_must_be_at_least_100_characters_long


  #validations
  def must_have_title
    if title.present? == false
      errors.add(:title, "Post must have a title, bro")
    end
  end

  def category_must_be_fiction_or_nonfiction

    if category == "Fiction"
    elsif category == "Non-Fiction"
    else
      errors.add(:category, "Not a valid category, bro")
    end
  end

  def content_must_be_at_least_100_characters_long
    if content.length < 100
      errors.add(:content,"Content must be at least 100 characters long, bro")
    end
  end

end
