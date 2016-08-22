require 'httmultiparty'

module IdnSdkRuby
	module Com
		module Nbos
			module Capi
				module Modules
					module Identity
						module V0
							class IdentityRemoteApi
								attr_accessor :baseIdentityUrl, :tokenUrl, :loginUrl, :logoutUrl, :signupUrl,
															:connectUrl, :authorizeUrl, :profileUrl, :forgotUrl, :changeUrl,
															:socialLoginUrl, :host_url
								include HTTMultiParty

								headers 'Accept' => 'application/json', 'Content-Type' => 'application/json'

								debug_output $stdout
								
								def initialize()
									@baseIdentityUrl = "/api/identity/v0"
									@tokenUrl = "/oauth/token"
									@loginUrl = @baseIdentityUrl + "/auth/login"
									@signupUrl = @baseIdentityUrl + "/users/signup"
									@connectUrl = @baseIdentityUrl + "/auth/social/{connectService}/connect"
									@authorizeUrl = @baseIdentityUrl + "/auth/social/{authorizeService}/authorize"
									@profileUrl = @baseIdentityUrl + "/users"
									@forgotUrl = @baseIdentityUrl + "/auth/forgotPassword"
									@changeUrl = @baseIdentityUrl + "/auth/changePassword"
									@logoutUrl = @baseIdentityUrl + "/auth/logout"
									@socialLoginUrl = @baseIdentityUrl + "/auth/social/{loginService}/login"
								end

								def getToken(clientId, clientSecret, grantType)
									query_params = {:client_id => clientId, :client_secret => clientSecret, :grant_type => grantType}
									@host_url = "http://localhost:8080" if @host_url.nil?
									response = self.class.send("get", @host_url+@tokenUrl, :query => query_params)
									return response
								end
								
								def refreshAccessToken
								end

								def login(authorization, loginModel)
									@host_url = "http://localhost:8080" if @host_url.nil?
									body = loginModel.to_s
									#response= HTTParty.post(@host_url+@loginUrl,{:body => body, :headers => { "Authorization" => "Bearer #{authorization}"}})
									response = self.class.send("post", @host_url+@loginUrl, :body => body, :headers => {"Authorization" => "Bearer " + authorization})
									return response
								end

								def signup(authorization, memberSignupModel)
									@host_url = "http://localhost:8080" if @host_url.nil?
									body = memberSignupModel.to_s
									#response= HTTParty.post(@host_url+@loginUrl,{:body => body, :headers => { "Authorization" => "Bearer #{authorization}"}})
									response = self.class.send("post", @host_url+@signupUrl, :body => body, :headers => {"Authorization" => "Bearer " + authorization})
									return response
								end
								
								def resetCredentials
								end

								def updateCredentials(authorization,updatePasswordApiModel)
									@host_url = "http://localhost:8080" if @host_url.nil?
									#response= HTTParty.post(@host_url+@loginUrl,{:body => body, :headers => { "Authorization" => "Bearer #{authorization}"}})
									body = updatePasswordApiModel.to_s
									binding.pry
									response = self.class.send("post", @host_url+@changeUrl, :body => body, :headers => {"Authorization" => "Bearer " + authorization})
									return response
								end

								def socialWebViewLogin
								end

								def authorize
								end

								def connect
								end

								def logout(authorization)
									@host_url = "http://localhost:8080" if @host_url.nil? #response= HTTParty.post(@host_url+@loginUrl,{:body => body, :headers => { "Authorization" => "Bearer #{authorization}"}})
									response = self.class.send("get", @host_url+@logoutUrl, :headers => {"Authorization" => "Bearer " + authorization})
									return response
								end

								def getMemberDetails(authorization, uuid)
									@host_url = "http://localhost:8080" if @host_url.nil?
									#response= HTTParty.post(@host_url+@loginUrl,{:body => body, :headers => { "Authorization" => "Bearer #{authorization}"}})
									response = self.class.send("get", @host_url+@profileUrl+"/#{uuid}", :headers => {"Authorization" => "Bearer " + authorization})
									return response
								end

								def updateMemberDetails(authorization, uuid, memberApiModel)
									@host_url = "http://localhost:8080" if @host_url.nil?
									#response= HTTParty.post(@host_url+@loginUrl,{:body => body, :headers => { "Authorization" => "Bearer #{authorization}"}})
									body = memberApiModel.to_s
									response = self.class.send("put", @host_url+@profileUrl+"/#{uuid}", :body => body, :headers => {"Authorization" => "Bearer " + authorization})
									return response
								end
									
							end
						end
					end
				end
			end
		end
	end
end							