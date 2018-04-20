require_relative "00_tree_node"

class KnightPathFinder
  BOARD_SIZE = 8
  MOVES = [
          [-2,1],[-2,-1],
          [2,1],[2,-1],
          [-1,2],[1,2],
          [-1,-2],[1,-2]
          ]

  def initialize(start_pos)
    @start_pos = start_pos
    @tree = nil
    @visited_positions = [@start_pos]
  end

  def build_move_tree
    @tree = PolyTreeNode.new(@start_pos)


  end

  def self.valid_moves(pos)
    valid_moves = []
    MOVES.each do |move|
      moved_pos = [pos[0] + move[0], pos[1] + move[1]]
      if moved_pos.all? {|pos| pos.between?(0...BOARD_SIZE)} && !@visited_positions.include?(moved_pos)
        valid_moves << moved_pos
      end
    end
    valid_moves
  end



end
