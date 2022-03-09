class  Public::SearchesController < ApplicationController
  def search
    #入力されたキーワード
    keyword = params[:keyword]
    #担当営業
    salesman = params[:salesman]
    #選択された地域
    @region = params[:region]
    # date_selectで選択された値をparamsからTimeオブジェクトにする。
    # year = params['date(1i)']
    # month = params['date(2i)']
    # day = params['date(3i)']
    # date = Time.gm(year, month, day)

    records = Project.search_for(keyword,salesman)
    if @region.present?
      @records = Project.where(region: @region)
    else
      @records = records
    end

    #日付で検索
    #Project.where(created_at: [date.beginning_of_month..date.end_of_month])


    #Project.where(region: @region,created_at: [@date..Time.now])


    # if @region.present?
    #   @records = Project.where(~~~~~~~)
    #   return @records
    # end

    # if @region == "" && @date == ""
    #   flash[:result] = "検索結果は以下のとおりです"
    #   @records
    # elsif @region == "" && @date.present?
    #   flash[:result] = "検索結果は以下のとおりです"
    #   @records = Project.where(created_at: @date.all_month)
    # elsif @region.present? && @date == ""
    #   flash[:result] = "検索結果は以下のとおりです"
    #   @records = Project.where(region: @region)
    # else
    #   flash[:result] = "検索結果は以下のとおりです"
    #   @records = Project.where(region: @region,created_at: @date.in_time_zone.all_month)
    # end
    #Project.where(create_at:選択した月 1..31)

    # where 範囲を指定する方法
    # 1つ点からその月の範囲に変換する方法

  end
end
