class  Public::SearchesController < ApplicationController
  def search
    @keyword = params[:keyword] #入力されたキーワード
    @region = params[:region]
    @date = params[:date]
    @records = Project.search_for(@keyword)
    if @region.exist? && @date.exist?
      @records = Project.where(region: @region,created_at: @date.all_month)
    elsif @region.exist? && @date == ""
      @records = Project.where(region: @region)
    else
      @records
    end
    #Project.where(create_at:選択した月 1..31)

    # where 範囲を指定する方法
    # 1つ点からその月の範囲に変換する方法

  end
end
