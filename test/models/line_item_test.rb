require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test "#update time_to_prepare" do
    table = Table.create(reference: 'teste', status: :available)
    order = Order.create(table: table, status: :open)
    command = Command.create(client_name: 'teste', order: order)
    product = Product.create(name: 'teste')
    line_item = LineItem.create(status: :waiting, product: product, command: command)

    assert_nil line_item.time_to_prepare

    line_item.update(status: 'ready')
    assert_not_nil line_item.time_to_prepare
  end
end
