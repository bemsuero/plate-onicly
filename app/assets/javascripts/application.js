// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


require "curb"
require "json"

c = Curl::Easy.http_get("https://api.yelp.com/v3/businesses/search/api/token", "grant_type=client_credentials"
    ) do |curl|
      curl.headers['Authorization'] = 'Basic VyrZpVa6N0USPBDlVv5wiA'
    end

access_token = JSON.parse(c.body_str)["99uhaoGtL2nGG5okFnRrDIqjL38zu0djkdZbsQcKXQisixYIbnxzDhHSs3O3nQ3l7Y2CacILy6CJWkiDeNxJ_wWhGZ8HRxudobFUtZ5a8t-LQ1D1UlsjdTZKDsCaW3Yx"]

{
   "access_token": "NgCXRKc...MzYjw",
   "token_type": "OAuth",
   "expires_in": 3600,
}

//     Client ID
// VyrZpVa6N0USPBDlVv5wiA
//
// API Key
// 99uhaoGtL2nGG5okFnRrDIqjL38zu0djkdZbsQcKXQisixYIbnxzDhHSs3O3nQ3l7Y2CacILy6CJWkiDeNxJ_wWhGZ8HRxudobFUtZ5a8t-LQ1D1UlsjdTZKDsCaW3Yx
