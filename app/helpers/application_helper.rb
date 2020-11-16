module ApplicationHelper
  def show_svg(path)
    File.open("app/views/images/#{path}", "rb") do |file|
      raw file.read
    end
  end

  def icon_for(record)
    if record.language == :ruby
      show_svg("ruby_icon.svg")
    elsif record.language == :js
      show_svg("js_icon.svg")
    end
  end
end
