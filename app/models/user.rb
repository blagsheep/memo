class User < ApplicationRecord

  devise      :database_authenticatable,
              :confirmable,
              :lockable,
              :registerable,
              :recoverable,
              #:rememberable,
              :timeoutable,
              :trackable,
              :validatable
  before_save :downcase_email


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of   :name, :email, :terms
  validates_length_of     :name, maximum: 50
  validates_length_of     :email, maximum: 255
  validates :email,        format:        { :with => email_regex}

  private

    def downcase_email
      self.email = email.downcase
    end

end


