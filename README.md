# FeatureBucket
A feature microservice that provides a central location for application features that can be queried from any application with proper authentication.
## Features
Features are identified by a unique name that should be descriptive of the feature. Each feature has a list of unary bits which control feature usage. Bits are contexts for which the feature is enabled. Without bits, the feature is disabled. When a feature is queried with matching bits, it is said to be enabled.
## Technology Choices
* Docker
* Ruby & Sinatra
* Swagger & Swagger UI
* MogoDB & Mongoid
* FactoryBot (was FactoryGirl)
