require 'spec_helper'
require './lib/game'

describe Game do
  let(:ui) { double("ui").as_null_object }

  subject(:game) { Game.new(ui) }

  describe "#start" do
    it "prints the initial message" do
      initial_message = "Bem vindo ao jogo da forca!"
      expect(ui).to receive(:write).with(initial_message)

      game.start
    end
  end

  describe "#ended?" do
    it "returns false when the game just started" do
      expect(game).to_not be_ended
    end
  end

  describe "#next_step" do
    context "when the game just started" do
      it "asks the player for the length of the word to be raffled" do
        question = "Qual o tamanho da palavra a ser sorteada?"
        expect(ui).to receive(:write).with(question)

        expect(ui).to receive(:read)

        game.next_step
      end

      it "finishes the game when the player asks to" do
        player_input = "fim"

        allow(ui).to receive_messages(read: player_input)

        game.next_step

        expect(game).to be_ended
      end
    end
  end
end
