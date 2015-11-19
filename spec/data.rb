module SauceConnect
  module Data
    def data_path *paths
      File.expand_path(File.join(__dir__, 'data', *paths))
    end

    def sc_zip_path
      @sc_zip_path ||= data_path 'sc-4.3.12-osx.zip'
    end

    def sc_tar_gz_path
      @sc_tar_path ||= data_path 'sc-4.3.12-linux.tar.gz'
    end
  end
end
