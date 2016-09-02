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

								def getClientToken(scope = nil)
									remoteApi = @remoteApiObj
									map = @apiContext.getClientCredentials()
									clientId = map["client_id"]
									secret = map["client_secret"]
									response = remoteApi.getToken(clientId, secret, "client_credentials", scope)
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
										{ status: 200, data: memberApiModel}
									elsif response.code == 400
										loginModel.add_errors(response.parsed_response)
										{ status: 400, data: loginModel}
									else
										loginModel.add_messages(response.parsed_response)
										{ status: response.code, data: loginModel}
									end
								end

								def signup(memberSignupModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getClientToken.getAccess_token()
									response = remoteApi.signup(authorization, memberSignupModel)

									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response)
										@apiContext.setUserToken('identity', memberApiModel.token.getAccess_token)
										{status: 200, data: memberApiModel}
									elsif response.code == 400
										memberSignupModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberSignupModel.new
										memberSignupModel.add_errors(response.parsed_response)
										{status: response.code, data: memberSignupModel}
									else
										memberSignupModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberSignupModel.new
										memberSignupModel.add_messages(response.parsed_response)
										{status: response.code, data: memberApiModel}
									end
								end

								def connect(oauth_details, connectService)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getClientToken.getAccess_token()
									map = @apiContext.getClientCredentials()
									clientId = map["client_id"]
									response = remoteApi.connect(authorization, oauth_details, connectService, clientId)

										if response.code == 200
											memberApiModel = IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response)
											@apiContext.setUserToken('identity', memberApiModel.token.getAccess_token)
											{ status: 200, data: memberApiModel}
										elsif response.code == 400
											memberApiModel = IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new
											memberApiModel.add_errors(response.parsed_response)
											{ status: 400, data: memberApiModel}
										else
											memberApiModel = IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new
											memberApiModel.add_messages(response.parsed_response)
											{ status: response.code, data: memberApiModel}
										end
								end

								def authorize(authorizeService, code, state, callback)
								end

								def getMemberDetails(uuid)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.getMemberDetails(authorization, uuid)

									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response, false)
										{status: 200, data: memberApiModel}
									else
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(nil, false)
										memberApiModel.add_messages(response.parsed_response)
										{ status: response.code, data: memberApiModel}
									end
								end

								def updateMemberDetails(uuid, memberApiModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.updateMemberDetails(authorization, uuid, memberApiModel)

									if response.code == 200
										memberApiModel =  IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::MemberApiModel.new(response.parsed_response, false)
										{status: 200, data: memberApiModel}
									elsif response.code == 400
										memberApiModel.add_errors(api_response.parsed_response)
										{status: 400, data: memberApiModel}
									end
								end

								def updateCredentials(updatePasswordApiModel)
									remoteApi = @remoteApiObj
									authorization = @apiContext.getUserToken('identity')
									response = remoteApi.updateCredentials(authorization, updatePasswordApiModel)

									if response.code == 400
										updatePasswordApiModel.add_errors(response.parsed_response)
										{ status: 400, data: updatePasswordApiModel}
									else
										updatePasswordApiModel.add_messages(response.parsed_response)
										{ status: response.code, data: updatePasswordApiModel}
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
										{status: 200, data: loginModel}
									else
										loginModel.add_messages(response.parsed_response)
										{status: response.code, data: loginModel}
									end
								end

								def socialWebViewLogin(connectService, callback)
									
								end

								def tokenVerify(authorization, tokenToVerify, module_key)
									remoteApi = @remoteApiObj
									response = remoteApi.tokenVerify(authorization, tokenToVerify, module_key)
									if response.code == 200
										moduleTokenApiModel = IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::ModuleTokenApiModel.new(response.parsed_response)
										{status: 200, data: moduleTokenApiModel}
									else
										moduleTokenApiModel = IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::ModuleTokenApiModel.new
										moduleTokenApiModel.add_messages(response.parsed_response)
										{status: response.code, data: moduleTokenApiModel}
									end
								end

							end
						end
					end
				end
			end
		end
	end
end							
