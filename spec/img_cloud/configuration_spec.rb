require "spec_helper"

module ImgCloud
  describe Configuration do
    describe "#base_uri" do
      it "default value is " do
        Configuration.new.base_uri = 'http://www.imgcloud.io'
      end
    end

    describe "#base_uri=" do
      it "can set value" do
        config = Configuration.new
        config.base_uri = 'http://imgcloud.liftoffllc.in'
        expect(config.base_uri).to eq('http://imgcloud.liftoffllc.in')
      end
    end
  end
end