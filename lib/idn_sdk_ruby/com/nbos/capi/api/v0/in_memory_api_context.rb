
class IdnSdkRuby::Com::Nbos::Capi::Api::V0::InMemoryApiContext < IdnSdkRuby::Com::Nbos::Capi::Api::V0::AbstractApiContext
		@@store = Hash.new
		@@hosts = Hash.new
		@@tokens = Hash.new

		def initialize(name)
			super(name)
		end

		def getName
			return name
		end


		def getClientCredentials
			return @@store["client.credentials"]
		end

		def setClientCredentials(map)
			@@store["client.credentials"] = map
		end

		def setClientToken(tokenApiModel)
			@@store["token.client"]=tokenApiModel
		end

		def getClientToken(scope = nil)
				return @@store["token.client"]
		end

		def setUserToken(moduleName, tokenApiModel)
				@@tokens[moduleName] = tokenApiModel
				if (@@tokens.size == 0) 
						@@tokens["."]=tokenApiModel
				end
		end

		def getUserToken(moduleName)
				 tokenApiModel = @@tokens[moduleName]
				if (tokenApiModel == nil)
						tokenApiModel = @@tokens["."]
				end
				return tokenApiModel
		end

		
		def setHost(moduleName, host)
				@@hosts[moduleName] = host
		end

		
		def getHost(moduleName)
				return @@hosts[moduleName]
		end

end #end of class