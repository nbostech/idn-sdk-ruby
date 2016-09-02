module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class ModuleTokenApiModel < IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::BasicActiveModel
                attr_accessor :username, :clientId, :tokenType, :token, :expiration, :expired, :tenantId, :modules, :message

                def initialize(parsed_response = nil)
                  if !parsed_response.nil?
                    @username = parsed_response['username']
                    @clientId = parsed_response['clientId']
                    @tokenType = parsed_response['tokenType']
                    @token = parsed_response['token']
                    @expiration = parsed_response['expiration']
                    @expired = parsed_response['expired']
                    @tenantId = parsed_response['tenantId']
                    @modules = add_modules(parsed_response['modules']) if parsed_response['modules'].present?
                  end
                end

                def add_modules(modules)
                  @modules = []
                  if modules.size > 0
                    modules.each do |m|
                      @modules << IdnSdkRuby::Com::Nbos::Capi::Modules::Core::V0::ModuleTokenApiModel.new(m)
                    end
                  end
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

                def as_json(options={})
                  {
                      username: @username,
                      clientId: @clientId,
                      tokenType: @tokenType,
                      token: @token,
                      expiration: @expiration,
                      expired: @expired,
                      tenantId: @tenantId,
                      modules: @modules
                  }
                end

                def to_json(*options)
                  as_json(*options).to_json(*options)
                end

                def to_s
                  to_json
                end
              end
            end
          end
        end
      end
    end
  end
end