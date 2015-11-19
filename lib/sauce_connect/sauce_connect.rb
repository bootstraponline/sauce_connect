module SauceConnect
  MUTEX = Mutex.new

  def hurley_client
    MUTEX.synchronize do
      return @hurley_client if @hurley_client
      client                              = @hurley_client = Hurley::Client.new 'https://saucelabs.com/'
      client.header[:content_type]        = 'application/json'
      client.request_options.timeout      = 2 * 60
      client.request_options.open_timeout = 2 * 60

      # Ensure body JSON string is parsed into a hash
      # Detect errors and fail so wait_true will retry the request
      client.after_call do |response|
        client_server_error = %i(client_error server_error).include? response.status_type
        body_error          = response.body['error']

        if client_server_error || body_error
          response_error = body_error || ''
          fail(::Errno::ECONNREFUSED, response_error)
        end
      end

      @hurley_client
    end
  end

  # todo: download versions.json
  # todo: download binary file (downloads/sc-4.3.12-linux.tar.gz)

  def latest_version
    hurley_client.get 'versions.json'
  end

  def sc_from_zip zip_path
    zip_file = Zip::File.open(sc_zip_path)
    sc       = zip_file.glob('*/bin/sc').first.get_input_stream.read
    zip_file.close
    sc
  end

  def sc_from_tar_gz tar_gz_path
    gz  = Zlib::GzipReader.new StringIO.new File.read tar_gz_path
    tar = StringIO.new gz.read
    gz.close

    sc = nil

    Gem::Package::TarReader.new tar do |tar|
      sc = tar.find do |entry|
        entry.full_name.end_with? 'bin/sc'
      end.read
    end

    sc
  end

  def download_binary
    # todo: detect platform & 32 vs 64 bit
    # 'downloads/sc-4.3.12-linux.tar.gz'
    # 'downloads/sc-4.3.12-linux32.tar.gz'
    # 'downloads/sc-4.3.12-osx.zip'
    # 'downloads/sc-4.3.12-win32.zip'
  end
end
