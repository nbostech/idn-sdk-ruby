module IdnSdkRuby
	module Com
		module Nbos
			module Capi
				module Modules
					module Identity
						module V0
							class IdentityApi < IdnSdkRuby::Com::Nbos::Capi::Api::V0::NetworkApi
								attr_accessor :remoteApiObj
																	
								def initialize()
									super()
									setModuleName("identity")
									setRemoteApiClass(IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::IdentityRemoteApi)
									@remoteApiObj = getRemoteApiClass().new
								end

								def getClientToken()
									remoteApi = @remoteApiObj
									map = @apiContext.getClientCredentials()
									clientId = map["client_id"]
									secret = map["client_secret"]
									#Need to add exception handling
									#remoteApi.host_url = getHost()
									response = remoteApi.getToken(clientId, secret, "client_credentials")
									if response.code == 200
										tokenApiModel = IdnSdkRuby::Com::Nbos::Capi::Api::V0::TokenApiModel.new(response.parsed_response)
										@apiContext.setClientToken(tokenApiModel)
										puts "token:#{tokenApiModel.getAccess_token()}"
										return tokenApiModel
									end
								end

								def login(loginModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getClientToken.getAccess_token()
									response = remoteApi.login(authorization, loginModel)
									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response)
										@apiContext.setUserToken('identity', memberApiModel.token.getAccess_token)
										return memberApiModel
									end
								end

								def signup(memberSignupModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getClientToken.getAccess_token()
									response = remoteApi.signup(authorization, memberSignupModel)
									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response["member"])
										@apiContext.setUserToken('identity', memberApiModel.token.getAccess_token)
										return memberApiModel
									end
								end

								def connect(socialConnectApiModel, connectService, callback)
								end

								def authorize(authorizeService, code, state, callback)
								end

								def getMemberDetails(uuid)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.getMemberDetails(authorization, uuid)
									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response, false)
										return memberApiModel
									end
								end

								def updateMemberDetails(uuid, memberApiModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.updateMemberDetails(authorization, uuid, memberApiModel)
									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response, false)
										return memberApiModel
									end
								end

								def updateCredentials(updatePasswordApiModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.updateCredentials(authorization, updatePasswordApiModel)
									if response.code == 200
										return "Success"
									end
								end

								def resetCredentials(resetPasswordModel, callback)
									
								end

								def logout()
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.logout(authorization)
									if response.code == 200
										@apiContext.setUserToken('identity', nil)
										return "Success"
									end
								end

								def socialWebViewLogin(connectService, callback)
									
								end

							end
						end
					end
				end
			end
		end
	end
end							
