require 'open-uri'

module AmpHelper
  def is_amp?
    request.format == :amp
  end

  def is_html?
    request.format == :html
  end

  def canonical_amphtml
    capture do
      tag.link(nil, { rel: 'amphtml', href: url_for(only_path: false, format: :amp) })
    end
  end

  def webpack_inline_css(filename)
    filename = filename + '.css'
    if current_webpacker_instance.dev_server.running?
      open(inline_asset_url(filename)).read.html_safe
    else
      File.read(File.join(Rails.root, "public", asset_pack_path(filename))).html_safe
    end
  end

  def inline_asset_url(name)
    server = current_webpacker_instance.config.dev_server
    protocol = server[:https] ? "https://" : "http://"
    host = server[:public]
    pack = asset_pack_path(name)
    "#{protocol}#{host}#{pack}"
  end
end