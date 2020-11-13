class TimeTravelsController < ApplicationController

  def create
    tc_action = params[:tc_action]
    setting_time = Time.zone.parse(params[:tc_date]) if params[:tc_date].present?
    operation_name = ""
    result = case tc_action
             when "freeze"
               operation_name = "固定"
               Timecop.freeze(setting_time)
             when "travel"
               operation_name = "移動"
               Timecop.travel(setting_time)
             end
    if result
      flash[:notice] = "時刻を#{result}に#{operation_name}しました"
    else
      Timecop.return
      flash[:notice] = "時間を元に戻しました"
    end
    redirect_back(fallback_location: root_path)
  end

end
