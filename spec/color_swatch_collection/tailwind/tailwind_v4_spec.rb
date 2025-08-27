# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::TailwindV4 do
  context 'methods' do
    it 'returns get_from_hex when scoped' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['tailwind_v4'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['tailwind_v4'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#53E9FC', pick: ['tailwind_v4'])).to eq({ collection: 'tailwind_v4', hex: '#53E9FC', name: 'cyan-300' })
      expect(ColorSwatchCollection.get_from_hex('#002c21', pick: ['tailwind_v4'])).to eq({ collection: 'tailwind_v4', hex: '#002C21', name: 'emerald-950' })
      expect(ColorSwatchCollection.get_from_hex('#FAA7B4', pick: ['tailwind_v4'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['tailwind_v4'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['tailwind_v4'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('cyan-300  ', pick: ['tailwind_v4'])).to eq({ collection: 'tailwind_v4', hex: '#53E9FC', name: 'cyan-300' })
      expect(ColorSwatchCollection.get_from_name('EMERald-950', pick: ['tailwind_v4'])).to eq({ collection: 'tailwind_v4', hex: '#002C21', name: 'emerald-950' })
      expect(ColorSwatchCollection.get_from_name('PiNk-1050', pick: ['tailwind_v4'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 242
      expect(ColorSwatchCollection.get_colours(pick: ['tailwind_v4']).length).to eq 242
    end
  end
end
