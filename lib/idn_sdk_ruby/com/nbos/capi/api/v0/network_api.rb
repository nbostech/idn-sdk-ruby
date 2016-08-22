class IdnSdkRuby::Com::Nbos::Capi::Api::V0::NetworkApi
	attr_accessor :moduleName, :host, :sw, :apiContext, :remoteApiClass, :remoteApi

		def initialize(host = nil, remoteApiClass = nil)
			@host = host
			@remoteApiClass = remoteApiClass
		end

		def getRemoteApi
		end

		def setApiContext(apiContext)
			@apiContext = apiContext
		end

		def setHost(host)
			@host = host
			if host.end_with?("/")
				@host = host.chomp("/")
			end
		end

		def getModuleName
			return @moduleName
		end

		def setModuleName(moduleName)
			@moduleName = moduleName
		end

		def getHost()
			return @host
		end

		def getSw()
			return @sw
		end

		def setSw(sw)
			 @sw = sw
		end

		def getRemoteApiClass()
			return @remoteApiClass
		end

		def setRemoteApiClass(remoteApiClass)
			@remoteApiClass = remoteApiClass
		end

		def newRequest(api)

		end

		def get(request, callback)
		end	

		def getRetrofitClient()
		end

		def getOkHttpClient()
		end	


		def post(request)
				return nil
		end

		def put(request)
				return nil
		end
end			
							