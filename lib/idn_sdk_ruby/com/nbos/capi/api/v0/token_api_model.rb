require 'json'

class IdnSdkRuby::Com::Nbos::Capi::Api::V0::TokenApiModel
	attr_accessor :scope, :expires_in, :token_type, :refresh_token, :access_token

	def initialize(parsed_response = nil)
		if !parsed_response.nil?
			@access_token = parsed_response["access_token"]
			@token_type = parsed_response["token_type"]
			@expires_in = parsed_response["expires_in"]
			@scope = parsed_response["scope"]
			@refresh_token = parsed_response["refresh_token"]
		end
	end
		
	def getExpires_in()
			return @expires_in
	end

	def getScope()
			return @scope;
	end

	def getToken_type()
			return @token_type
	end

	def getRefresh_token()
			return @refresh_token
	end

	def getAccess_token()
			return @access_token
	end

	def as_json(options={})
		{
				scope: @scope,
				expires_in: @expires_in,
				token_type: @token_type,
				refresh_token: @refresh_token,
				access_token: @access_token,
		}
	end

	def to_json(*options)
		as_json(*options).to_json(*options)
	end

	def to_s
		to_json
	end

end #end of class			