require 'rails_helper'


describe OrkutClient do

	let(:sign_in_response) { 
		sign_in_response = double()
		allow(sign_in_response).to receive(:body).and_return("my token")
		sign_in_response
	} 

	it "should sign in to Orkut Server" do
		#setup
		orkut_client = OrkutClient.new
		#verify
		expect(RestClient).to receive(:post)
			.with(/login/,
				hash_including(
					username: "pedrohrs08@gmail.com",
					password: "081289"
					)
				).and_return(sign_in_response)
		#exercise
		response = orkut_client.sign_in("pedrohrs08@gmail.com", "081289")
		
		# expect(response.code).to eq 200
		# expect(response.body).to_not be_nil
	end

	it "should sign_out from Orkut Server" do
		
		#setup
		orkut_client = OrkutClient.new
		allow(RestClient).to receive(:post).and_return(sign_in_response)
		orkut_client.sign_in("my_user", "my_password")

		#exercise
		orkut_client.sign_out
		
		#verify
		expect(Authorizable).to_not be_signed_in
	end

end