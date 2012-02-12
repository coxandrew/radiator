require 'pivotal-tracker'

include PivotalTracker

API_KEY = "aa10548cdd2329dce668fc9f7e706b4a"
FIREFLY = "398325"
Client.token = API_KEY

def project
  Project.find(FIREFLY)
end
