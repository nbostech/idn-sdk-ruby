module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class MemberApiModel < IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::BasicActiveModel
                attr_accessor :id, :email, :firstName, :lastName, :phone, :description, :uuid, :isExternal,
                              :socialAccounts, :emailConnects, :token, :message

                def initialize(parsed_response = nil, is_new = true)
                  if !parsed_response.nil?
                    member_details = is_new ? parsed_response["member"] : parsed_response
                    @isExternal = member_details["isExternal"]
                    @id =  member_details["id"]
                    @uuid = member_details["uuid"]
                    @description = member_details["description"]
                    @email = member_details["email"]
                    @firstName = member_details["firstName"]
                    @lastName = member_details["lastName"]
                    @phone = member_details["phone"]
                    add_socialAccounts(member_details["socialAccounts"])
                    add_emailConnects(member_details["emailConnects"])
                    @token = IdnSdkRuby::Com::Nbos::Capi::Api::V0::TokenApiModel.new(parsed_response["token"])
                  end
                end

                def add_socialAccounts(accounts)
                  @socialAccounts = []
                  if accounts.size > 0
                    accounts.each do |sp|
                      @socialAccounts << IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::SocialAccountApiModel.new(sp)
                    end
                  end
                end

                def add_emailConnects(email_connects)
                  @emailConnects = []
                  if email_connects.size > 0
                    email_connects.each do |ec|
                      @emailConnects << IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::EmailConnectApiModel.new(ec)
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
                      id: @id,
                      email: @email,
                      firstName: @firstName,
                      lastName: @lastName,
                      phone: @phone,
                      description: @description,
                      uuid: @uuid,
                      isExternal: @isExternal,
                      socialAccounts: @socialAccounts,
                      emailConnects: @emailConnects,
                      token: @token
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