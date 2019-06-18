class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :product
  has_many :address
end
