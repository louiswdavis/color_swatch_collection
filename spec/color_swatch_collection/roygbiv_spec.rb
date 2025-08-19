# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::Roygbiv do
  context 'methods' do
    it 'returns get_from_hex when scoped' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['roygbiv'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['roygbiv'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#FF0000', pick: ['roygbiv'])).to eq({ collection: 'roygbiv', hex: '#FF0000', name: 'red' })
      expect(ColorSwatchCollection.get_from_hex('#EE82ee', pick: ['roygbiv'])).to eq({ collection: 'roygbiv', hex: '#EE82EE', name: 'violet' })
      expect(ColorSwatchCollection.get_from_hex('#008001', pick: ['roygbiv'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['roygbiv'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['roygbiv'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('red', pick: ['roygbiv'])).to eq({ collection: 'roygbiv', hex: '#FF0000', name: 'red' })
      expect(ColorSwatchCollection.get_from_name('viOLet', pick: ['roygbiv'])).to eq({ collection: 'roygbiv', hex: '#EE82EE', name: 'violet' })
      expect(ColorSwatchCollection.get_from_name('grank', pick: ['roygbiv'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 7
      expect(ColorSwatchCollection.get_colours(pick: ['roygbiv']).length).to eq 7
    end
  end
end
