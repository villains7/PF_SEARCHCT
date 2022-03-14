class  Public::SearchesController < ApplicationController

  def index
    @projects = Project.all
  end


  def search
    #入力されたキーワード
    @keyword = params[:keyword]
    #担当営業
    @salesman = params[:salesman]
    #選択された地域
    @region = params[:region]
　　#date_selectで選択された日付
    year = params['date(1i)']
    month = params['date(2i)']
    day = params['date(3i)']

    #年、月どちらか一方では検索できないようにする。
    if year.present? && month == ""
      flash[:alert] = "月を入力してください"
      return
    end
    if year == "" && month .present?
      flash[:alert] = "年を入力してください"
      return
    end
　
    #チェックされたタグ
    tag_ids = params[:tag_ids]
    tags = Tag.where(id: tag_ids)

    if year.present? && month.present? && @region.present? && !tag_ids == ""
      # date_selectで選択された値をparamsからTimeオブジェクトにする
      @date = Time.gm(year, month ,day)
      #日付,地域、キーワード、営業名、タグでアンド検索
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.search_for(@keyword,@salesman).where(created_at: [@date.at_beginning_of_month..@date.end_of_month]).where(region: @region).joins(:tag_maps).where(tag_maps:{tag_id: tags})
    elsif year.present? && month.present? && @region.present?
      @date = Time.gm(year, month ,day)
      #日付、地域、キーワード、営業名でアンド検索
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.search_for(@keyword,@salesman).where(created_at: [@date.at_beginning_of_month..@date.end_of_month]).where(region: @region)
    elsif  year.present? && month.present? && !tag_ids == ""
       @date = Time.gm(year, month ,day)
      #日付、タグ、キーワード、営業名でアンド検索
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.search_for(@keyword,@salesman).where(created_at: [@date.at_beginning_of_month..@date.end_of_month]).joins(:tag_maps).where(tag_maps:{tag_id: tags})
    elsif @region.present?
      #地域、キーワード、営業名でアンド検索
      flash[:result] = "検索結果は以下のとおりです"
      @records =  Project.search_for(@keyword,@salesman).where(region: @region)
    elsif tag_ids.present?
      #タグ、キーワードで検索
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.joins(:tag_maps).where(tag_maps:{tag_id: tags}).search_for(@keyword,@salesman)
    else
      #キーワード、営業名でアンド検索。分岐はモデルに記載あり。
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.search_for(@keyword,@salesman)
    end
  end
end

