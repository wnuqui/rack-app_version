require 'rake'

module Rack
  # :nodoc:
  class AppVersion
    class << self
      include ::Rake::DSL if defined?(::Rake::DSL)

      def load_tasks
        load_init_task
        load_generate_task
      end

      private

      def load_init_task
        namespace :app_version do
          desc 'generate .app_version file that will contain application version'
          task :init do
            puts 'Creating file that will contain application version ...'
            puts '      create .app_version'
            FileUtils.touch '.app_version'
          end
        end
      end

      def load_generate_task
        namespace :app_version do
          task :generate do
            puts 'Generating app version ...'
            puts '      generate version '
            IO.write APP_VERSION_PATH, Rack::AppVersion.generate_version
          end
        end
      end
    end
  end
end
