require 'spec_helper'

describe ImgCloud do
	subject { ImgCloud }

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
    image_path = 'spec/fixtures/files/kodai.jpg'
    tags = 'kodai, trip'
    folder = 'rubyGemTest'
    let(:response) { subject.upload(image_path, tags, folder) }

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
    img_path = "/ic_4e1756/1440667545769_1436524274_car1.jpg"
    height = 100
    width = 100 
    let(:response) { subject.transform(img_path, :height => height, :width => width) }

    it 'should be able to transform an image' do
      #expect(response).to have_http_status(:created)
      #expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end
  
  describe "#configure" do
    before :each do
      subject.configure do |config|
        config.base_uri = 'http://image-cloud.herokuapp.com'
        config.apiKey = 'fake-f8341be0-4c99-11e5-a2ca-27be34e17568'
      end
    end

    it "returns the base_uri and apiKey as configured" do
      config = subject.configuration

      expect(config.base_uri).to be_a(String)
      expect(config.base_uri).to eq('http://image-cloud.herokuapp.com')

      expect(config.apiKey).to be_a(String)
      expect(config.apiKey).to eq('fake-f8341be0-4c99-11e5-a2ca-27be34e17568')
    end

    after :each do
      subject.reset
    end
  end
  
  describe ".reset" do
    before :each do
      subject.configure do |config|
        config.base_uri = 'http://image-cloud.herokuapp.com'
        config.apiKey = 'fake-f8341be0-4c99-11e5-a2ca-27be34e17568'
      end
    end

    it "resets the configuration" do
      subject.reset

      config = subject.configuration

      expect(config.base_uri).to eq('http://img-cloud.herokuapp.com')
      expect(config.apiKey).to eq('f8341be0-4c99-11e5-a2ca-27be34e17568')
    end
  end

  it 'has a version number' do
    expect(ImgCloud::VERSION).not_to be nil
  end

end
