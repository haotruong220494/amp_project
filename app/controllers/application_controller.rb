class ApplicationController < ActionController::Base
  layout proc { |controller| controller.request.format == :amp ? 'application.amp' : 'application.html' }
	include AmpHelper
end
