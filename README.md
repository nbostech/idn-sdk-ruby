# IdnSdkRuby

Welcome to Wavelabs idn_sdk_ruby gem. This gem is a simple wrapper to connect Wavelabs identity & media modules API. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'idn_sdk_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install idn_sdk_ruby

# Usage
## Rails Usage:
  Once you Created a Rails application & installed the idn_sdk_ruby using bundle, 
  1. Create a file which will maintain the ENV variables for IDN Modules Credentials & Social Provider Credentials as follows:
    
    ```ruby
        # Add configuration values here
          FACEBOOK_KEY: "KEY"
          FACEBOOK_SECRET: "SECRET"
          GOOGLE_KEY: "KEY"
          GOOGLE_SECRET: "SECRET"
          GITHUB_KEY: "KEY"
          GITHUB_SECRET: "SECRET"
          TWITTER_KEY: "KEY"
          TWITTER_SECRET: "SECRET"
          LINKEDIN_KEY: "KEY"
          LINKEDIN_SECRET: "SECRET"
          INSTAGRAM_KEY: "KEY"
          INSTAGRAM_SECRET: "SECRET"
        
          MODULE_IDENTITY_API_HOST_URL: "http://api.qa1.nbos.in"
          MODULE_IDENTITY_API_CLIENT_KEY: "sample-app-client"
          MODULE_IDENTITY_API_CLIENT_SECRET: "sample-app-secret"
    ```
    
   Now all the environment variables will be accessible like ENV["MODULE_IDENTITY_API_HOST_URL"] in our Rails application.
     
  
  2. After that create an application context ruby file under /config/intializers as follows:
  ```ruby
    class IdsRailsApiContext < IdnSdkRuby::Com::Nbos::Capi::Api::V0::InMemoryApiContext
    
     def initialize(name = nil, conText = nil)
     	 super(name) if name != nil
     end
    
     def init()
     end	
    
     	#CLIENT TOKEN set/get
        def setClientToken(tokenApiModel)
        	super(tokenApiModel)
        end
    
        def getClientToken
          tokenApiModel = super
          if (tokenApiModel != nil)
            return tokenApiModel
          else
            return nil
          end  
        end
    
        def setUserToken(moduleName, tokenApiModel)
        	super(moduleName, tokenApiModel)
        end
    
        def getUserToken(moduleName)
            tokenApiModel = super(moduleName)
            if (tokenApiModel != nil)
              return tokenApiModel
            else
            	return nil    
            end
        end
    
        def getHost(moduleName)
          host = super(moduleName)
          if host != nil
            return host
          else
            return "http://api.qa1.nbos.in"   
          end 
        end
    
        def setHost(moduleName)
            #Read host name from ENVS
            host = ENV["MODULE_#{moduleName.upcase}_API_HOST_URL"]
            if moduleName != nil && host != nil
              super(moduleName, host)
            else
              super(moduleName, "http://api.qa1.nbos.in")  
            end
            
        end
    
        def setClientCredentials(moduleName)
          map = {}
          #Read client credentials from ENVS
          client_key = ENV["MODULE_#{moduleName.upcase}_API_CLIENT_KEY"]
          client_secret = ENV["MODULE_#{moduleName.upcase}_API_CLIENT_SECRET"]
          map["client_id"] = client_key != nil ? client_key :"sample-app-client"
          map["client_secret"] = client_secret != nil ? client_secret :"sample-app-secret"
          super(map)
        end  
    end
    
      app_context = IdsRailsApiContext.new("app")
      app_context.setHost("identity")
      app_context.setClientCredentials("identity")
      IdnSdkRuby::Com::Nbos::Capi::Api::V0::IdnSDK.init(app_context)
  ```
  
  2. Now we are ready to communicate with IDN registered modules identity & media.
  
     ```ruby
        # To get identity module api instance
        identity_api = IdnSdkRuby::Com::Nbos::Capi::Modules::Ids::V0::Ids.getModuleApi("identity")
        loginModel = IdnSdkRuby::Com::Nbos::Capi::Modules::Identity::V0::LoginModel.new(name, code)
        member_model = identity_api.login(loginModel)
        
        # To get Media module api instance
        media_api = IdnSdkRuby::Com::Nbos::Capi::Modules::Ids::V0::Ids.getModuleApi("media")
        media_model = media_api.getMedia(member_model.uuid, "profile")
     ```
    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://gitlab.com/[USERNAME]/idn_sdk_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

