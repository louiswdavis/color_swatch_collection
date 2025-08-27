# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::TailwindV2 do
  context 'methods' do
    it 'returns get_from_hex when scoped' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['tailwind_v2'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['tailwind_v2'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#FFFBEB', pick: ['tailwind_v2'])).to eq({ collection: 'tailwind_v2', hex: '#FFFBEB', name: 'yellow-50' })
      expect(ColorSwatchCollection.get_from_hex('#78350f', pick: ['tailwind_v2'])).to eq({ collection: 'tailwind_v2', hex: '#78350F', name: 'yellow-900' })
      expect(ColorSwatchCollection.get_from_hex('#FECDD3', pick: ['tailwind_v2'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['tailwind_v2'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['tailwind_v2'])).to eq({})
      expect(ColorSwatchCollection.get_from_name(' yelLOW-50 ', pick: ['tailwind_v2'])).to eq({ collection: 'tailwind_v2', hex: '#FFFBEB', name: 'yellow-50' })
      expect(ColorSwatchCollection.get_from_name('yELLow-900', pick: ['tailwind_v2'])).to eq({ collection: 'tailwind_v2', hex: '#78350F', name: 'yellow-900' })
      expect(ColorSwatchCollection.get_from_name('rose-200', pick: ['tailwind_v2'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 80
      expect(ColorSwatchCollection.get_colours(pick: ['tailwind_v2']).length).to eq 80
    end
  end
end
