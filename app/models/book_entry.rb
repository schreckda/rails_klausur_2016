class BookEntry < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :account

  validates_presence_of :description, :amount
  validates_numericality_of :amount, greater_than: 0

  before_create :assign_to_categories
  before_update :assign_to_categories

  def euro
    ("%.2f EUR" % (amount / 100.0)).gsub '.', ','
  end

  def assign_to_categories
    self.categories += Category.all.select do |category|
      description =~ /#{category.expression}/
    end
  end
end