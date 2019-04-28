class Author < ActiveRecord::Base
  validate :must_have_a_name, :email_must_be_unique

#validations
  def must_have_a_name
    if name.present? == false
      errors.add(:name, "Author must have a name, bro")
    end
  end

  def email_must_be_unique
    author_emails = Author.all.map do |author|
      author.email
    end

    if author_emails.include?(email) == true
      errors.add(:email, "Email already in use, bro")
    end

  end



end
