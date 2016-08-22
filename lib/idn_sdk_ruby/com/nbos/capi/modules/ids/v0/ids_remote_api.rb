module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Ids
            module V0
              class IdsRemoteApi

                attr_accessor :modsApiJson, :modApiDef, :modApiJson, :tntsApiDef, :tntApiJson, :tnts, :modTnts

                def initialize
                  #All Modules JSON API
                  @modsApiJson = "/ids/v0/definitions/api-json"

                  #Get Module API definition
                  @modApiDef = "/ids/v0/definitions/modules/{moduleName}"

                  #Module JSON API
                  @modApiJson = "/api/ids/v0/definitions/modules/{moduleName}/api-json"

                  #Get Tenants API definition
                  @tntsApiDef = "/ids/v0/definitions/tenants/{tenantId}"

                  #Tenant JSON API
                  @tntApiJson = "/ids/v0/definitions/tenants/{tenantId}/api-json"

                  #Get Tenants open for biz
                  @tnts = "/ids/v0/tenants"

                  #Get Tenants open for biz
                  @modTnts = "/ids/v0/tenants/{moduleName}"
                end

              end
            end
          end
        end
      end
    end
  end
end