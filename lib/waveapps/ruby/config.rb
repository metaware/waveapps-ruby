require 'dry-configurable'

module WaveApps
  module Ruby
    module Config
      def self.included(base)
        base.extend Dry::Configurable
        base.setting :client_id
        base.setting :client_secret
        # defaults to what WaveApps App has
        base.setting :redirect_uri
        base.setting :scope, 'basic user.read invoice.read invoice.write business.read'
        # just in case WaveApps comes up with a test environment later on
        base.setting :base_url, 'api.waveapps.com' 
        base.setting :secure, true
      end

      def config
        WaveApps::Ruby.config
      end
    end
  end
end
