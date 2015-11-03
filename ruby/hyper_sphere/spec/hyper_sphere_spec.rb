require "minitest/autorun"

module HyperSphere
  extend self

  def is_sphere?(coords, radius)
    return true if coords.empty?
    coords.map do |coord|
      coord**2
    end.inject(:+) <= radius**2
  end
end

describe HyperSphere do
  it "returns true for a point with no coordinates one dimension" do
    HyperSphere.is_sphere?([0], 1).must_equal true
  end

  it "return true if points lies inside the circle radius for two dimensions" do
    HyperSphere.is_sphere?([1,2], 3).must_equal true
  end

  it "return true if points lies inside the circle radius for three dimensions" do
    HyperSphere.is_sphere?([4,5,1], 10).must_equal true
  end

  it "return false for nil radius" do
    HyperSphere.is_sphere?([], 1).must_equal true
  end
end
