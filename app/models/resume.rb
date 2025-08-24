class Resume < ApplicationRecord
  has_one_attached :pdf

  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :interests, dependent: :destroy
end
