module SpreeProductSort
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_javascripts
      end

      def add_stylesheets
        inject_into_file "vendor/assets/stylesheets/spree/backend/all.css", " *= require admin/spree_product_sort\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'rake railties:install:migrations FROM=spree_product_sort'
      end

      def run_migrations
         res = ask "Would you like to run the migrations now? [Y/n]"
         if res == "" || res.downcase == "y"
           run 'rake db:migrate'
         else
           puts "Skipping rake db:migrate, don't forget to run it!"
         end
      end
    end
  end
end
