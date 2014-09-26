require 'rails_helper'
require 'pry'

describe CongressAPIReader do
  let (:api_key) { '300952facb214f5983867ed073e7e4ba' }

  let (:base_url) { 'https://congress.api.sunlightfoundation.com' }
  let (:api_reader) { CongressAPIReader.new(base_url, api_key) }

  let (:bad_base_url) { 'https://congress.api.dummyapihttp.com' }
  let (:bad_api_reader) { CongressAPIReader.new(bad_base_url, api_key) }

  let (:http_success)  { 200 }
  let (:http_missing)  { 404 }

  # TODO Look into web mock

  it 'defaults to / when no argument given to get' do
    response = api_reader.get

    expect(response.results[0][:message]).to eq('I live!')
    expect(response.status).to eq(http_success)
  end

  it 'Is able to retrieve a response' do
    response = api_reader.get('/')

    expect(response.results[0][:message]).to eq('I live!')
    expect(response.status).to eq(http_success)
  end

  it 'Is able to retrieve a single bill based on bill id' do
    response = api_reader.get('/bills', bill_id: 'hr3461-111')

    expect(response.results[0][:bill_id]).to eq('hr3461-111')
    expect(response.status).to eq(http_success)
  end

  it 'Is able to retrieve many bills' do
    response = api_reader.get('/bills')

    expect(response.results[0][:bill_id]).not_to be_nil
    expect(response.results).not_to be_empty
    expect(response.status).to eq(http_success)
  end

  it 'Is able to get the result without need of counting the results' do
    response = api_reader.get('/bills', bill_id: 'hr3461-111')

    expect(response.count).to eq(1)
    expect(response.status).to eq(http_success)
  end

  it 'Is able to go to other page numbers' do
    pagenum = 2
    response = api_reader.get('/bills', bill_id: 'hr3461-111', page: pagenum)

    expect(response.page).to eq(pagenum)
    expect(response.status).to eq(http_success)
  end

  it 'Is able to retrieve a single legislator based on bioguide_id' do
    response = api_reader.get('/legislators', bioguide_id: 'D000563')

    expect(response.results[0][:bioguide_id]).to eq('D000563')
    expect(response.status).to eq(http_success)
  end

  it 'Is able to retrieve many legislators' do
    response = api_reader.get('/legislators')

    expect(response.results[0][:bioguide_id]).not_to be_nil
    expect(response.results.size).to be > 0
    expect(response.status).to eq(http_success)
  end

  it 'Is able to handle being given a bad base url' do
    bad_response = bad_api_reader.get('/')

    expect(bad_response.message).to eq('getaddrinfo: nodename nor servname provided, or not known')
    expect(bad_response.status).to be_nil
  end

  it "Is able to let us know resource doesn't exist" do
    response = api_reader.get('/dummy_path')

    expect(response.message).to eq('404 Not Found')
    expect(response.status).to eq(http_missing)
  end

  it 'Is able to know there are no results' do
    response = api_reader.get('/legislators', query: 'Fitzgerald')

    expect(response.message).to eq('No results found')
    expect(response.status).to eq(http_success)
  end
end
