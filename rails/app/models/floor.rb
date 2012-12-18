class Floor < ActiveRecord::Base
  attr_accessible :label, :main, :mall_id, :order, :source_map_file_name, :svg, :svg_file
  belongs_to :mall
  has_many :ploygons
  has_many :connector_locations
  has_many :entrances
  
  validates :label, presence: true
  validates :order, presence: true, numericality: { only_integer: true, greater_than_or_equal: 0 }
  validates :svg_file, presence: true, on: :create
  validate :should_be_only_main, :should_be_only_with_order, :svg_file_should_be_svg
  
  def should_be_only_main
    if main && Floor.where(mall_id: mall, main: true).exists?
      errors.add(:main, "there is already a main floor")
    end
  end
  
  def should_be_only_with_order
    if id
      if Floor.where('mall_id = ? AND id != ? AND "order" = ?', mall_id, id, order).exists?
        errors.add(:order, "there is already a floor with this order number")
      end
    else
        if Floor.where('mall_id = ? AND "order" = ?', mall_id, order).exists?
          errors.add(:order, "there is already a floor with this order number")
        end
    end
  end
  
  def svg_file_should_be_svg
    if @svg_file && @svg_file.content_type != "image/svg+xml"
      errors.add(:svg_file, "is not an SVG file")
    end
  end
  
  def svg_file=(data)
    @svg_file = data
    self.source_map_file_name = data.original_filename
    self.svg = data.read
  end
  
  def svg_file
    @svg_file
  end
end
