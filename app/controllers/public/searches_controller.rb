class  Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @records = Project.search_for(@content)
    project_before = Project.where('created_at: <= ?', Time.now)
    #Project.where(created_at:選択した月.in_time_zone.all_month)

    # where 範囲を指定する方法
    # 1つ点からその月の範囲に変換する方法

  end
end
