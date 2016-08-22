module IdnSdkRuby
	module Com
		module Nbos
			module Capi
				module Api
					module V0
						class ApiContext
								# context name, this should give the ability to have as many contexts as possible
								# 'app' context, 'api' context, etc..
								def getName
								end

								#
								#opportunity for the context to initialize itself, if it needs to read any properties from
								#config files etc..
								#
								def init
								end

								def setHost(moduleName, host)
								end

								def getHost(moduleName)
								end

								def setClientCredentials(map)
								end

								def setClientToken(tokenApiModel)
								end

								def getClientCredentials
								end

								def getClientToken
								end

								def setUserToken(moduleName, tokenApiModel)
								end

								def getUserToken(moduleName)
								end
								
						end
					end
				end
			end
		end
	end
end						
