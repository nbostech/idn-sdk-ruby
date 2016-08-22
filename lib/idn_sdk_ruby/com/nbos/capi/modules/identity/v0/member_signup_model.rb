module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Identity
            module V0
              class MemberSignupModel
                attr_accessor :username, :email, :password, :firstName, :lastName, :jsonAttributes

                def initialize(userName = nil,  passWord = nil, eMail = nil, first_name = nil, last_name = nil)
                  @username = userName
                  @email = eMail
                  @password = passWord
                  @firstName = first_name
                  @lastName = last_name
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