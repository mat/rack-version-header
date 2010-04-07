module Rack

  # Rack Version Header
  # A Rack middleware for adding a version response header
  # git show-ref --verify refs/heads/master --hash=8
  class VersionHeader
    F = ::File

    def initialize(app, options={})
     options[:header_name]  ||= 'X-Version'
     options[:version_file] ||= '.version'

      @app = app
      f = options[:version_file]
      if F.exist?(f.to_s)
        @rev = F.read(f.to_s)
      else
        @rev = 'unknown'
	$stderr.puts("#{F.expand_path(f.to_s)} not found")
      end
      @header_name = options[:header_name]
    end

    def call(env)
      status, headers, response = @app.call(env)
      headers[@header_name] = @rev
      [status, headers, response]
    end
  end
end

