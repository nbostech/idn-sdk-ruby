module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Media
            module V0
              class MediaApi < IdnSdkRuby::Com::Nbos::Capi::Api::V0::NetworkApi
                attr_accessor :remoteApiObj

                def initialize
                  super()
                  setModuleName("media")
                  setRemoteApiClass(IdnSdkRuby::Com::Nbos::Capi::Modules::Media::V0::MediaRemoteApi)
                  @remoteApiObj = getRemoteApiClass().new
                end

                def getMedia(uuid, mediafor)
                  remoteApi = @remoteApiObj
                  tokenApiModel = @apiContext.getUserToken("identity")
                  response = remoteApi.getMedia(tokenApiModel, uuid, mediafor)
                  if response.code == 200
                    mediaApiModel = IdnSdkRuby::Com::Nbos::Capi::Modules::Media::V0::MediaApiModel.new(response.parsed_response)
                    return mediaApiModel
                  end
                end

                def uploadMedia(uuid, mediafor, media_path)
                  remoteApi = @remoteApiObj
                  tokenApiModel = @apiContext.getUserToken("identity")
                  media_file = File.new(media_path)
                  response = remoteApi.uploadMedia(tokenApiModel, uuid, mediafor, media_file)
                  if response.code == 200
                    mediaApiModel = IdnSdkRuby::Com::Nbos::Capi::Modules::Media::V0::MediaApiModel.new(response.parsed_response)
                    return mediaApiModel
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
