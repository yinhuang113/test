class Floor < ActiveRecord::Base
  attr_accessible :label, :main, :mall_id, :order, :source_map_file_name, :svg, :svg_file
  belongs_to :mall
  has_many :polygons, dependent: :destroy
  has_many :connector_locations, dependent: :destroy
  has_many :entrances, dependent: :destroy
  
  validates :label, presence: true
  validates :order, presence: true, numericality: { only_integer: true, greater_than_or_equal: 0 }
  validates :svg_file, presence: true, on: :create
  validate :should_be_only_main, :should_be_only_with_order, :svg_file_should_be_svg
  
  after_save :generate_polygons
  
  def should_be_only_main
    if id
      if main && Floor.where('mall_id = ? AND id != ? AND main = TRUE', mall_id, id).exists?
        errors.add(:main, "there is already a main floor")
      end
    else
      if main && Floor.where(mall_id: mall, main: true).exists?
        errors.add(:main, "there is already a main floor")
      end
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
  
  def generate_polygons
    Polygon.where(floor_id: id, from_svg: true).destroy_all
    if @svg_file
      data = `#{Rails.root.join('bin', 'poly')} #{@svg_file.tempfile.path}`
      data.each_line do |line|
        components = line.split
        polygon = Polygon.new(floor_id: id)
        polygon.from_svg = true
        polygon.label = components[0]
        polygon.vertices= components[1]
        polygon.save
      end
    end
  end
end
