class Product < ApplicationRecord
  has_many :line_items

  def average_time
    Rails.cache.fetch("#{cache_key_with_version}/average_time", expires_in: 30.minutes) do
      line_items.average(:time_to_prepare)&.to_i || 0
    end
  end
end
