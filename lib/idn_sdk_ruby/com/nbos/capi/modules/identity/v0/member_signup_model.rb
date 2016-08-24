module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class MemberSignupModel < IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::BasicActiveModel
                attr_accessor :username, :email, :password, :firstName, :lastName, :jsonAttributes, :message

                def initialize(userName = nil,  passWord = nil, eMail = nil, first_name = nil, last_name = nil)
                  @username = userName
                  @email = eMail
                  @password = passWord
                  @firstName = first_name
                  @lastName = last_name
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
                      firstName: @firstName,
                      lastName: @lastName,
                      email: @email
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