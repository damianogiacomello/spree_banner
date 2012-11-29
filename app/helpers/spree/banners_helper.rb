module Spree
  module BannersHelper

    def insert_banner(params={})
      # max items show for list
      max = params[:max] || 1
      # category items show
      category = params[:category] || ""
      # class items show
      cl = params[:class] || "banner"
      # style items show
      style = params[:style] || "list"
      banner = Banner.enable(category).limit(max)
      if !banner.blank?
        banner = banner.sort_by { |ban| ban.position }

        outer_tag = (style == 'list') ? :li : style.to_sym
        banners = raw(banner.map do |ban|
          banner_image = image_tag(ban.attachment.url(:custom))
          banner_outer = ban.url.present? ? link_to(banner_image, ban.url) : banner_image
          content_tag(outer_tag, banner_outer, :class => cl)
        end.join)
        
        (style == "list") ? content_tag(:ul,  banners) : banners
      end
    end

  end
end
