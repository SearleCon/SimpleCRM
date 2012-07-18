class CustomLinkRenderer < WillPaginate::ActionView::LinkRenderer
  def prepare(collection, options, template)
    @base_link_url = options.delete :base_link_url
    @base_link_url_has_qs = @base_link_url.index('?') != nil if @base_link_url
    super
  end

  protected
  def url(page)
    if @base_link_url.blank?
      super
    else
      @base_url_params ||= begin
        merge_optional_params(default_url_params)
      end

      url_params = @base_url_params.dup
      add_current_page_param(url_params, page)

      query_s = []
      url_params.each_pair {|key,val| query_s.push("#{key}=#{val}")}

      if query_s.size > 0
        @base_link_url+(@base_link_url_has_qs ? '&' : '?')+query_s.join('&')
      else
        @base_link_url
      end
    end
  end
end



