# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::Basic do
  context 'methods' do
    it 'returns get_from_hex when scoped' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['basic'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['basic'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#ffd700', pick: ['basic'])).to eq({ collection: 'basic', hex: '#FFD700', name: 'gold' })
      expect(ColorSwatchCollection.get_from_hex('#FFC0CB', pick: ['basic'])).to eq({ collection: 'basic', hex: '#FFC0CB', name: 'pink' })
      expect(ColorSwatchCollection.get_from_hex('#ffd710', pick: ['basic'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['basic'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['basic'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('gold', pick: ['basic'])).to eq({ collection: 'basic', hex: '#FFD700', name: 'gold' })
      expect(ColorSwatchCollection.get_from_name('PiNK', pick: ['basic'])).to eq({ collection: 'basic', hex: '#FFC0CB', name: 'pink' })
      expect(ColorSwatchCollection.get_from_name('grank', pick: ['basic'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 21
      expect(ColorSwatchCollection.get_colours(pick: ['basic']).length).to eq 21
    end
  end
end
