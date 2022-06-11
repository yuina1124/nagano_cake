class Item < ApplicationRecord

  belongs_to :genre
  has_many :order_detail, dependent: :destroy
  has_many :cart_item, dependent: :destroy

  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image(1).jpg')
      image.attach(io: File.open(file_path), filename: 'no_image(1).jpg')
    end
      image
      # image.variant(resize_to_limit: [width, height]).processed
  end

end
