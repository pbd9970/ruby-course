module DoubleDog
  module Database
    class SQL

      class User < ActiveRecord::Base
      end

      class Session < ActiveRecord::Base
        belongs_to :user
      end

      class Item < ActiveRecord::Base
      end

      class Order < ActiveRecord::Base
        has_many :items
      end

      def clear_everything
        User.delete_all
        Session.delete_all
        Item.delete_all
        Order.delete_all
      end

      def create_user(attrs)
        user = DoubleDog::User.new(nil, attrs[:username], attrs[:password], attrs[:admin])
        #attrs[:password] = user.store_password
        ar_user = User.create(attrs)
        user.instance_variable_set("@id", ar_user.id)
      end

      def get_user(id)
        ar_user = User.find(id)
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def create_session(attrs)
        ar_session = Session.create(attrs)
        ar_session.id
      end

      def get_user_by_session_id(sid)
        ar_session = Session.find(sid)
        return nil unless session
        ar_user = User.find(ar_session.user_id)
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def get_user_by_username(username)
        ar_user = User.find_by(username: username)
        return nil unless ar_user
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def create_item(attrs)
        item = DoubleDog::Item.new(nil, attrs[:name], attrs[:price])
        ar_item = Item.create(attrs)
        item.instance_variable_set("@id", ar_item.id)
      end

      def get_item(id)
        ar_item = Item.find(id)
        DoubleDog::Item.new(ar_item.id, ar_item.name, ar_item.price)
      end

      def all_items
        items = Item.all
        items.map do |ar_item|
          Item.new(ar_item.id, ar_item.name, ar_item.price)
        end
      end

      def create_order(attrs)
        new_id = (@order_id_counter += 1)
        @orders[new_id] = attrs
        attrs[:id] = new_id
        DoubleDog::Order.new(ar_order.id, ar_order.employee_id, ar_order.items)
      end

      def get_order(id)
        ar_order = Order.find(id)
        DoubleDog::Order.new(ar_order.id, ar_order.employee_id, ar_order.items)
      end

      def all_orders
        order = Order.all
        orders.map do |ar_order|
          DoubleDog::Order.new(ar_order.id, ar_order.employee_id, ar_order.items)
        end
      end
    end
  end
end

