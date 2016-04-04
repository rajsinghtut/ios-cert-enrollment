module IOSCertEnrollment
  module SSL
    @@key, @@certificate = nil
    class << self
      def key
        return @@key if @@key
        return @@key = OpenSSL::PKey::RSA.new(IOSCertEnrollment.ssl_key) if IOSCertEnrollment.ssl_key.present?
        return @@key = OpenSSL::PKey::RSA.new(File.read(IOSCertEnrollment.ssl_key_path))
      end

      def certificate
        return @@certificate if @@certificate
        return @@certificate = OpenSSL::X509::Certificate.new(IOSCertEnrollment.ssl_certificate)) if IOSCertEnrollment.ssl_certificate.present?
        return @@certificate = OpenSSL::X509::Certificate.new(File.read(IOSCertEnrollment.ssl_certificate_path))
      end
    end
    
  end
end