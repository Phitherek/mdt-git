require 'mdt-core'

module MDT
  module Fetchers
    class Git < MDT::Fetchers::Base
      def self.key
        'git'
      end

      def self.subkeys
        ['repository']
      end

      def fetch(key, options = {})
        case key
        when 'repository'
          return 1 unless options['url']
          options['branch'] ||= 'master'
          if Dir.exist?('.git')
            puts "Pulling changes from Git remote: origin, branch: #{options['branch']}..."
            system("git pull origin #{options['branch']}")
          else
            puts "Cloning Git repository from #{options['url']}..."
            if system("git clone #{options['url']} .")
              puts "Checking out Git branch: #{options['branch']}..."
              system("git checkout #{options['branch']}")
            end
          end
          $?.exitstatus
        end
      end
    end
  end
end