module RailsVersion
  class Pinger
    attr_accessor :body, :version, :host, :app_name

    def initialize(request, response)
      @modified_body = false
      @body = response.body.to_s
      @host = request.host.to_s
      @app_name = RailsVersion::Config.app_name.to_s
      @version = "Non-Rails"
      @version = Rails.version.to_s if Object.const_defined?('Rails')
    end

    def ping!
      case RailsVersion::Config.ping_type.to_sym
      when :server
        require 'open-uri'
        open(ping_url) # Ping the server.
      when :script
        inject_script_before_end_body_tag(ping_script)
      else
        inject_script_before_end_body_tag(ping_image)
      end
    rescue # Blind rescue...no exceptions shown.
      false
    end

    def modified_body?
      @modified_body
    end

    def inject_script_before_end_body_tag(ping_html)
      @modified_body = true
      @body.sub! /<\/[bB][oO][dD][yY]>/, "#{ping_html}</body>" if @body && @body.respond_to?(:sub!)
    end

    def ping_script
      "<script language='text/javascript' src='#{ping_url}'></script>"
    end

    def ping_image
      "<img src='#{ping_url}' style='display:none;visibility:hidden' width='0' height='0' />"
    end

    def ping_url
      "#{RailsVersion::Config.server_url}/#{RailsVersion::Config.api_key}/?site=#{@host}&rails_version=#{@version}&app_name=#{@app_name}"
    end
  end
end
