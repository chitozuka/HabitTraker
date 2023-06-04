module ApplicationHelper
  def week_days
    %w[日 月 火 水 木 金 土]
  end

  def icon(icon, options = {})
    file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] += " " + options[:class]
    end
      doc.to_html.html_safe
  end

  def completed_icon(completed)
    if completed
      "<div class='completed-icon completed'></div>".html_safe
    else
      "<div class='completed-icon'></div>".html_safe
    end
  end
end
