class  Public::SearchesController < ApplicationController
  def search
    #入力されたキーワード
    @keyword = params[:keyword]
    #担当営業
    @salesman = params[:salesman]
    #選択された地域
    @region = params[:region]

    @year = params['date(1i)']
    @month = params['date(2i)']
    day = params['date(3i)']

    #ページ遷移時のアクション
    # if day == "1" && keyword == "" && salesman == "" && year == "" && month == "" && @region == ""
    #   flash[:alert] = "案件一覧"
    #   Project.all
    #   return
    # end

    #年、月どちらか一方では検索できないようにする。
    if @year.present? && @month == ""
      flash[:alert] = "月を入力してください"
      return
    end
    if @year == "" && @month .present?
      flash[:alert] = "年を入力してください"
      return
    end

    # tags = params[:tag_ids]
    # tags.each do |tag|
    # binding.pry


    if @year.present? && @month.present? && @region.present?
      # date_selectで選択された値をparamsからTimeオブジェクトにする
      date = Time.gm(@year, @month ,day)
      #日付,地域、キーワードでアンド検索
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.search_for(@keyword,@salesman).where(created_at: [date.at_beginning_of_month..date.end_of_month]).where(region: @region)
    elsif @year.present? && @month.present?
      date = Time.gm(@year, @month ,day)
      flash[:result] = "検索結果は以下のとおりです"
      @records = Project.search_for(@keyword,@salesman).where(created_at: [date.at_beginning_of_month..date.end_of_month])
    elsif @region.present?
      flash[:result] = "検索結果は以下のとおりです"
      @records =  Project.search_for(@keyword,@salesman).where(region: @region)
    else
      @records = Project.search_for(@keyword,@salesman)
    end
  end

    # if @region.present?
    #   @records = Project.where(~~~~~~~)
    #   return @records
    # end

  private

    def search_project_params
      params.require(:project).permit(:keyword,:salesman,:region,:tag_ids,:date)
    end
end

