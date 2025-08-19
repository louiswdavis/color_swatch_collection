# frozen_string_literal: true

RSpec.describe ColorSwatchCollection do
  it 'has a version number' do
    expect(ColorSwatchCollection::VERSION).not_to be nil
  end

  context 'methods' do
    it 'returns list_collections' do
      expect(described_class.list_collections).to eq ['basic', 'html', 'ntc', 'pantone', 'roygbiv', 'x11']
    end

    it 'returns get_from_hex' do
      expect(described_class.get_from_hex('#00FF00')).to eq({ collection: 'html', hex: '#00FF00', name: 'lime' })
      expect(described_class.get_from_hex('#00FF00', pick: ['ntc'])).to eq({ collection: 'ntc', hex: '#00FF00', name: 'green' })
      expect(described_class.get_from_hex('#00FF00', omit: ['basic', 'ntc', 'html'])).to eq({ collection: 'x11', hex: '#00FF00', name: 'lime' })
    end

    it 'returns get_from_name' do
      expect(described_class.get_from_name('green')).to eq({ collection: 'basic', hex: '#008000', name: 'green' })
      expect(described_class.get_from_name('green', pick: ['ntc'])).to eq({ collection: 'ntc', hex: '#00FF00', name: 'green' })
      expect(described_class.get_from_name('green', omit: ['basic', 'ntc', 'html', 'x11'])).to eq({ collection: 'pantone', hex: '#1CAC78', name: 'green' })
    end

    it 'returns get_colours' do
      expect(described_class.get_colours.first).to eq({ collection: 'basic', hex: '#000000', name: 'black' })
      expect(described_class.get_colours.length).to eq(21 + 147 + 1566 + 120 + 7 + 147)
      expect(described_class.get_colours(pick: ['roygbiv']).length).to eq 7
      expect(described_class.get_colours(omit: ['basic', 'html', 'x11']).length).to eq(1566 + 120 + 7)
      expect(described_class.get_colours(pick: ['ntc'], omit: ['ntc', 'roygbiv', 'basic', 'html', 'x11']).length).to eq 0
    end
  end
end
