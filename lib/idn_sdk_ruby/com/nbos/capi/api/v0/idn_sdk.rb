
class IdnSdkRuby::Com::Nbos::Capi::Api::V0::IdnSDK

	def self.init(apiContext, scope = nil)
		IdnSdkRuby::Com::Nbos::Capi::Api::V0::AbstractApiContext.registerApiContext(apiContext)
		if apiContext != nil
			apiContext.init
			puts "From IDN SDK Init => #{apiContext}"
		end

		# Register Default modules identity & media
		begin
			IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::IdentityIdsRegistry.init
			IdnSdkRuby::Com::Nbos::Capi::Modules::Media::V0::MediaIdsRegistry.init
		rescue Exception => e
			puts "#{e.message}"
			puts "#{e.backtrace}"
		end
		#tokenApiModel = apiContext.getClientToken(scope)
		#if tokenApiModel == nil
			identityApi = IdnSdkRuby::Com::Nbos::Capi::Modules::Ids::V0::Ids.getModuleApi("identity", apiContext.name)
			tokenApiModel = identityApi.getClientToken(scope)
		#end
	end
		
end					
