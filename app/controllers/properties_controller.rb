class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end
  def new
    @property = Property.new
    #buildメソッドを使用し、propertyモデルに属するstationモデルのインスタンスを新たに生成する。
    #新規登録の時点で２駅保存できる
    2.times { @property.stations.build }
  end
  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to @property, notice: '物件情報を登録しました！！'
    else
      render :new
    end
  end
  def show
    # @property = Property.find(params[:id])
    # 駅情報を反映
    #物件情報に駅情報を反映させる
    @stations = @property.stations

  end
  def edit

    # @property = Property.find(params[:id])
  end
  def update
    # @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to @property, notice: '物件情報を更新しました！！'
    else
      render :edit
    end
  end
  def destroy
    # @property = Property.find(params[:id])
    @property.destroy
    redirect_to @property, notice: '物件情報を削除しました！！'
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end
    def property_params
     #attributesメソッドを使用し、インスタンスの属性（オブジェクトが持っている値）一覧を取得
     params.require(:property).permit(:property, :rent, :adress, :building_age, :remarks, stations_attributes: [:id, :name_of_railway_line, :station_name, :how_many_minutes_walks, :_destroy])
      # params.require(:property).permit(:property, :rent, :adress, :building_age, :remarks, stations_attributes:  Station.attributes_names.map(&:to_sym).push(:_destroy))
    end
end
