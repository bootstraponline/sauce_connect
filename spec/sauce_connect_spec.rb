require_relative 'spec_helper'

describe SauceConnect do
  it 'extracts SC binary from a zip file' do
    sc = sc_from_zip sc_zip_path

    expect(sc.length).to eq(3442556)
  end

  it 'extracts SC binary from a tar.gz file' do
    sc = sc_from_tar_gz sc_tar_gz_path

    expect(sc.length).to eq(8198841)
  end
end
