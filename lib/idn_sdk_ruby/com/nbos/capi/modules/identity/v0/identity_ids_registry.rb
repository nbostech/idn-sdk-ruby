require "idn_sdk_ruby/com/nbos/capi/modules/identity/v0/identity_api"

module IdnSdkRuby
	module Com
		module Nbos
			module Capi
				module Modules
					module Identity
						module V0
							class IdentityIdsRegistry
								def self.init
									IdnSdkRuby::Com::Nbos::Capi::Modules::Ids::V0::Ids.register("identity", IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::IdentityApi)
								end
							end
						end
					end
				end
			end
		end
	end
end							
