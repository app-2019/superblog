Rails.application.config.middleware.use OmniAuth::Builder do
  # Make sure that you have set your KEY and SECRET in your shell startup scipt
  # This will be a file like `.zshrc` if you use ZSH, or `.bashrc` if you use
  # Bash. Other possible files include `.profile`.
  # You'll need lines in the file that look like this:
  #
  # export GITHUB_RAILS_DEMO_KEY=1234567abcdef
  #
  provider :github, ENV['GITHUB_RAILS_DEMO_KEY'], ENV['GITHUB_RAILS_DEMO_SECRET']
end
