require 'spec_helper'

describe 'The request to Idobata', type: :feature do
  before do
    allow(page.driver).to receive(:save_screenshot).and_return {|filepath|
      File.write(filepath, "\x89PNG")
    }
  end

  after do
    Dir['screenshot-*.png'].each do |path|
      File.unlink path
    end
  end

  before do
    stub_request(:post, 'idobata.io/hook/TOKEN').to_return(body: 'OK')

    save_screenshot_and_post_to_idobata
  end

  it 'should have "User-Agent" that including gem version' do
    expect(WebMock).to have_requested(:post, 'idobata.io/hook/TOKEN').with {|req|
      req.headers['User-Agent'] == "CapybaraScreenshotIdobata/v#{CapybaraScreenshotIdobata::VERSION}"
    }
  end

  it 'should have body contained screenshot file with message' do
    expect(WebMock).to have_requested(:post, 'idobata.io/hook/TOKEN').with {|req|
      params = parse_multipart(req)

      expect(params['image'][:part].filename).to match(/^screenshot-\d+\.png$/)
      expect(params['source'][:data]).to match('Screenshot from: ')
      expect(params['format'][:data]).to eq('html')
    }
  end
end
