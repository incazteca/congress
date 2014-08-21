require 'rails_helper'

describe CongressAPIReader do
  let (:api_key) { '300952facb214f5983867ed073e7e4ba' }
  let (:api_reader) { CongressAPIReader.new(api_key) }

  it "Is able to retrieve a response" do
    puts api_key
    api_reader.get("/")
    expect(api_reader.data[:message]).to eq('I live!')
  end

  it "Is able to retrieve a single bill" do
    api_reader.get("/bills")
  end

  it "Is able to retrieve many bills" do
    api_reader.get("/bills")
  end

  it "Is able to retrieve a single legislator" do
    api_reader.get("/legislators")
  end

  it "Is able to retrieve many legislators" do
    api_reader.get("/legislators")
  end

end
