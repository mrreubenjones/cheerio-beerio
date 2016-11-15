class Product < ApplicationRecord

  # RELATIONSHIPS
  belongs_to :category
  belongs_to :user

  has_many :reviews, lambda { order(created_at: :DESC) }, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likers, through: :favorites, source: :user




  # CALLBACKS
  before_validation :set_defaults
  before_validation :titleize_title

  # VALIDATIONS
  validates :title, presence: true,
                    uniqueness: { case_sensitive: false },
                    exclusion: { in: ['Sony'] }

  validates :price, presence: true,
                    numericality: { greater_than: 0 }

  validates :sale_price, numericality: { less_than_or_equal_to: :price }

  validates :description, presence: true,
                        length: { minimum: 5 }

  # METHODS
  def self.search(query)
      #This first line will search BOTH columns, as it's a chain
      #Product.where(['title ILIKE ?', "%#{query}%"]).where(['description ILIKE ?', "%#{query}%"])
      #The following searches for EITHER or
      where(['title ILIKE ? OR description ILIKE ?', "%#{query}%", "%#{query}%"]).order("
      CASE
        WHEN title ILIKE \'%#{query}%\' THEN '2'
        WHEN description ILIKE \'%#{query}%\' THEN '1'
      END")
  end

  # Getting in some practice with one liner scopes
  # scope :updated_after, ->(time) { where("updated_at > ?", time) }
  def self.updated_after(time)
    where("updated_at > ?", time)
  end

  def self.recent_sale_products(n)
    where("sale_price < ?", price).order(sale_price: :desc).limit(n)
  end

  def on_sale?
    self.sale_price < self.price ? true : false
  end

  def favorite_for(user)
    favorites.find_by(user: user)
  end

  def reviews_for_user(user_id)
     reviews.for_user(user_id)
  end

  private

  def set_defaults
    # self.price ||= 1
    self.sale_price ||= self.price
  end

  def titleize_title
    self.title = title.titleize
  end


end

