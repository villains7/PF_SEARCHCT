class Public::SearchesController < ApplicationController
  def index
    @projects = Project.all
  end

  def search
    @result = Project.includes(:tag_maps)

    # 入力されたキーワードで検索
    @keyword = params[:keyword]
    if @keyword.present?
      @result = @result.where("title like ? OR caption like ?", "%#{@keyword}%", "%#{@keyword}%")
    end

    # 担当営業
    @salesman = params[:salesman]
    if @salesman.present?
      @result = @result.where("salesman like ? ", "%#{@salesman}%")
    end

    # 選択された地域
    @region = params[:region]
    if @region.present?
      @result = @result.where(region: @region)
    end

    # date_selectで選択された日付
    year = params['date(1i)']
    month = params['date(2i)']
    day = params['date(3i)']

    # 年、月どちらか一方では検索できないようにする。
    if year.present? && month == ""
      flash[:alert] = "月を入力してください"
      return
    end
    if year == "" && month .present?
      flash[:alert] = "年を入力してください"
      return
    end

    if year.present? && month.present?
      # date_selectで選択された値をparamsからTimeオブジェクトにする
      @date = Time.gm(year, month, day)
      @result = @result.where(created_at: [@date.at_beginning_of_month..@date.end_of_month])
    end

    # チェックされたタグで検索
    @tag_ids = params[:tag_ids]
    if @tag_ids.count > 1
      @result = @result.where(tag_maps: { tag_id: @tag_ids })
    end
  end
end
