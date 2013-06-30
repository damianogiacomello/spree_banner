module Spree
  module Admin
    class BannerBoxSettingsController < Spree::Admin::BaseController
      
      def show
        redirect_to( :action => :edit )
      end

      def create
        update_paperclip_settings
        @styles = ActiveSupport::JSON.decode(Spree::Config[:banner_styles])
        super
      end

      def edit
        @styles = ActiveSupport::JSON.decode(Spree::Config[:banner_styles])
      end

      def update
        update_styles(params)

        Spree::Config.set(params[:preferences])
        update_paperclip_settings

        respond_to do |format|
          format.html {
            flash[:notice] = t(:banner_settings_updated)
            redirect_to edit_admin_banner_box_settings_path
          }
        end
      end


      private

      def update_styles(params)
        params[:new_banner_styles].each do |index, style|
          params[:banner_styles][style[:name]] = style[:value] unless style[:value].empty?
        end if params[:new_banner_styles].present?

        styles = params[:banner_styles]

        Spree::Config[:banner_styles] = ActiveSupport::JSON.encode(styles) unless styles.nil?
      end

      def update_paperclip_settings
        extended_hash = {}
        ActiveSupport::JSON.decode(Spree::Config[:banner_styles]).each do |key,value|
          extended_hash[:"#{key}"] = value
        end
        Spree::BannerBox.attachment_definitions[:attachment][:styles] = extended_hash
        Spree::BannerBox.attachment_definitions[:attachment][:path] = Spree::Config[:banner_path]
        Spree::BannerBox.attachment_definitions[:attachment][:default_url] = Spree::Config[:banner_default_url]
        Spree::BannerBox.attachment_definitions[:attachment][:default_style] = Spree::Config[:banner_default_style]
      end
    end
  end
end

