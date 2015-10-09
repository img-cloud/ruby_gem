require 'spec_helper'

describe ImgCloud do
	subject { ImgCloud }
  
  describe "#upload" do
    before :each do
      subject.configure do |config|
        config.base_uri = 'http://imgcloud.liftoffllc.in'
        config.apiKey = '8d2ba590-51b0-11e5-9560-35ff41886c85'
      end
    end

    image_paths = ['spec/fixtures/files/kodai.jpg']
    tags = 'kodai, trip'
    folder = 'rubyGemTest'
    let(:response) { subject.upload(image_paths, tags, folder) }

    it 'should be able to upload images' do
      expect {
        JSON.parse(response.body)
      }.to_not raise_error
    end

    it 'should include image upload urls, tags, folder' do
      body = JSON.parse(response.body)
      expect(body).to include('urls')
      expect(body).to include('tags')
      expect(body).to include('folder')
    end  
  end
  
  describe "#delete" do
    before :each do
      subject.configure do |config|
        config.base_uri = 'http://imgcloud.liftoffllc.in'
        config.apiKey = '8d2ba590-51b0-11e5-9560-35ff41886c85'
      end
    end
    image_paths = ['spec/fixtures/files/kodai.jpg']
    folder = 'rubyGemTest'
    let(:response) { subject.upload(image_paths, "", folder) }
    
    let(:del_response) { subject.delete(JSON.parse(response.body)['urls'][0]) }

    let(:del_body) { del_response.body}

    it 'should be able to delete the uploaded image' do
      expect {
        JSON.parse(del_body)
      }.to_not raise_error
    end

    it 'should include deleted message' do
      body = JSON.parse(del_body)
      expect(body).to include('message')
      expect(body['message']).to eq("deleted")
    end
  end
    
  describe "#transform" do
    before :each do
      subject.configure do |config|
        config.base_uri = 'http://imgcloud.liftoffllc.in'
      end
    end
    img_path = "/spectestdata/kodai.jpg"
    options = {:width => 100, :height => 100, :crop => true, :scale => true, :borderWidth => 5, :borderColor => 'red', :grayscale => true, :sepia => true, :blur => 10}

    let(:response) { subject.transform(img_path, options) }

    it 'should be able to transform an image' do
      expect(response.code).to eq("200")
    end
  end
  
  describe "#configure" do
    before :each do
      subject.configure do |config|
        config.base_uri = 'http://imgcloud.liftoffllc.in'
        config.apiKey = 'f8341be0-4c99-11e5-a2ca-27be34e17568'
      end
    end

    it "returns the base_uri and apiKey as configured" do
      config = subject.configuration

      expect(config.base_uri).to be_a(String)
      expect(config.base_uri).to eq('http://imgcloud.liftoffllc.in')

      expect(config.apiKey).to be_a(String)
      expect(config.apiKey).to eq('f8341be0-4c99-11e5-a2ca-27be34e17568')
    end

    after :each do
      subject.reset
    end
  end 
  
  describe "#reset" do
    before :each do
      subject.configure do |config|
        config.base_uri = 'http://imgcloud.liftoffllc.in'
        config.apiKey = 'f8341be0-4c99-11e5-a2ca-27be34e17568'
      end
    end

    it "resets the configuration" do
      subject.reset

      config = subject.configuration

      expect(config.base_uri).to eq('http://www.imgcloud.io')
      expect(config.apiKey).to eq(nil)
    end
  end

  it 'has a version number' do
    expect(ImgCloud::VERSION).not_to be nil
  end

end
