require 'httmultiparty'

module IdnSdkRuby
  module Com
    module Nbos
      module Capi
        module Modules
          module Media
            module V0
              class MediaRemoteApi
                attr_accessor :mediaUrl, :host_url

                include HTTMultiParty

                headers 'Accept' => 'application/json', 'Content-Type' => 'application/json'

                debug_output $stdout

                def initialize
                  @mediaUrl = "/api/media/v0/media"
                end

                def getMedia(authorization, uuid, mediafor)
                  @host_url = "http://api.qa1.nbos.in" if @host_url.nil?
                  #response= HTTParty.post(@host_url+@loginUrl,{:body => body, :headers => { "Authorization" => "Bearer #{authorization}"}})
                  query_params = { :id => uuid, :mediafor => mediafor}
                  response = self.class.send("get", @host_url+@mediaUrl, :query => query_params, :headers => {"Authorization" => "Bearer " + authorization})
                  return response
                end

                def uploadMedia(authorization, uuid, mediafor, media_file)
                  @host_url = "http://api.qa1.nbos.in" if @host_url.nil?
                  #response= HTTParty.post(@host_url+@loginUrl,{:body => body, :headers => { "Authorization" => "Bearer #{authorization}"}})
                  query_params = { :id => uuid, :mediafor => mediafor}
                  body = {:file => media_file}
                  response = self.class.send("post", @host_url+@mediaUrl, :body => body, :query => query_params, :headers => {"Authorization" => "Bearer " + authorization})
                  return response

                end
              end
            end
          end
        end
      end
    end
  end
end