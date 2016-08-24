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
									response = remoteApi.getToken(clientId, secret, "client_credentials")
									if response.code == 200
										tokenApiModel = IdnSdkRuby::Com::Nbos::Capi::Api::V0::TokenApiModel.new(response.parsed_response)
										@apiContext.setClientToken(tokenApiModel)
										return tokenApiModel
									else
										return response.parsed_response
									end
								end

								def login(loginModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getClientToken.getAccess_token()
									response = remoteApi.login(authorization, loginModel)
									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response)
										@apiContext.setUserToken('identity', memberApiModel.token.getAccess_token)
										{ status: 200, member: memberApiModel}
									elsif response.code == 400
										loginModel.add_errors(response.parsed_response)
										{ status: 400, member: nil, login: loginModel}
									else
										loginModel.add_messages(response.parsed_response)
										{ status: response.code, login: loginModel}
									end
								end

								def signup(memberSignupModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getClientToken.getAccess_token()
									response = remoteApi.signup(authorization, memberSignupModel)

									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response)
										@apiContext.setUserToken('identity', memberApiModel.token.getAccess_token)
										{status: 200, member: memberApiModel}
									elsif response.code == 400
										memberSignupModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberSignupModel.new
										memberSignupModel.add_errors(response.parsed_response)
										{status: response.code, member: memberSignupModel}
									else
										memberSignupModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberSignupModel.new
										memberSignupModel.add_messages(response.parsed_response)
										{status: response.code, member: memberApiModel}
									end
								end

								def connect(socialConnectApiModel, connectService)
								end

								def authorize(authorizeService, code, state, callback)
								end

								def getMemberDetails(uuid)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.getMemberDetails(authorization, uuid)

									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response, false)
										{status: 200, member: memberApiModel}
									else
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(nil, false)
										memberApiModel.add_messages(response.parsed_response)
										{ status: response.code, member: memberApiModel}
									end
								end

								def updateMemberDetails(uuid, memberApiModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.updateMemberDetails(authorization, uuid, memberApiModel)

									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response, false)
										{status: 200, member: memberApiModel}
									elsif response.code == 400
										memberApiModel.add_errors(api_response.parsed_response)
										{status: 400, member: memberApiModel}
									end
								end

								def updateCredentials(updatePasswordApiModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.updateCredentials(authorization, updatePasswordApiModel)

									if response.code == 400
										updatePasswordApiModel.add_errors(response.parsed_response)
										{ status: 400, login: updatePasswordApiModel}
									else
										updatePasswordApiModel.add_messages(response.parsed_response)
										{ status: response.code, login: updatePasswordApiModel}
									end
								end

								def resetCredentials(resetPasswordModel, callback)
									
								end

								def logout
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.logout(authorization)
									loginModel = IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::LoginModel.new
									if response.code == 200
										@apiContext.setUserToken('identity', nil)
										loginModel.add_messages(response.parsed_response)
										{status: 200, login: loginModel}
									else
										loginModel.add_messages(response.parsed_response)
										{status: response.code, login: loginModel}
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
