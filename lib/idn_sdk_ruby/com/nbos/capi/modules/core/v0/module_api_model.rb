require "idn_sdk_ruby/com/nbos/capi/modules/identity/v0/basic_active_model"
module IdnSdkRuby
	module Com
		module Nbos
			module Capi
				module Modules
					module Core
						module V0
							class ModuleApiModel < IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::BasicActiveModel
									attr_accessor :uuid, :name, :message

									def initialize(uuid = nil, name = nil)
									  @uuid = uuid
										@name = name
									end

									def getUuid()
										return @uuid
									end

									def getName()
										return @name
									end

									def as_json(options={})
										{
												uuid: @uuid,
												name: @name
										}
									end

									def to_json(*options)
										as_json(*options).to_json(*options)
									end

									def to_s
										to_json
									end

									def add_errors(json_response)
										json_response["errors"].each do |e|
											property_name = e['propertyName']
											msg = e['message']
											self.errors[property_name] << msg
										end
									end

									def add_messages(json_response)
										if json_response["message"].present?
											@message = json_response["message"]
										elsif json_response["error"].present?
											@message = json_response["error"]
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