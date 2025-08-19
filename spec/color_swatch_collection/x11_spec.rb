# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::X11 do
  context 'methods' do
    it 'returns get_from_hex when scoped' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['x11'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['x11'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#4b0082', pick: ['x11'])).to eq({ collection: 'x11', hex: '#4B0082', name: 'indigo' })
      expect(ColorSwatchCollection.get_from_hex('#FFDeAd', pick: ['x11'])).to eq({ collection: 'x11', hex: '#FFDEAD', name: 'navajowhite' })
      expect(ColorSwatchCollection.get_from_hex('#2f4f3f', pick: ['x11'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['x11'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['x11'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('indigo', pick: ['x11'])).to eq({ collection: 'x11', hex: '#4B0082', name: 'indigo' })
      expect(ColorSwatchCollection.get_from_name('navaJOwhite', pick: ['x11'])).to eq({ collection: 'x11', hex: '#FFDEAD', name: 'navajowhite' })
      expect(ColorSwatchCollection.get_from_name('grank', pick: ['x11'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 147
      expect(ColorSwatchCollection.get_colours(pick: ['x11']).length).to eq 147
    end
  end
end
