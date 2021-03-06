require 'rspec'
require 'spec_helper'
require 'img_cloud'
require 'action_view'
require 'img_cloud/helper'

helper_class = Class.new do
  include ImgCloudHelper
end

RSpec.describe ImgCloudHelper do
  let(:helper) { helper_class.new }
  let(:image_path) { '/spectestdata/kodai.jpg' }
  
  let(:test_tag) { TestTag.new( helper.img_cloud_tag(image_path, options)) }

  context "#img_cloud_tag" do

    context "img_cloud_tag with correct options" do
      let(:options) { {:width => '100', :height => '100', :crop => true, :scale => true, :borderWidth => 5, :borderColor => 'red', :grayscale => true, :sepia => true, :blur => 10} }
      let(:transform_params) { "h_#{options[:height]},w_#{options[:width]},blur_10,sepia,crop,scale,grayscale,bdr_#{options[:borderWidth]}-#{options[:borderColor]}"}

      it "should return image tag" do
        image_arr = image_path.split('/').reject!(&:empty?)
        expect(test_tag.name).to match( 'img')
        expect(test_tag['src']).to eq( "#{ImgCloud.configuration.base_uri}/#{image_arr[0]}/#{transform_params}/#{image_arr[1]}")
        expect(test_tag['height']).to eq(options[:height])
        expect(test_tag['width']).to eq(options[:width])
      end
    end

    context "img_cloud_tag with incorrect options" do
      let(:options) { {:width => 'width', :height => 'height'} }

      it "should return image tag with default image url when options are invalid" do
        expect(test_tag.name).to match( 'img')
        expect(test_tag['src']).to eq( "#{ImgCloud.configuration.base_uri}#{image_path}")
        expect(test_tag['height']).to eq(nil)
        expect(test_tag['width']).to eq(nil)
      end
    end  
    
    context "img_cloud_tag with no options" do
      let(:options) { {} }

      it "should return image tag with default image url when options are not provided" do
        expect(test_tag.name).to match( 'img')
        expect(test_tag['src']).to eq( "#{ImgCloud.configuration.base_uri}#{image_path}")
        expect(test_tag['height']).to eq(nil)
        expect(test_tag['width']).to eq(nil)
      end
    end

  end
end
