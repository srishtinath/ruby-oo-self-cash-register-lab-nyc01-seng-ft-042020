require 'pry'
class CashRegister
    attr_accessor :total, :discount, :cash_register_items
    def initialize(discount=0)
        @total = 0.0.to_f
        @discount = discount.to_f
        @cash_register_items = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times {@cash_register_items << title}
        self.total = @total + price * quantity
        @last_transaction = price * quantity
    end
    
    def apply_discount
        if @discount != 0.0 
            @total = @total * (1 - (@discount/100.0))
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @cash_register_items
    end
    
    def void_last_transaction
        @total = @total - @last_transaction
    end
end
