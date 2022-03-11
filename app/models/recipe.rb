# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :public, presence: true
  validates :preparation_time, :cooking_time, presence: true
end
