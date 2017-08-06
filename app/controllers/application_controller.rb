class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include SetPageDefaultsConcern
  include CopyrightRenderer
  protect_from_forgery with: :exception

end