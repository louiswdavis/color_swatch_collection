# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::Html do
  context 'methods' do
    it 'returns get_from_hex' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['html'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['html'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#1E90FF', pick: ['html'])).to eq({ collection: 'html', hex: '#1E90FF', name: 'dodgerblue' })
      expect(ColorSwatchCollection.get_from_hex('#3cb371', pick: ['html'])).to eq({ collection: 'html', hex: '#3CB371', name: 'mediumseagreen' })
      expect(ColorSwatchCollection.get_from_hex('#ffd710', pick: ['html'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['html'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['html'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('dodgerblue', pick: ['html'])).to eq({ collection: 'html', hex: '#1E90FF', name: 'dodgerblue' })
      expect(ColorSwatchCollection.get_from_name('dodger  blue', pick: ['html'])).to eq({ collection: 'html', hex: '#1E90FF', name: 'dodgerblue' })
      expect(ColorSwatchCollection.get_from_name('mediumSEAgreen', pick: ['html'])).to eq({ collection: 'html', hex: '#3CB371', name: 'mediumseagreen' })
      expect(ColorSwatchCollection.get_from_name('grank', pick: ['html'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 147
      expect(ColorSwatchCollection.get_colours(pick: ['html']).length).to eq 147
    end
  end
end
