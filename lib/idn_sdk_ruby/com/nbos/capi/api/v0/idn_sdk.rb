
class IdnSdkRuby::Com::Nbos::Capi::Api::V0::IdnSDK

	def self.init(apiContext)
		IdnSdkRuby::Com::Nbos::Capi::Api::V0::AbstractApiContext.registerApiContext(apiContext)
		if apiContext != nil
			apiContext.init
			puts "From IDN SDK Init => #{apiContext}"
		end

		begin
			IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::IdentityIdsRegistry.new
			IdnSdkRuby::Com::Nbos::Capi::Modules::Media::V0::MediaIdsRegistry.new
		rescue Exception => e
			puts "#{e.message}"
			puts "#{e.backtrace}"
		end

		tokenApiModel = apiContext.getClientToken
		if tokenApiModel == nil
			identityApi = IdnSdkRuby::Com::Nbos::Capi::Modules::Ids::V0::Ids.getModuleApi("identity", apiContext.name)
			identityApi.getClientToken
		end
	end
		
end					
