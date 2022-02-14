class Application < ApplicationRecord

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true

  # attribute :status, :string, deafult: "In Progress"
  has_many :application_pets
  has_many :pets, through: :application_pets

end
