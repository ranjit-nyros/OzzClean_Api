
require 'open-uri'
require 'openssl'
require 'net/https'
module Net
class SMTP
def tls?
true
end
end
end
