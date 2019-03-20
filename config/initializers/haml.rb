# Custom behavior and options for Haml output
# See documentation at http://haml.info/docs/yardoc/file.REFERENCE.html#options
# and full options list at http://haml.info/docs/yardoc/Haml/Options.html

# Use XHTML style (self-closing tags, etc.)
# Note this requires a `!!!5` DOCTYPE to use HTML5 semantics
Haml::Template.options[:format] = :xhtml

# Use double quotes on attribute values, etc.
Haml::Template.options[:attr_wrapper] = '"'
