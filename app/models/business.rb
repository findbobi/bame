class Business < ApplicationRecord
  COMMUNITIES = [ "Black-owned", "Female-owned", "Female-friendy", "LGBTQ+ friendly",
                  "LGBTQ+ owned", "Environmentally-friendly", "Sustainable business",
                  "Green company", "Local business", "Berlin-based", "Hamburg-based",
                  "Community-owned", "Migrant-Founder", "Migrant-Background", "Inclusive",
                  "Diverse", "Immigrant-friendly", "Internationals-friendly",
                  "Foreigners-friendly", "Asian-owned", "Arab-owned", "African-owned",
                  "Turkish-owned", "Indian-owned", "Latin-owned", "Employee-friendly",
                  "Sex-worker friendly"]

  belongs_to :business_type
  has_one_attached :avatar

  acts_as_taggable_on :languages, :tags

  before_validation :smart_add_url_protocol

  validates :name, :owner_name, :email, :business_type_id, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :website, :instagram, url: { no_local: true, allow_nil: true, allow_blank: true }
  validates :telephone, :presence => true,
                        :numericality => true,
                        :length => { :minimum => 10, :maximum => 15 }

  def tags_and_language_names
    tags&.map(&:name) + languages.map(&:name)
  end

  # TODO: make this method more effective
  def self.list_records(what, where, tags, languages)
    what = BusinessType.where(name: what)
    tags = tags&.split(", ") || []
    languages = languages&.split(", ") || []

    search_result = Business.all
    search_result = search_result.where(location: where) if where.present?
    tagged_search_result = search_result.tagged_with((languages + tags), :any => true)
    search_result = tagged_search_result if tagged_search_result.present?
    search_result = search_result.where(business_type: what) if what.present?

    search_result
  end

  protected

  def smart_add_url_protocol
    unless website[/\Ahttp:\/\//] || website[/\Ahttps:\/\//]
      self.website = "https://#{website}" if website.present?
    end
    unless instagram[/\Ahttp:\/\//] || instagram[/\Ahttps:\/\//]
      self.instagram = "https://#{instagram}" if instagram.present?
    end
  end
end
