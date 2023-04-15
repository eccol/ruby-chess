require_relative 'spec_helper'
require_relative '../lib/board'
require_relative '../lib/piece'
require_relative '../lib/pieces/movement'
require_relative '../lib/pieces/rook'

describe Rook do
  describe '.move_range' do
    let(:board) { Board.new({}) }
    context 'when board is empty' do
      it 'can move from bottom to top' do
        board.board[[1, 1]] = Rook.new(board, :white, 1, 1)
        rook = board.piece_at([1, 1])
        expect(rook.move_range.include?([1, 8])).to eq(true)
      end
      it 'can move from left to right' do
        board.board[[1, 1]] = Rook.new(board, :white, 1, 1)
        rook = board.piece_at([1, 1])
        expect(rook.move_range.include?([8, 1])).to eq(true)
      end
    end
    context 'when an enemy piece is on the board' do
      it 'can capture' do
        board.board[[1, 1]] = Rook.new(board, :white, 1, 1)
        rook = board.piece_at([1, 1])
        board.board[[1, 8]] = Rook.new(board, :black, 1, 8)
        expect(rook.move_range.include?([1, 8])).to eq(true)
      end
    end
    context 'when an ally piece is on the board' do
      it 'cannot capture' do
        board.board[[1, 1]] = Rook.new(board, :white, 1, 1)
        rook = board.piece_at([1, 1])
        board.board[[1, 8]] = Rook.new(board, :white, 1, 8)
        expect(rook.move_range.include?([1, 8])).to eq(false)
      end
    end
    context 'when several enemies are in a row' do
      it 'cannot pass through them' do
        board.board[[1, 1]] = Rook.new(board, :white, 1, 1)
        rook = board.piece_at([1, 1])
        board.board[[2, 1]] = Rook.new(board, :black, 2, 1)
        board.board[[3, 1]] = Rook.new(board, :black, 3, 1)
        expect(rook.move_range.include?([3, 1])).to eq(false)
      end
    end
  end
end
