var search_data = {"index":{"searchIndex":["digest","base","class","instance","md5","rmd160","sha1","sha2","object","<<()","<<()","<<()","==()","digest()","base64digest()","base64digest()","base64digest!()","block_length()","block_length()","block_length()","bubblebabble()","bubblebabble()","bubblebabble()","digest()","digest()","digest!()","digest_conf()","digest_length()","digest_length()","digest_length()","file()","file()","find_openssl_library()","hexdigest()","hexdigest()","hexdigest!()","hexencode()","inspect()","length()","new()","new()","reset()","reset()","reset()","size()","to_s()","update()","update()","update()"],"longSearchIndex":["digest","digest::base","digest::class","digest::instance","digest::md5","digest::rmd160","digest::sha1","digest::sha2","object","digest::base#<<()","digest::instance#<<()","digest::sha2#<<()","digest::instance#==()","object#digest()","digest::class::base64digest()","digest::instance#base64digest()","digest::instance#base64digest!()","digest::base#block_length()","digest::instance#block_length()","digest::sha2#block_length()","digest::bubblebabble()","digest::class::bubblebabble()","digest::instance#bubblebabble()","digest::class::digest()","digest::instance#digest()","digest::instance#digest!()","object#digest_conf()","digest::base#digest_length()","digest::instance#digest_length()","digest::sha2#digest_length()","digest::class::file()","digest::instance#file()","object#find_openssl_library()","digest::class::hexdigest()","digest::instance#hexdigest()","digest::instance#hexdigest!()","digest::hexencode()","digest::instance#inspect()","digest::instance#length()","digest::instance#new()","digest::sha2::new()","digest::base#reset()","digest::instance#reset()","digest::sha2#reset()","digest::instance#size()","digest::instance#to_s()","digest::base#update()","digest::instance#update()","digest::sha2#update()"],"info":[["Digest","","Digest.html","","<p>This module provides a framework for message digest libraries.\n<p>You may want to look at OpenSSL::Digest …\n"],["Digest::Base","","Digest/Base.html","","<p>This abstract class provides a common interface to message digest implementation classes written in  …\n"],["Digest::Class","","Digest/Class.html","","<p>This module stands as a base class for digest implementation classes.\n"],["Digest::Instance","","Digest/Instance.html","","<p>This module provides instance methods for a digest implementation object to calculate message digest …\n"],["Digest::MD5","","Digest/MD5.html","","<p>A class for calculating message digests using the MD5 Message-Digest Algorithm by RSA Data Security, …\n"],["Digest::RMD160","","Digest/RMD160.html","","<p>A class for calculating message digests using RIPEMD-160 cryptographic hash function, designed by Hans …\n"],["Digest::SHA1","","Digest/SHA1.html","","<p>A class for calculating message digests using the SHA-1 Secure Hash Algorithm by NIST (the US&#39; National …\n"],["Digest::SHA2","","Digest/SHA2.html","","<p>A meta digest provider class for SHA256, SHA384 and SHA512.\n<p>FIPS 180-2 describes SHA2 family of digest …\n"],["Object","","Object.html","",""],["<<","Digest::Base","Digest/Base.html#method-i-3C-3C","(p1)","<p>Update the digest using given <em>string</em> and return <code>self</code>.\n"],["<<","Digest::Instance","Digest/Instance.html#method-i-3C-3C","(p1)","<p>Updates the digest using a given <em>string</em> and returns self.\n<p>The update() method and the left-shift operator …\n"],["<<","Digest::SHA2","Digest/SHA2.html#method-i-3C-3C","(str)",""],["==","Digest::Instance","Digest/Instance.html#method-i-3D-3D","(p1)","<p>If a string is given, checks whether it is equal to the hex-encoded hash value of the digest object. …\n"],["Digest","Object","Object.html#method-i-Digest","(name)","<p>Returns a Digest subclass by <code>name</code> in a thread-safe manner even when on-demand loading is involved.\n\n<pre class=\"ruby\"><span class=\"ruby-identifier\">require</span> <span class=\"ruby-operator\">...</span>\n</pre>\n"],["base64digest","Digest::Class","Digest/Class.html#method-c-base64digest","(str, *args)","<p>Returns the base64 encoded hash value of a given <em>string</em>.  The return value is properly padded with &#39;=&#39; …\n"],["base64digest","Digest::Instance","Digest/Instance.html#method-i-base64digest","(str = nil)","<p>If none is given, returns the resulting hash value of the digest in a base64 encoded form, keeping the …\n"],["base64digest!","Digest::Instance","Digest/Instance.html#method-i-base64digest-21","()","<p>Returns the resulting hash value and resets the digest to the initial state.\n"],["block_length","Digest::Base","Digest/Base.html#method-i-block_length","()","<p>Return the block length of the digest in bytes.\n"],["block_length","Digest::Instance","Digest/Instance.html#method-i-block_length","()","<p>Returns the block length of the digest.\n<p>This method is overridden by each implementation subclass.\n"],["block_length","Digest::SHA2","Digest/SHA2.html#method-i-block_length","()","<p>Return the block length of the digest in bytes.\n\n<pre class=\"ruby\"><span class=\"ruby-constant\">Digest</span><span class=\"ruby-operator\">::</span><span class=\"ruby-constant\">SHA256</span>.<span class=\"ruby-identifier\">new</span>.<span class=\"ruby-identifier\">block_length</span> <span class=\"ruby-operator\">*</span> <span class=\"ruby-value\">8</span>\n<span class=\"ruby-comment\"># =&gt; 512</span>\n<span class=\"ruby-constant\">Digest</span><span class=\"ruby-operator\">::</span><span class=\"ruby-constant\">SHA384</span>.<span class=\"ruby-identifier\">new</span>.<span class=\"ruby-identifier\">block_length</span> <span class=\"ruby-operator\">...</span>\n</pre>\n"],["bubblebabble","Digest","Digest.html#method-c-bubblebabble","(p1)","<p>Returns a BubbleBabble encoded version of a given <em>string</em>.\n"],["bubblebabble","Digest::Class","Digest/Class.html#method-c-bubblebabble","(*args)","<p>Returns the BubbleBabble encoded hash value of a given <em>string</em>.\n"],["bubblebabble","Digest::Instance","Digest/Instance.html#method-i-bubblebabble","()","<p>Returns the resulting hash value in a Bubblebabble encoded form.\n"],["digest","Digest::Class","Digest/Class.html#method-c-digest","(*args)","<p>Returns the hash value of a given <em>string</em>.  This is equivalent to Digest::Class.new(*parameters).digest(string), …\n"],["digest","Digest::Instance","Digest/Instance.html#method-i-digest","(p1 = v1)","<p>If none is given, returns the resulting hash value of the digest, keeping the digest&#39;s state.\n<p>If a …\n"],["digest!","Digest::Instance","Digest/Instance.html#method-i-digest-21","()","<p>Returns the resulting hash value and resets the digest to the initial state.\n"],["digest_conf","Object","Object.html#method-i-digest_conf","(name, hdr = name, funcs = nil, types = nil)",""],["digest_length","Digest::Base","Digest/Base.html#method-i-digest_length","()","<p>Return the length of the hash value in bytes.\n"],["digest_length","Digest::Instance","Digest/Instance.html#method-i-digest_length","()","<p>Returns the length of the hash value of the digest.\n<p>This method should be overridden by each implementation …\n"],["digest_length","Digest::SHA2","Digest/SHA2.html#method-i-digest_length","()","<p>Return the length of the hash value (the digest) in bytes.\n\n<pre class=\"ruby\"><span class=\"ruby-constant\">Digest</span><span class=\"ruby-operator\">::</span><span class=\"ruby-constant\">SHA256</span>.<span class=\"ruby-identifier\">new</span>.<span class=\"ruby-identifier\">digest_length</span> <span class=\"ruby-operator\">*</span> <span class=\"ruby-value\">8</span>\n<span class=\"ruby-comment\"># =&gt; 256 ...</span>\n</pre>\n"],["file","Digest::Class","Digest/Class.html#method-c-file","(name, *args)","<p>Creates a digest object and reads a given file, <em>name</em>. Optional arguments are passed to the constructor …\n"],["file","Digest::Instance","Digest/Instance.html#method-i-file","(name)","<p>Updates the digest with the contents of a given file <em>name</em> and returns self.\n"],["find_openssl_library","Object","Object.html#method-i-find_openssl_library","()","<p>Copy from ext/openssl/extconf.rb\n"],["hexdigest","Digest::Class","Digest/Class.html#method-c-hexdigest","(*args)","<p>Returns the hex-encoded hash value of a given <em>string</em>.  This is almost equivalent to Digest.hexencode …\n"],["hexdigest","Digest::Instance","Digest/Instance.html#method-i-hexdigest","(p1 = v1)","<p>If none is given, returns the resulting hash value of the digest in a hex-encoded form, keeping the digest&#39;s …\n"],["hexdigest!","Digest::Instance","Digest/Instance.html#method-i-hexdigest-21","()","<p>Returns the resulting hash value in a hex-encoded form and resets the digest to the initial state.\n"],["hexencode","Digest","Digest.html#method-c-hexencode","(p1)","<p>Generates a hex-encoded version of a given <em>string</em>.\n"],["inspect","Digest::Instance","Digest/Instance.html#method-i-inspect","()","<p>Creates a printable version of the digest object.\n"],["length","Digest::Instance","Digest/Instance.html#method-i-length","()","<p>Returns digest_obj.digest_length().\n"],["new","Digest::Instance","Digest/Instance.html#method-i-new","()","<p>Returns a new, initialized copy of the digest object.  Equivalent to digest_obj.clone().reset().\n"],["new","Digest::SHA2","Digest/SHA2.html#method-c-new","(bitlen = 256)","<p>Create a new SHA2 hash object with a given bit length.\n<p>Valid bit lengths are 256, 384 and 512.\n"],["reset","Digest::Base","Digest/Base.html#method-i-reset","()","<p>Reset the digest to its initial state and return <code>self</code>.\n"],["reset","Digest::Instance","Digest/Instance.html#method-i-reset","()","<p>Resets the digest to the initial state and returns self.\n<p>This method is overridden by each implementation …\n"],["reset","Digest::SHA2","Digest/SHA2.html#method-i-reset","()","<p>Reset the digest to the initial state and return self.\n"],["size","Digest::Instance","Digest/Instance.html#method-i-size","()","<p>Returns digest_obj.digest_length().\n"],["to_s","Digest::Instance","Digest/Instance.html#method-i-to_s","()","<p>Returns digest_obj.hexdigest().\n"],["update","Digest::Base","Digest/Base.html#method-i-update","(p1)","<p>Update the digest using given <em>string</em> and return <code>self</code>.\n"],["update","Digest::Instance","Digest/Instance.html#method-i-update","(p1)","<p>Updates the digest using a given <em>string</em> and returns self.\n<p>The update() method and the left-shift operator …\n"],["update","Digest::SHA2","Digest/SHA2.html#method-i-update","(str)","<p>Update the digest using a given <em>string</em> and return self.\n"]]}}