require 'rails_helper'

describe CongressAPIReader do
  let (:api_key) { '300952facb214f5983867ed073e7e4ba' }
  let (:api_reader) { CongressAPIReader.new(api_key) }

  it "Is able to retrieve a response" do
    puts api_key
    api_reader.get("/")
    expect(api_reader.results[0][:message]).to eq('I live!')
    expect(api_reader.status).to eq(200)
  end

  it "Is able to retrieve a single bill based on bill id" do
    api_reader.get("/bills", { :bill_id => "hr3461-111" } )
    expect(api_reader.status).to eq(200)
  end

  it "Is able to retrieve many bills" do
    api_reader.get("/bills")
    expect(api_reader.status).to eq(200)
  end

  it "Is able to retrieve a single legislator based on bioguide_id" do
    api_reader.get("/legislators", {:bioguide_id => "D000563"})
    expect(api_reader.status).to eq(200)
  end

  it "Is able to retrieve many legislators" do
    api_reader.get("/legislators")
    expect(api_reader.status).to eq(200)
  end

  it "Is able to let us know resource doesn't exist" do
    api_reader.get("/dummy_path")

    expect(api_reader.data[:api_reader_success]).to eq(false)
    expect(api_reader.data[:api_reader_message]).to eq('Path not found')
    expect(api_reader.status).to eq(404)
  end

  it "Is able to know there are no results" do
    api_reader.get("/legislators", {:query => "Fitzgerald"})

    expect(api_reader.data[:api_reader_success]).to eq(true)
    expect(api_reader.data[:api_reader_message]).to eq('No results found')
    expect(api_reader.status).to eq(200)
  end

end
