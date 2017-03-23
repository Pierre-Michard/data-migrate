require 'generators/data_migrate'
require 'rails/generators'
require 'rails/generators/active_record/migration'

module DataMigrate
  module Generators
    class DataMigrationGenerator < Rails::Generators::NamedBase
      namespace "data_migration"
      include ActiveRecord::Generators::Migration


      argument :attributes, type: :array, default: [], banner: 'field:type field:type'

      def create_data_migration
        set_local_assigns!
        migration_template 'data_migration.rb', "db/data/#{file_name}.rb"
      end

      protected

      def set_local_assigns!
        if file_name =~ /^(add|remove)_.*_(?:to|from)_(.*)/
          @migration_action = $1
          @table_name       = $2.pluralize
        end
      end
    end
  end
end
