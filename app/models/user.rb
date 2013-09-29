class User < ActiveRecord::Base
  has_secure_password
  has_many :entries
  accepts_nested_attributes_for :entries

  validates :email, uniqueness: true, presence: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create }


  def email=(value)
    value = value.strip.downcase
    write_attribute :email, value
  end

  def form_validation
    errors.add(:email, "Invalid email.")
    errors.add(:password_confirmation, "Passwords do not match.")
  end

end
