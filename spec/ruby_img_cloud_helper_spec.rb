require 'rspec'
require 'spec_helper'
require 'ruby_img_cloud'
require 'action_view'
require 'ruby_img_cloud/helper'

helper_class = Class.new do
  include RubyImgCloudHelper
end

RSpec.describe RubyImgCloudHelper do
  let(:helper) { helper_class.new }
  let(:options) { {} }

  context "#img_cloud_tag" do
    let(:test_tag) { TestTag.new( helper.img_cloud_tag('http://img-cloud.herokuapp.com/img-cloud-qa/1440154522499_1436524274_car1.jpg', 100, 100)) }

    context ":image_tag" do
      let(:options) { }
      it "should return image tag" do
        expect(test_tag.name).to match( 'img')
        # expect(test_tag['class']).to eq("cld-responsive")
        # expect(test_tag['data-src']).to eq( "http://res.cloudinary.com/test/image/upload/c_limit,w_auto/sample.jpg")
      end
    end
    
  end
end
