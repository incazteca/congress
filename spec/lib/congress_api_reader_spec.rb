require 'rails_helper'

describe CongressAPIReader do
  let (:api_key) { '300952facb214f5983867ed073e7e4ba' }

  let (:base_url) { 'https://congress.api.sunlightfoundation.com' }
  let (:api_reader) { CongressAPIReader.new(base_url, api_key) }

  let (:bad_base_url) { 'https://congress.api.dummyapihttp.com' }
  let (:bad_api_reader) { CongressAPIReader.new(bad_base_url, api_key) }

  it "defaults to / when no argument given to get" do
    api_reader.get

    expect(api_reader.results[0][:message]).to eq('I live!')
    expect(api_reader.status).to eq(200)
  end

  it "Is able to retrieve a response" do
    api_reader.get("/")

    expect(api_reader.results[0][:message]).to eq('I live!')
    expect(api_reader.status).to eq(200)
  end

  it "Is able to retrieve a single bill based on bill id" do
    api_reader.get("/bills", { :bill_id => "hr3461-111" } )

    expect(api_reader.results[0][:bill_id]).to eq('hr3461-111')
    expect(api_reader.status).to eq(200)
  end

  it "Is able to retrieve many bills" do
    api_reader.get("/bills")

    expect(api_reader.results[0][:bill_id]).not_to be_nil
    expect(api_reader.results.size).to be > 0
    expect(api_reader.status).to eq(200)
  end

  it "Is able to retrieve a single legislator based on bioguide_id" do
    api_reader.get("/legislators", {:bioguide_id => "D000563"})

    expect(api_reader.results[0][:bioguide_id]).to eq('D000563')
    expect(api_reader.status).to eq(200)
  end

  it "Is able to retrieve many legislators" do
    api_reader.get("/legislators")

    expect(api_reader.results[0][:bioguide_id]).not_to be_nil
    expect(api_reader.results.size).to be > 0
    expect(api_reader.status).to eq(200)
  end

  it "Is able to handle being given a bad base url" do
    bad_api_reader.get("/")

    expect(bad_api_reader.data[:api_reader_success]).to eq(false)
    expect(bad_api_reader.data[:api_reader_message]).to eq('getaddrinfo: nodename nor servname provided, or not known')
    expect(bad_api_reader.status).to be_nil
  end

  it "Is able to let us know resource doesn't exist" do
    api_reader.get("/dummy_path")

    expect(api_reader.data[:api_reader_success]).to eq(false)
    expect(api_reader.data[:api_reader_message]).to eq('404 Not Found')
    expect(api_reader.status).to eq(404)
  end

  it "Is able to know there are no results" do
    api_reader.get("/legislators", {:query => "Fitzgerald"})

    expect(api_reader.data[:api_reader_success]).to eq(true)
    expect(api_reader.data[:api_reader_message]).to eq('No results found')
    expect(api_reader.status).to eq(200)
  end

end
