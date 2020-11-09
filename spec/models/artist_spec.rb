# frozen_string_literal: true

require "rails_helper"

describe Artist do
  fixtures :genres, :artists

  let(:artist) { Artist.create!(name: "Кот Матроскин", tags: ["Pop", "Rock"]) }

  describe "#create" do
    it "increment artists_count for all genres" do
      expect { artist }
        .to change { genres(:pop).reload.artists_count }.by(1)
        .and change { genres(:rock).reload.artists_count }.by(1)
    end

    it "creates new genres for unknown tags" do
      expect { Artist.create!(name: "Кот Матроскин", tags: ["Шансон", "Rock"]) }
        .to change(Genre, :count).by(1)

      expect(Genre.find_by!(name: "Шансон").artists_count).to eq 1
    end
  end

  describe "#update" do
    before { artist }

    it "increment artists_count for new genres and decrement for old" do
      # make sure we have more than 1 artist
      genres(:pop).update!(artists_count: 2)

      expect { artist.update!(tags: ["Metal", "Rock"]) }
        .to change { genres(:pop).reload.artists_count }.by(-1)
        .and change { genres(:rock).reload.artists_count }.by(0)
        .and change { genres(:metal).reload.artists_count }.by(1)
    end
  end

  describe "#destroy" do
    before { artist }

    it "decrement artists_count for all genres" do
      # make sure we have more than 1 artist
      genres(:pop).update!(artists_count: 2)

      expect { artist.destroy! }
        .to change { genres(:pop).reload.artists_count }.by(-1)
        .and change(Genre.where(name: "Rock"), :count).by(-1)
    end
  end

  describe ".by_genres" do
    subject { Artist.where(id: [artists(:metallica).id, artists(:kish).id]) }
    specify do
      expect(subject.by_genres("Pop")).to be_empty
      expect(subject.by_genres("Metal", "Pop")).to eq([artists(:metallica)])
      expect(subject.by_genres("Metal", "Punk")).to match_array([artists(:metallica), artists(:kish)])
      expect(subject.by_genres("Rock")).to match_array([artists(:metallica), artists(:kish)])
    end
  end
end
