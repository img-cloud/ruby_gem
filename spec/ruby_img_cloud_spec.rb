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
    let(:response) { subject.upload('/home/rahul/Work/ruby_img_cloud/spec/fixtures/files/kodai.jpg', ['kodai', 'trip'], 'b7c70db0-4564-11e5-a527-41742323d59e') }
    it 'should be able to upload an image' do
    	puts "*"*100
    	puts output
      expect {
		    JSON.parse(response.body)
		  }.to_not raise_error
    end
  end

  # describe "#transform" do
		# #let(:request) { 'My grandmom gave me a sweater for Christmas.' }
  #   let(:response) { subject.transform }

  #   it 'should be able to upload an image' do
  #   	puts "*"*100
  #   	puts output
  #     expect {
		#     JSON.parse(response.body)
		#   }.to_not raise_error
  #   end
  # end

  it 'has a version number' do
    expect(RubyImgCloud::VERSION).not_to be nil
  end

end
