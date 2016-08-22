module IdnSdkRuby
	module Com
		module Nbos
			module Capi
				module Modules
					module Ids
						module V0
							class Ids
								#registry of module classes
								@@registry = Hash.new()

								#registr of moduleApi Instance Objects
								@@apiInstanceRegistry = Hash.new()
								
								def initialize
								end

								def self.getModuleApi(moduleName, contextName = nil)
									contextName = "app" if contextName.nil?
									puts "Registered Modules With IDS => #{@@registry}"
									apiClass = @@registry[moduleName]
									apiContext = IdnSdkRuby::Com::Nbos::Capi::Api::V0::AbstractApiContext.get(contextName)

									if apiClass == nil
											
										api = IdnSdkRuby::Com::Nbos::Capi::Api::V0::NetworkApi.new
										if (api != nil)
											api.setApiContext(apiContext)
											api.setHost("http://localhost:8080")
											return api
										end
									else
										api = apiClass.new
										if (api != nil)
											api.setApiContext(apiContext)
											host = "http://localhost:8080" if apiContext.getHost(moduleName).nil?
											api.setHost(apiContext.getHost(moduleName))
											return api
										end 
										 
									end
									return nil
								end

								def self.register(moduleName, clazz)
									@@registry[moduleName] = clazz
								end

							end
						end
					end
				end
			end
		end
	end
end							