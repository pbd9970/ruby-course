module DoubleDog
  class SeeAllOrders < TransactionScript
    include AdminSession

    def run(params)
      user = DoubleDog.db.get_user_by_session_id(params[:session_id])
      return failure(:not_admin) unless admin_session?(params[:admin_session])

      orders = DoubleDog.db.all_orders
      return success(orders: orders)
    end
  end
end
