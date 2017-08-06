module SetPageDefaultsConcern
 extend ActiveSupport::Concern
  included do
    before_action :set_page_defaults
  end
  
  def set_page_defaults
    @page_title = "LAschool | The best school ever"
    @seo_keywords = "Language Alliance school"
  end
  
end