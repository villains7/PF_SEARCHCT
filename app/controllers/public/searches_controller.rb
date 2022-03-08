class  Public::SearchesController < ApplicationController
  def search
    @keyword = params[:keyword] #入力されたキーワード
    @region = params[:region] #選択された地域
    @date = params[:date] #選択された年月
    @records = Project.search_for(@keyword)
    if @region == "" && @date == ""
      flash[:result] = "検索結果は以下のとおりです"
      @records
    elsif @region == "" && @date.present?
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.where(created_at: @date.all_month)
    elsif @region.present? && @date == ""
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.where(region: @region)
    else
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.where(region: @region,created_at: @date.all_month)
    end
    #Project.where(create_at:選択した月 1..31)

    # where 範囲を指定する方法
    # 1つ点からその月の範囲に変換する方法

  end
end
