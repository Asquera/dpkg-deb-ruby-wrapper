require "dpkg/deb/version"

module Dpkg
  module Deb
    # Your code goes here...
    class << self

      def fields(package_path, fieldnames = [])
        out = `dpkg-deb -f #{package_path} #{fieldnames.join(" ")}`

        # rules are:
        # fields are usually line-based and follow the general format of
        # <field name><colon><space><field value>, for example
        # Maintainer: Felix Gilcher <felix.gilcher@asquera.de>
        # The exception to the rule is the decription field that has the format
        # <field name><colon><space><short description><newline>
        # <description>
        # The description needs to be indented by a single space and empty lines
        # are replaced by a dot. 

        fields = {}
        description = []

        out.each_line do |line|

          if match = /^(?<fieldname>[^:]+): (?<fieldvalue>.+)$/.match(line)
            fields[match['fieldname']] = match['fieldvalue']
          elsif match = /^ .+$/.match(line)
            description.push line
          else
            raise "unparseable line '#{line}' found"
          end

        end

        fields['Description'] << description.join("") unless fields['Description'].nil?

        fields 
      end

    end
  end
end
