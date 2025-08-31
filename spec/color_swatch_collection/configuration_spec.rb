# frozen_string_literal: true

RSpec.describe ColorSwatchCollection::Configuration do
  context 'methods' do
    it 'initialize' do
      expect(described_class.new.default_collection_picks).to eq([])
      expect(described_class.new.default_collection_omits).to eq([])
    end

    it 'setters' do
      configuration = described_class.new
      configuration.default_collection_picks = ['x11', 'css']
      expect(configuration.default_collection_picks).to eq(['x11', 'css'])
      expect(configuration.default_collection_omits).to eq([])

      configuration = described_class.new
      configuration.default_collection_omits = ['x11', 'css']
      expect(configuration.default_collection_picks).to eq([])
      expect(configuration.default_collection_omits).to eq(['x11', 'css'])
    end

    it 'reset!' do
      configuration = described_class.new
      configuration.default_collection_picks = ['x11', 'css']
      configuration.default_collection_omits = ['html']

      configuration.reset!

      expect(configuration.default_collection_picks).to eq([])
      expect(configuration.default_collection_omits).to eq([])
    end
  end

  context 'usage' do
    it 'returns a Configuration instance' do
      expect(ColorSwatchCollection.configuration).to be_a(ColorSwatchCollection::Configuration)
    end

    it 'returns the same instance on multiple calls' do
      config1 = ColorSwatchCollection.configuration
      config2 = ColorSwatchCollection.configuration
      expect(config1).to be(config2)
    end

    it 'when default_collection_picks is set' do
      expect(ColorSwatchCollection.get_from_hex('#00FF00')).to eq({ collection: 'html', hex: '#00FF00', name: 'lime' })
      expect(ColorSwatchCollection.get_from_name('green')).to eq({ collection: 'basic', hex: '#008000', name: 'green' })
      expect(ColorSwatchCollection.get_colours.length).to eq 2664

      ColorSwatchCollection.configure do |config|
        config.default_collection_picks = ['ntc']
      end

      expect(ColorSwatchCollection.get_from_hex('#00FF00')).to eq({ collection: 'ntc', hex: '#00FF00', name: 'green' })
      expect(ColorSwatchCollection.get_from_name('green')).to eq({ collection: 'ntc', hex: '#00FF00', name: 'green' })
      expect(ColorSwatchCollection.get_colours.length).to eq 1566

      expect(ColorSwatchCollection.get_from_hex('#00FF00', pick: ['html'])).to eq({ collection: 'html', hex: '#00FF00', name: 'lime' })
      expect(ColorSwatchCollection.get_from_name('green', pick: ['basic'])).to eq({ collection: 'basic', hex: '#008000', name: 'green' })
      expect(ColorSwatchCollection.get_colours(pick: ['basic']).length).to eq 21
    end

    it 'when default_collection_omits is set' do
      expect(ColorSwatchCollection.get_from_hex('#00FF00')).to eq({ collection: 'html', hex: '#00FF00', name: 'lime' })
      expect(ColorSwatchCollection.get_from_name('green')).to eq({ collection: 'basic', hex: '#008000', name: 'green' })
      expect(ColorSwatchCollection.get_colours.length).to eq 2664

      ColorSwatchCollection.configure do |config|
        config.default_collection_omits = ['basic', 'ntc', 'html']
      end

      expect(ColorSwatchCollection.get_from_hex('#00FF00')).to eq({ collection: 'x11', hex: '#00FF00', name: 'lime' })
      expect(ColorSwatchCollection.get_from_name('green')).to eq({ collection: 'pantone', hex: '#1CAC78', name: 'green' })
      expect(ColorSwatchCollection.get_colours.length).to eq 930

      expect(ColorSwatchCollection.get_from_hex('#00FF00', omit: ['x11', 'pantone'])).to eq({ collection: 'html', hex: '#00FF00', name: 'lime' })
      expect(ColorSwatchCollection.get_from_name('green', omit: ['x11', 'pantone'])).to eq({ collection: 'basic', hex: '#008000', name: 'green' })
      expect(ColorSwatchCollection.get_colours(omit: ['x11', 'pantone']).length).to eq 2397
    end

    it 'when default_collection_picks and default_collection_omits are set' do
      expect(ColorSwatchCollection.get_from_hex('#00FF00')).to eq({ collection: 'html', hex: '#00FF00', name: 'lime' })
      expect(ColorSwatchCollection.get_from_name('green')).to eq({ collection: 'basic', hex: '#008000', name: 'green' })
      expect(ColorSwatchCollection.get_colours.length).to eq 2664

      ColorSwatchCollection.configure do |config|
        config.default_collection_picks = ['ntc']
        config.default_collection_omits = ['ntc', 'roygbiv', 'basic', 'html', 'x11']
      end

      expect(ColorSwatchCollection.get_from_hex('#00FF00', pick: ['[]'], omit: ['[]'])).to eq({ collection: 'html', hex: '#00FF00', name: 'lime' })
      expect(ColorSwatchCollection.get_from_name('green', pick: ['[]'], omit: ['[]'])).to eq({ collection: 'basic', hex: '#008000', name: 'green' })
      expect(ColorSwatchCollection.get_colours(pick: ['[]'], omit: ['[]']).length).to eq 2664

      expect(ColorSwatchCollection.get_from_hex('#00FF00', pick: ['html'], omit: ['[]'])).to eq({ collection: 'html', hex: '#00FF00', name: 'lime' })
      expect(ColorSwatchCollection.get_from_name('green', pick: ['basic'], omit: ['[]'])).to eq({ collection: 'basic', hex: '#008000', name: 'green' })
      expect(ColorSwatchCollection.get_colours(pick: ['basic'], omit: ['[]']).length).to eq 21

      expect(ColorSwatchCollection.get_from_hex('#00FF00', pick: ['[]'], omit: ['ntc', 'roygbiv', 'basic', 'x11'])).to eq({ collection: 'html', hex: '#00FF00', name: 'lime' })
      expect(ColorSwatchCollection.get_from_name('green', pick: ['[]'], omit: ['ntc', 'roygbiv', 'basic', 'html', 'x11'])).to eq({ collection: 'pantone', hex: '#1CAC78', name: 'green' })
      expect(ColorSwatchCollection.get_colours(pick: ['[]'], omit: ['ntc', 'roygbiv', 'basic', 'html', 'x11']).length).to eq 776
    end
  end
end
