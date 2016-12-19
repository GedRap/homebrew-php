require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Memcache < AbstractPhp70Extension
  init
  desc "Interact with memcached through OO and procedural interfaces."
  homepage "https://github.com/websupport-sk/pecl-memcache"
  head "https://github.com/websupport-sk/pecl-memcache.git", :branch => "NON_BLOCKING_IO_php7"

  def install
    Dir.chdir "memcache-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/memcache.so"
    write_config_file if build.with? "config-file"
  end
end
