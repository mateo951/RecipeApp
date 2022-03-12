# frozen_string_literal: true

class AddDefaultValueToPublicAttribute < ActiveRecord::Migration[7.0]
  def up
    change_column :recipes, :public, :boolean, default: true
  end
end
