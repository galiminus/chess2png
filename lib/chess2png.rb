require 'chess'
require 'chunky_png'

class Chess2PNG
  BOARD_SIZE = 8

  def initialize(options = {})
    @pieces = options.delete(:pieces) || default_pieces
    @background = options.delete(:background) || default_background
    @square_size = options.delete(:square_size) || 61
  end

  def encode(board)
    ChunkyPNG::Image.from_file(@background).tap do |image|
      self.encode_to_image(board, image)
    end
  end

  def encode_to_image(board, image)
    BOARD_SIZE.times do |x|
      BOARD_SIZE.times do |y|
        piece_image = self.piece_to_image(board[x + y * BOARD_SIZE])

        if piece_image
          image.compose!(piece_image, x * @square_size, (BOARD_SIZE - 1) * @square_size - y * @square_size)
        end
      end
    end
  end

  def piece_to_image(piece)
    @pieces.map do |piece, path|
      [ piece, load_image(path) ]
    end.to_h[piece]
  end

  def default_pieces
    root = File.dirname(__FILE__)

    {
      'P' => File.join(root, "../assets/Chess_plt60.png"),
      'R' => File.join(root, "../assets/Chess_rlt60.png"),
      'N' => File.join(root, "../assets/Chess_nlt60.png"),
      'B' => File.join(root, "../assets/Chess_blt60.png"),
      'Q' => File.join(root, "../assets/Chess_qlt60.png"),
      'K' => File.join(root, "../assets/Chess_klt60.png"),

      'p' => File.join(root, "../assets/Chess_pdt60.png"),
      'r' => File.join(root, "../assets/Chess_rdt60.png"),
      'n' => File.join(root, "../assets/Chess_ndt60.png"),
      'b' => File.join(root, "../assets/Chess_bdt60.png"),
      'q' => File.join(root, "../assets/Chess_qdt60.png"),
      'k' => File.join(root, "../assets/Chess_kdt60.png")
    }
  end

  def default_background
    root = File.dirname(__FILE__)

    File.join(root, "../assets/background.png")
  end

  def load_image(path)
    @image_cache ||= {}
    @image_cache[path] ||= ChunkyPNG::Image.from_file(path)
    @image_cache[path]
  end
end
