# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::TailwindV1 do
  context 'methods' do
    it 'returns get_from_hex when scoped' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['tailwind_v1'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['tailwind_v1'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#FEB2B2', pick: ['tailwind_v1'])).to eq({ collection: 'tailwind_v1', hex: '#FEB2B2', name: 'red-300' })
      expect(ColorSwatchCollection.get_from_hex('#234e52', pick: ['tailwind_v1'])).to eq({ collection: 'tailwind_v1', hex: '#234E52', name: 'teal-900' })
      expect(ColorSwatchCollection.get_from_hex('#FECDD3', pick: ['tailwind_v1'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['tailwind_v1'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['tailwind_v1'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('  RED-300  ', pick: ['tailwind_v1'])).to eq({ collection: 'tailwind_v1', hex: '#FEB2B2', name: 'red-300' })
      expect(ColorSwatchCollection.get_from_name('teAL-900', pick: ['tailwind_v1'])).to eq({ collection: 'tailwind_v1', hex: '#234E52', name: 'teal-900' })
      expect(ColorSwatchCollection.get_from_name('fuchsia-50', pick: ['tailwind_v1'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 92
      expect(ColorSwatchCollection.get_colours(pick: ['tailwind_v1']).length).to eq 92
    end
  end
end
