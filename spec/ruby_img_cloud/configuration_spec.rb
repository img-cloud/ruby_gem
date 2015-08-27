require "spec_helper"

module RubyImgCloud
  describe Configuration do
    describe "#base_uri" do
      it "default value is " do
        Configuration.new.base_uri = 'http://img-cloud.herokuapp.com'
      end
    end

    describe "#base_uri=" do
      it "can set value" do
        config = Configuration.new
        config.base_uri = 'http://image-cloud.herokuapp.com'
        expect(config.base_uri).to eq('http://image-cloud.herokuapp.com')
      end
    end
  end
end