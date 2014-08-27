require 'webmock/rspec'

# This file was generated by the `rails generate rspec:install` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# The generated `.rspec` file contains `--require spec_helper` which will cause this
# file to always be loaded, without a need to explicitly require it in any files.
#
# Given that it is always loaded, you are encouraged to keep this file as
# light-weight as possible. Requiring heavyweight dependencies from this file
# will add to the boot time of your test suite on EVERY test run, even for an
# individual file that may not need all of that loaded. Instead, make a
# separate helper file that requires this one and then use it only in the specs
# that actually need it.
#
# The `.rspec` file also contains a few flags that are not defaults but that
# users commonly want.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|

  basic_response = '{
    "thank_you": "for using https",
    "status": 200,
    "message": "I live!",
    "documentation": "https://sunlightlabs.github.io/congress/",
    "code": "https://github.com/sunlightlabs/congress",
    "report_bugs": "https://github.com/sunlightlabs/congress/issues",
    "more_apis": "http://sunlightfoundation.com/api/"
  }'

  bill_response = '{
    "results": [
        {
            "congress": 111,
            "last_version_on": "2009-07-31",
            "sponsor_id": "B000574",
            "urls": {
                "govtrack": "http://www.govtrack.us/congress/bills/111/hr3461",
                "opencongress": "http://www.opencongress.org/bill/111-h3461/show",
                "congress": "http://beta.congress.gov/bill/111th/house-bill/3461"
            },
            "committee_ids": [
                "HSPW",
                "HSPW12"
            ],
            "official_title": "To amend title 23, United States Code, to provide grants and technical assistance to restore orphan highways.",
            "number": 3461,
            "sponsor": {
                "name_suffix": null,
                "first_name": "Earl",
                "title": "Rep",
                "nickname": null,
                "middle_name": null,
                "last_name": "Blumenauer"
            },
            "bill_type": "hr",
            "last_vote_at": null,
            "history": {
                "vetoed": false,
                "active": false,
                "awaiting_signature": false,
                "enacted": false
            },
            "cosponsors_count": 3,
            "short_title": "Orphan Highway Restoration Act",
            "enacted_as": null,
            "popular_title": null,
            "related_bill_ids": [],
            "last_version": {
                "version_name": "Introduced in House",
                "bill_version_id": "hr3461-111-ih",
                "urls": {
                    "pdf": "http://www.gpo.gov/fdsys/pkg/BILLS-111hr3461ih/pdf/BILLS-111hr3461ih.pdf",
                    "xml": "http://www.gpo.gov/fdsys/pkg/BILLS-111hr3461ih/xml/BILLS-111hr3461ih.xml",
                    "html": "http://www.gpo.gov/fdsys/pkg/BILLS-111hr3461ih/html/BILLS-111hr3461ih.htm"
                },
                "pages": 6,
                "issued_on": "2009-07-31",
                "version_code": "ih"
            },
            "last_action_at": "2009-08-03",
            "withdrawn_cosponsors_count": 0,
            "bill_id": "hr3461-111",
            "introduced_on": "2009-07-31",
            "chamber": "house",
            "search": {
                "score": 1,
                "type": "bill"
            }
        }
    ],
    "count": 1,
    "page": {
        "count": 1,
        "per_page": 20,
        "page": 1
    }
  }'

  bill_response_page_2 = '{
    "results": [
        {
            "congress": 111,
            "last_version_on": "2009-07-31",
            "sponsor_id": "B000574",
            "urls": {
                "govtrack": "http://www.govtrack.us/congress/bills/111/hr3461",
                "opencongress": "http://www.opencongress.org/bill/111-h3461/show",
                "congress": "http://beta.congress.gov/bill/111th/house-bill/3461"
            },
            "committee_ids": [
                "HSPW",
                "HSPW12"
            ],
            "official_title": "To amend title 23, United States Code, to provide grants and technical assistance to restore orphan highways.",
            "number": 3461,
            "sponsor": {
                "name_suffix": null,
                "first_name": "Earl",
                "title": "Rep",
                "nickname": null,
                "middle_name": null,
                "last_name": "Blumenauer"
            },
            "bill_type": "hr",
            "last_vote_at": null,
            "history": {
                "vetoed": false,
                "active": false,
                "awaiting_signature": false,
                "enacted": false
            },
            "cosponsors_count": 3,
            "short_title": "Orphan Highway Restoration Act",
            "enacted_as": null,
            "popular_title": null,
            "related_bill_ids": [],
            "last_version": {
                "version_name": "Introduced in House",
                "bill_version_id": "hr3461-111-ih",
                "urls": {
                    "pdf": "http://www.gpo.gov/fdsys/pkg/BILLS-111hr3461ih/pdf/BILLS-111hr3461ih.pdf",
                    "xml": "http://www.gpo.gov/fdsys/pkg/BILLS-111hr3461ih/xml/BILLS-111hr3461ih.xml",
                    "html": "http://www.gpo.gov/fdsys/pkg/BILLS-111hr3461ih/html/BILLS-111hr3461ih.htm"
                },
                "pages": 6,
                "issued_on": "2009-07-31",
                "version_code": "ih"
            },
            "last_action_at": "2009-08-03",
            "withdrawn_cosponsors_count": 0,
            "bill_id": "hr3461-111",
            "introduced_on": "2009-07-31",
            "chamber": "house",
            "search": {
                "score": 1,
                "type": "bill"
            }
        }
    ],
    "count": 1,
    "page": {
        "count": 1,
        "per_page": 20,
        "page": 2
    }
  }'

  legislator_response = '{
    "results": [
        {
            "bioguide_id": "D000563",
            "birthday": "1944-11-21",
            "chamber": "senate",
            "contact_form": "http://www.durbin.senate.gov/public/index.cfm/contact",
            "crp_id": "N00004981",
            "district": null,
            "facebook_id": "180436795325335",
            "fax": "202-228-0400",
            "fec_ids": [
                "S6IL00151",
                "H2IL20026"
            ],
            "first_name": "Richard",
            "gender": "M",
            "govtrack_id": "300038",
            "icpsr_id": 15021,
            "in_office": true,
            "last_name": "Durbin",
            "leadership_role": "Majority Whip",
            "lis_id": "S253",
            "middle_name": "J.",
            "name_suffix": null,
            "nickname": null,
            "oc_email": "Sen.Durbin@opencongress.org",
            "ocd_id": "ocd-division/country:us/state:il",
            "office": "711 Hart Senate Office Building",
            "party": "D",
            "phone": "202-224-2152",
            "senate_class": 2,
            "state": "IL",
            "state_name": "Illinois",
            "state_rank": "senior",
            "term_end": "2015-01-03",
            "term_start": "2009-01-06",
            "thomas_id": "00326",
            "title": "Sen",
            "twitter_id": "SenatorDurbin",
            "votesmart_id": 26847,
            "website": "http://www.durbin.senate.gov",
            "youtube_id": "SenatorDurbin"
        }
    ],
    "count": 1,
    "page": {
        "count": 1,
        "per_page": 20,
        "page": 1
    }
  }'

  legislator_no_results = '{
    "results": [],
    "count": 0,
    "page": {
        "count": 0,
        "per_page": 20,
        "page": 1
    }
  }'

  config.before(:each) do

    stub_request(:get, "https://congress.api.sunlightfoundation.com/?apikey=300952facb214f5983867ed073e7e4ba&per_page=50").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => [200, 'OK'], :body => basic_response, :headers => {})

    stub_request(:get, "https://congress.api.sunlightfoundation.com/bills?apikey=300952facb214f5983867ed073e7e4ba&bill_id=hr3461-111&per_page=50").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => [200, 'OK'], :body => bill_response, :headers => {})

    stub_request(:get, "https://congress.api.sunlightfoundation.com/bills?apikey=300952facb214f5983867ed073e7e4ba&per_page=50").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => [200, 'OK'], :body => bill_response, :headers => {})

    stub_request(:get, "https://congress.api.sunlightfoundation.com/bills?apikey=300952facb214f5983867ed073e7e4ba&bill_id=hr3461-111&page=2&per_page=50").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => [200, 'OK'], :body => bill_response_page_2, :headers => {})

    stub_request(:get, "https://congress.api.sunlightfoundation.com/legislators?apikey=300952facb214f5983867ed073e7e4ba&per_page=50").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => [200, 'OK'], :body => legislator_response, :headers => {})

    stub_request(:get, "https://congress.api.sunlightfoundation.com/legislators?apikey=300952facb214f5983867ed073e7e4ba&bioguide_id=D000563&per_page=50").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => [200, 'OK'], :body => legislator_response, :headers => {})

    stub_request(:get, "https://congress.api.sunlightfoundation.com/legislators?apikey=300952facb214f5983867ed073e7e4ba&per_page=50&query=Fitzgerald").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => [200, 'OK'], :body => legislator_no_results, :headers => {})

    stub_request(:get, "https://congress.api.sunlightfoundation.com/dummy_path?apikey=300952facb214f5983867ed073e7e4ba&per_page=50").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(:status => [404, 'Not Found'], :body => '', :headers => {})

    stub_request(:get, "https://congress.api.dummyapihttp.com/?apikey=300952facb214f5983867ed073e7e4ba&per_page=50").
      to_raise(SocketError.new('getaddrinfo: nodename nor servname provided, or not known'))
  end
# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.
=begin
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed

  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # Enable only the newer, non-monkey-patching expect syntax.
    # For more details, see:
    #   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
    expectations.syntax = :expect
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Enable only the newer, non-monkey-patching expect syntax.
    # For more details, see:
    #   - http://teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
    mocks.syntax = :expect

    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended.
    mocks.verify_partial_doubles = true
  end
=end
end
