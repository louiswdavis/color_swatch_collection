# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::Pantone do
  context 'methods' do
    it 'returns get_from_hex when scoped' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['pantone'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['pantone'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#FDBCB4', pick: ['pantone'])).to eq({ collection: 'pantone', hex: '#FDBCB4', name: 'melon' })
      expect(ColorSwatchCollection.get_from_hex('#ffa474', pick: ['pantone'])).to eq({ collection: 'pantone', hex: '#FFA474', name: 'atomic tangerine' })
      expect(ColorSwatchCollection.get_from_hex('#FAA7B4', pick: ['pantone'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['pantone'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['pantone'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('Melon  ', pick: ['pantone'])).to eq({ collection: 'pantone', hex: '#FDBCB4', name: 'melon' })
      expect(ColorSwatchCollection.get_from_name('atOMic TANgerine', pick: ['pantone'])).to eq({ collection: 'pantone', hex: '#FFA474', name: 'atomic tangerine' })
      expect(ColorSwatchCollection.get_from_name('grank', pick: ['pantone'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 120
      expect(ColorSwatchCollection.get_colours(pick: ['pantone']).length).to eq 120
    end
  end
end
