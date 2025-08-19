# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::Ntc do
  context 'methods' do
    it 'returns get_from_hex when scoped' do
      expect(ColorSwatchCollection.get_from_hex(nil, pick: ['ntc'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('', pick: ['ntc'])).to eq({})
      expect(ColorSwatchCollection.get_from_hex('#002E20', pick: ['ntc'])).to eq({ collection: 'ntc', hex: '#002E20', name: 'burnham' })
      expect(ColorSwatchCollection.get_from_hex('#007fff', pick: ['ntc'])).to eq({ collection: 'ntc', hex: '#007FFF', name: 'azure radiance' })
      expect(ColorSwatchCollection.get_from_hex('#016AA7', pick: ['ntc'])).to eq({})
    end

    it 'returns get_from_name when scoped' do
      expect(ColorSwatchCollection.get_from_name(nil, pick: ['ntc'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('', pick: ['ntc'])).to eq({})
      expect(ColorSwatchCollection.get_from_name('Burnham', pick: ['ntc'])).to eq({ collection: 'ntc', hex: '#002E20', name: 'burnham' })
      expect(ColorSwatchCollection.get_from_name('  Azure RADiance  ', pick: ['ntc'])).to eq({ collection: 'ntc', hex: '#007FFF', name: 'azure radiance' })
      expect(ColorSwatchCollection.get_from_name('grank', pick: ['ntc'])).to eq({})
    end

    it 'returns colours and get_colours when scoped' do
      expect(described_class.colours.length).to eq 1566
      expect(ColorSwatchCollection.get_colours(pick: ['ntc']).length).to eq 1566
    end
  end
end
