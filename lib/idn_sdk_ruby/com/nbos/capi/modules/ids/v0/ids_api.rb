module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Ids
            module V0

              class IdsApi < IdnSdkRuby::Com::Nbos::Capi::Api::V0::NetworkApi

                def initialize(host = nil)
                  super()
                  setRemoteApiClass(IdnSdkRuby::Com::Nbos::Capi::Modules::Ids::V0::IdsRemoteApi)
                  setModuleName("ids")
                  setHost(host) if host != nil
                end

              end
            end
          end
        end
      end
    end
  end
end

=begin
/*
In Idn lib
1. IdentityApi
2. IdentityRemoteApi
3. IdnSDK.init( ApiContext ) { }

In Android lib:
3. AndroidApiContext extends InMemoryApiContext

In Android App
4. c = new AndroidApiContext(); IdnSDK.init(c)
5. IdsApi idsApi = new IdsApi()
6. IdentityAPi identityApi = new IdentityApi()

------
IDS.getModule('identity')

5. IdsApi idsApi = IDS.getModule('identity')

 */
=end