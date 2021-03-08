class Property < ApplicationRecord
  #アソシエーション設定,親モデルのデータを削除した時に子モデルも一緒に削除される。
  has_many :stations, dependent: :destroy, inverse_of: :property
  #reject_all_blank関数でtrueが出たパラメータは、送信データから除外させていく。
  #空の時にレコードが作成されません
  accepts_nested_attributes_for :stations, allow_destroy: true , reject_if: :all_blank

# 空白×バリデーション
  validates :property, :rent, :adress,
      :building_age, presence: true
  validates :rent, numericality: true
end
