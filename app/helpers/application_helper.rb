module ApplicationHelper
  def br(text)
    return text if text.nil?
    text = h text
    text.gsub(/\r\n|\r|\n/, "").html_safe
  end
end
