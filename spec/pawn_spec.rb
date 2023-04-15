require_relative 'spec_helper'
require_relative '../lib/board'
require_relative '../lib/piece'
require_relative '../lib/pieces/pawn'

describe Pawn do
  describe '.move_range' do
    let(:board) { Board.new({}) }
    before do
      board.board[[1, 2]] = Pawn.new(board, :white, 1, 2)
    end
    let(:pawn) { board.piece_at([1, 2]) }
    context 'when no other pieces are around' do
      it 'can move two spaces on first move' do
        expect(pawn.move_range.include?([1, 4])).to eq(true)
      end
      it 'cannot move two spaces on second move' do
        pawn.move_history.push(:dummy_move)
        expect(pawn.move_range.include?([1, 4])).to eq(false)
      end
      it 'can move one space' do
        expect(pawn.move_range.include?([1, 3])).to eq(true)
      end
    end
    context 'when a piece is two spaces ahead' do
      before do
        board.board[[1, 4]] = Pawn.new(board, :black, 1, 4)
      end
      it 'cannot move two spaces' do
        expect(pawn.move_range.include?([1, 4])).to eq(false)
      end
      it 'can move one space' do
        expect(pawn.move_range.include?([1, 3])).to eq(true)
      end
    end
    context 'when a piece is one space ahead' do
      before do
        board.board[[1, 3]] = Pawn.new(board, :black, 1, 4)
      end
      it 'cannot move two spaces' do
        expect(pawn.move_range.include?([1, 4])).to eq(false)
      end
      it 'cannot move one space' do
        expect(pawn.move_range.include?([1, 3])).to eq(false)
      end
    end
    context 'when a piece is diagonal' do
      it 'can capture enemies' do
        board.board[[2, 3]] = Pawn.new(board, :black, 2, 3)
        expect(pawn.move_range.include?([2, 3])).to eq(true)
      end
      it 'cannot capture allies' do
        board.board[[2, 3]] = Pawn.new(board, :white, 2, 3)
        expect(pawn.move_range.include?([2, 3])).to eq(false)
      end
    end
    context 'when an enemy piece moves 2 spaces to its side' do
      xit 'can capture en passant' do
      end
    end
  end
end
