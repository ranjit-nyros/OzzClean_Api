# PDFKit.configure do |config|
#    config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
# end
  ActionController::Base.asset_host = Proc.new { |source, request|
  if request.format.pdf?
    "#{request.protocol}#{request.host_with_port}"
  else
    nil
  end
}
PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Legal',
    :print_media_type => true
  }
  # # Use only if your external hostname is unavailable on the server.
  # config.root_url = "http://localhost"
  # config.verbose = false

end