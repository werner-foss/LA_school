class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include SetPageDefaultsConcern
  protect_from_forgery with: :exception
end
