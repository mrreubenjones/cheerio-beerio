class User < ApplicationRecord
  has_secure_password

  has_many :products, dependent: :nullify
  has_many :reviews, dependent: :nullify
  has_many :favorites, dependent: :nullify
  has_many :favorite_products, through: :favorites, source: :product

  before_validation :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX


  def self.search(query)
      where(['first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?', "%#{query}%", "%#{query}%", "%#{query}%"]).order("
      CASE
        WHEN first_name ILIKE \'%#{query}%\' THEN '1'
        WHEN last_name ILIKE \'%#{query}%\' THEN '2'
        WHEN email ILIKE \'%#{query}%\' THEN '3'
      END")
  end

  def full_name
    (first_name + ' ' + last_name).titleize
  end


  private

  def downcase_email
    self.email.downcase! if email.present?
  end


end
