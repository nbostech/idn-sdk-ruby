require 'active_model'
module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class LoginModel
                attr_accessor :username, :password, :messageCode, :message

                include ActiveModel::Validations
                include ActiveModel::Conversion
                extend ActiveModel::Naming

                def initialize(name = nil, code = nil)
                  @username = name
                  @password = code
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
                      password: @password,
                      messageCode: @messageCode,
                      message: @message
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