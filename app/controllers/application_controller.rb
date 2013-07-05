class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    # No I do not normally write code like this but for this error, eh... Let's not clutter things up...
    render :text =>  '<div style="text-align: center; width 100%; margin-top: 10%;">
      <img src="http://www.floridianpa.com/wp-content/uploads/2011/04/denied.gif">
      <script>
        //setTimeout("window.location = document.referrer", 100)
      </script>
    </div>'
  end

end
