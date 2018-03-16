require 'mdt-core'

module MDT
  # A module containing all fetchers
  module Fetchers
    # A class that implements Git fetchers
    class Git < MDT::Fetchers::Base
      # A method that defines a key for fetchers class.
      # Returns:
      # * "git"
      def self.key
        'git'
      end

      # A method that defines keys for available fetchers.
      # Returns:
      # * +["repository"]+
      def self.subkeys
        ['repository']
      end

      # A method that defines how to fetch project contents to a deploy directory with fetchers.
      # Arguments:
      # * +key+ - a key identifier of a particular fetcher
      # * +options+ - options for fetchers as a Hash
      # Returns:
      # * Exit code for fetcher +key+
      # More information:
      # * See README.md for detailed description of fetchers
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