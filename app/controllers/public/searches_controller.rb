class Public::SearchesController < ApplicationController
  before_action :authenticate_member!
  def index
    # 詳細検索をクリックした時は案件一覧が表示される。
    @projects = Project.all
    # 案件詳細ページからタグをクリックした時の処理
    if (params[:tag_id]).present?
      @projects = Project.includes(:tag_maps)
      tag = Tag.find(params[:tag_id])
      @projects = @projects.where(tag_maps: { tag_id: tag })
    end
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
      flash[:alert] = "投稿月を入力してください"
      return
    end

    if year == "" && month .present?
      flash[:alert] = "投稿年を入力してください"
      return
    end

    if year.present? && month.present?
      # date_selectで選択された値をparamsからTimeオブジェクトにする
      @date = Time.gm(year, month, day)
      @result = @result.where(created_at: [@date.at_beginning_of_month..@date.end_of_month])
    end

    # 登録番号検索
    @registration_number = params[:registration_number]
    if @registration_number.present?
      @result = @result.where("registration_number like ? ", "%#{@registration_number}%")
    end

    # 車体番号検索
    @registration_number = params[:body_number]
    if @body_number.present?
      @result = @result.where("body_number like ? ", "%#{@body_number}%")
    end

    # 車種で検索
    @vehicle_type = params[:vehicle_type]
    if @vehicle_type.present?
      @result = @result.where(vehicle_type: @vehicle_type)
    end

    # リース種別で検索
    @lease_type = params[:lease_type]
    if @lease_type.present?
      @result = @result.where(lease_type: @lease_type)
    end

    # 整備工場で検索
    @body_shop = params[:body_shop]
    if @body_shop.present?
      @result = @result.where("body_shop like ? ", "%#{@body_shop}%")
    end

    # 保険有無
    @insurance = params[:insurance]
    if @insurance.present?
      @result = @result.where(insurance: @insurance)
    end

    # リース終了日で検索
    @end_year = params[:end_year]
    @end_month = params[:end_month]
    @end_day = params[:end_day]
    if @end_year.present?
      @result = @result.where(end_year: @end_year)
    end

    if @end_month.present?
      @result = @result.where(end_month: @end_month)
    end

    if @end_day.present?
      @result = @result.where(end_day: @end_day)
    end
    # どれか一つのフォーム入力だけでは検索できないようにする。
    if @end_year.present? && @end_month == "" && @end_day == ""
      flash[:alert] = "月日を入力してください"
      return
    end

    if @end_year.present? && @end_month.present? && @end_day == ""
      flash[:alert] = "日を入力してください"
      return
    end

    if @end_year.present? && @end_month == "" && @end_day.present?
      flash[:alert] = "月を入力してください"
      return
    end

    if @end_year == "" && @end_month.present? && @end_day.present?
      flash[:alert] = "年を入力してください"
      return
    end

    if @end_year == "" && @end_month == "" && @end_day.present?
      flash[:alert] = "年月を入力してください"
      return
    end

    if @end_year == "" && @end_month.present? && @end_day == ""
      flash[:alert] = "年日を入力してください"
      return
    end

    # チェックされたタグで検索
    @tag_ids = params[:tag_ids]
    if @tag_ids.count > 1
      @result = @result.where(tag_maps: { tag_id: @tag_ids })
    end
  end
end
