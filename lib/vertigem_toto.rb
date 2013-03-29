class Toto::Article
  def archive_date()
    self[:date].strftime("%b %e")
  end


  module Template
    def markdown text
      _options = [:hard_wrap, :filter_html, :autolink,
        :no_intraemphasis, :fenced_code, :gh_blockcode]
      Redcarpet.new(text.to_s.strip, *options).to_html.html_safe
    end
  end
end
