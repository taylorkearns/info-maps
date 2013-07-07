module ApplicationHelper
  def body_classes
    "#{params[:controller]} #{params[:action]}"
  end
end
