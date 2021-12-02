require "rqrcode"

class Table < ApplicationRecord
  has_many :orders
  validates :reference, :status, presence: true 

  enum status: [:available, :reserved, :open]

  scope :ordered_by_ref, -> { order(reference: :asc) }

  def qr_code
    qrcode = RQRCode::QRCode.new("http://garcon-net.herokuapp.com/tables/" + id.to_s)
    svg = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 5,
      standalone: true,
      use_path: true
    )
    svg.html_safe
  end
end
