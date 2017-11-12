class User < ActiveRecord::Base
  #attr_accessor :password
    #after_save :clear_password
    before_create :encrypt_password

    
    has_many :articles, dependent: :destroy

    before_save {self.email = email.downcase}
    validates :username, presence: true, uniqueness: {case_sensitive: false},
    length: { minimum: 5, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false},
    length: { maximum: 105 }, format: {with: VALID_EMAIL_REGEX }
    #validates :password, :confirmation => true #password_confirmation attr
    validates :encrypted_password, presence: true
       
    def encrypt_password
        if encrypted_password.present?
          self.salt= Digest::SHA1.hexdigest("# We add #{email} as unique value")
          self.encrypted_password= Digest::SHA1.hexdigest("Adding #{salt} to #{encrypted_password}")
        end
      end
    
    
end
