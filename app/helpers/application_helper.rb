module ApplicationHelper
  def gravatar_for(user, options = {size: 80})
    # get the email from URL-parameters and make lowercase
    email_address = user.email.downcase

    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)

    # extract size
    size = options[:size]
    # compile URL which can be used in image_tag
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"

    # return an image_tag
    image_tag(gravatar_url, alt: user.username, class: "rounded m-2 d-block img-thumbnail")
  end

end
