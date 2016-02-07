module ApplicationHelper
  def cp(path)
    "current-link" if current_page?(path)
  end

  def btn_path(path)
    "current-btn" if current_page?(path)
  end
end
