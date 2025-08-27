# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::TailwindV3 do
  context 'methods' do
    it 'returns get_from_hex when scoped' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['tailwind_v3'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['tailwind_v3'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#BAE6FD', pick: ['tailwind_v3'])).to eq({ collection: 'tailwind_v3', hex: '#BAE6FD', name: 'sky-200' })
      expect(ColorSwatchCollection.get_from_hex('#FDF4FF', pick: ['tailwind_v3'])).to eq({ collection: 'tailwind_v3', hex: '#FDF4FF', name: 'fuchsia-50' })
      expect(ColorSwatchCollection.get_from_hex('#FAA7B4', pick: ['tailwind_v3'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['tailwind_v3'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['tailwind_v3'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('  sky-200  ', pick: ['tailwind_v3'])).to eq({ collection: 'tailwind_v3', hex: '#BAE6FD', name: 'sky-200' })
      expect(ColorSwatchCollection.get_from_name('fuCHsia-50', pick: ['tailwind_v3'])).to eq({ collection: 'tailwind_v3', hex: '#FDF4FF', name: 'fuchsia-50' })
      expect(ColorSwatchCollection.get_from_name('grank', pick: ['tailwind_v3'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 242
      expect(ColorSwatchCollection.get_colours(pick: ['tailwind_v3']).length).to eq 242
    end
  end
end
