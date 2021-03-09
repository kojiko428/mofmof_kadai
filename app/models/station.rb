class Station < ApplicationRecord
  belongs_to :property , inverse_of: :stations, optional: true

# 空白×バリデーション 解除
  # validates :name_of_railway_line, :statation_name, presence: true
  # validates :how_many_minutes_walks, numericality: true
end
