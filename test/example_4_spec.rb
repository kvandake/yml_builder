require 'rspec'
require 'yml_builder'

describe 'Пример 4 - проверка тега _html' do

  it 'Test' do
    price = YmlBuilder::Yml.new
    price.shop.name = 'Магазин ТЕСТ'
    price.shop.company = "ООО 'Рога & Копыта'"
    price.shop.url = 'http://example-site.ru'
    price.shop.phone = '+7 (123) 456-7890'
    price.shop.platform = 'OpenCart'
    price.shop.version = '2.0'

    price.currencies.rub = 1

    price.categories.add(id: 1, name: "Игрушки")

    item = YmlBuilder::Offer.new('simple')
    item.id = 6
    item.type = 'simple'
    item.available = true
    item.currency_id = 'RUR'
    item.delivery = true
    item.category_id = 1
    item.name = 'Товар №6'
    item.url = 'http://example-site.ru/items/6'
    item.price = 300.90
    item.add_cover_picture('http://example-site.ru/image_cover')
    item.add_param(name: 'Обложка', value: 'Мягкая')
    item.description_html = "<h3>test title</h3>"

    price.offers.add(item)

    data = price.to_yml

    expect(data).to include("<description><![CDATA")
  end
end