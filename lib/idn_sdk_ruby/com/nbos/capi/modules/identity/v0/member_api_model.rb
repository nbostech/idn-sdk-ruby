module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class MemberApiModel
                attr_accessor :id, :email, :firstName, :lastName, :phone, :description, :uuid, :isExternal,
                              :socialAccounts, :emailConnects, :token

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
                    add_socilaAccounts(member_details["socialAccounts"])
                    add_emailConnects(member_details["emailConnects"])
                    token_details = parsed_response["token"].nil? ? nil : parsed_response["token"]
                    @token = IdnSdkRuby::Com::Nbos::Capi::Api::V0::TokenApiModel.new(parsed_response["token"])
                  end
                end

                def add_socilaAccounts(accounts)
                  @socialAccounts = []
                  if accounts.size > 0
                    accounts.each do |sp|
                      @social_accounts << IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::SocialAccountApiModel(sp)
                    end
                  end
                end

                def add_emailConnects(email_connects)
                  @emailConnects = []
                  if email_connects.size > 0
                    email_connects.each do |ec|
                      @emailConnects << IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::EmailConnectApiModel(ec)
                    end
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