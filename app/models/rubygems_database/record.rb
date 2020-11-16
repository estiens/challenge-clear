module RubygemsDatabase
  class Record < RubygemsDatabase::Base
    before_destroy :destroy_associated

    self.table_name = "rubygems"

    has_many :details, class_name: "Detail", foreign_key: :rubygem_id, dependent: :destroy
    has_many :gem_downloads, class_name: "GemDownload", foreign_key: :rubygem_id, dependent: :destroy
    has_many :versions, class_name: "Version", foreign_key: :rubygem_id, dependent: :destroy

    scope :query_by_name, ->(name) { where("LOWER(name) LIKE ?", "%#{name.downcase}%") }
    delegate :authors, to: :version_info

    def version_info
      @version_info ||= versions.order(:created_at).last
    end

    def library_name
      name
    end

    def library_description
      version_info.description || version_info.summary
    end

    def version_infos
      versions.order(:created_at).map do |v|
        {
          number: v["number"],
          required_version: v["required_ruby_version"],
          updated_at: v["updated_at"]
        }
      end
    end

    def additional_info
      detail_info = details.last
      return {} unless detail_info

      {
        url: detail_info.home,
        docs: detail_info.docs
      }
    end

    private
      # doesn't like our dependent option on this db...
      def destroy_associated
        versions.destroy_all
        gem_downloads.destroy_all
        details.destroy_all
      end
  end
end
