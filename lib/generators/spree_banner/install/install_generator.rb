module SpreeBanner
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_javascripts
        append_file "vendor/assets/javascripts/spree/backend/all.js", "//= require admin/spree_banner\n"
      end

      def add_stylesheets
        inject_into_file "vendor/assets/stylesheets/spree/frontend/all.css", " *= require store/spree_banner\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_banner'
      end

      def run_migrations
         res = ask "Would you like to run the migrations now? [Y/n]"
         if res == "" || res.downcase == "y"
           run 'bundle exec rake db:migrate'
         else
           puts "Skiping rake db:migrate, don't forget to run it!"
         end
      end
    end
  end
end
