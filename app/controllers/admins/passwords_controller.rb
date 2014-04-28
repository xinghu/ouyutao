class Admins::PasswordsController < Devise::PasswordsController
  layout 'admin'
  append_before_filter :assert_reset_token_passed, :only => :edit
  prepend_before_filter :require_no_authentication

end