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
        has_many :items, through :order_items
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
        user_id = @sessions[sid][:user_id]
        user_attrs = @users[user_id]
        User.new(user_attrs[:id], user_attrs[:username], user_attrs[:password], user_attrs[:admin])
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def get_user_by_username(username)
        user_attrs = @users.values.find { |attrs|  == username }
        return nil if user_attrs.nil?
        User.new(user_attrs[:id], user_attrs[:username], user_attrs[:password], user_attrs[:admin])
        DoubleDog::User.new(ar_user.id, ar_user.username, ar_user.password, ar_user.admin)
      end

      def create_item(attrs)
        new_id = (@item_id_counter += 1)
        @items[new_id] = attrs
        attrs[:id] = new_id
        Item.new(attrs[:id], attrs[:name], attrs[:price])
      end

      def get_item(id)
        attrs = @items[id]
        Item.new(attrs[:id], attrs[:name], attrs[:price])
      end

      def all_items
        @items.values.map do |attrs|
          Item.new(attrs[:id], attrs[:name], attrs[:price])
        end
      end

      def create_order(attrs)
        new_id = (@order_id_counter += 1)
        @orders[new_id] = attrs
        attrs[:id] = new_id
        Order.new(attrs[:id], attrs[:employee_id], attrs[:items])
      end

      def get_order(id)
        attrs = @orders[id]
        Order.new(attrs[:id], attrs[:employee_id], attrs[:items])
      end

      def all_orders
        @orders.values.map do |attrs|
          Order.new(attrs[:id], attrs[:employee_id], attrs[:items])
        end
      end
    end
  end
end

