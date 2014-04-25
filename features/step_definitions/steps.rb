When /^Visit to "(.*?)"$/ do |_url|
  # noop
end

When /^Call `save_screenshot_and_post_to_idobata`$/ do
  stub_request(:post, 'idobata.io/hook/TOKEN').to_return(body: 'OK')

  save_screenshot_and_post_to_idobata
end

Then /^Post screenshot to Idobata$/ do
  expect(WebMock).to have_requested(:post, 'idobata.io/hook/TOKEN').with {|req|
    params = parse_multipart(req)

    expect(params['image'][:part].filename).to match(/^screenshot-\d+\.png$/)
    expect(params['source'][:data]).to match('Screenshot from: ')
    expect(params['format'][:data]).to eq('html')
  }
end
