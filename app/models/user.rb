# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :foods, foreign_key: :user_id
  has_many :recipes, foreign_key: :user_id

  def recent_foods
    foods.order(created_at: :desc).limit(5)
  end
end
