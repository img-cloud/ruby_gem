require 'spec_helper'

describe RubyImgCloud do
	subject { RubyImgCloud }

	# describe "#sign_up" do
	# 	#let(:request) { 'My grandmom gave me a sweater for Christmas.' }
 #    let(:response) { subject.sign_up('flytorahul00@gmail.com', 'Rahul', 'Singh', 'Liftoff', 'Password1') }

 #    it 'should be able to sign up' do
 #    	# puts "*"*100
 #    	# puts response
 #      #expect(output).to eq({})
 #      expect {
	# 	    JSON.parse(response.body)
	# 	  }.to_not raise_error

	# 	  response.should be_success
 #      body = JSON.parse(response.body)
 #      # body.should include('group')
 #      # groups = body['group']
 #      # groups.should have(2).items
 #      # groups.all? {|group| group.key?('customers_count')}.should be_true
 #      # groups.any? {|group| group.key?('customer_ids')}.should be_false
 #    end
 #  end
  
  describe "#upload" do
		#let(:request) { 'My grandmom gave me a sweater for Christmas.' }
    image_path = 'spec/fixtures/files/kodai.jpg'
    tags = 'kodai, trip'
    apiKey = '89ef57a0-44bd-11e5-914c-65cdfbe9254e'
    folder = 'rubyGemTest'
    let(:response) { subject.upload(image_path, tags, apiKey, folder) }

    it 'should be able to upload an image' do
      expect {
		    JSON.parse(response.body)
		  }.to_not raise_error
    end

    it 'should include image upload url, tags, folder' do
      body = JSON.parse(response.body)
      expect(body).to include('url')
      expect(body).to include('tags')
      expect(body).to include('folder')
    end  
  end

  describe "#transform" do
    img_url = "http://img-cloud.herokuapp.com/img-cloud-qa/1440154522499_1436524274_car1.jpg"
    height = 100
    width = 100 
    let(:response) { subject.transform(height, width, img_url) }

    it 'should be able to transform an image' do
      #expect(response).to have_http_status(:created)
      #expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  it 'has a version number' do
    expect(RubyImgCloud::VERSION).not_to be nil
  end

end
