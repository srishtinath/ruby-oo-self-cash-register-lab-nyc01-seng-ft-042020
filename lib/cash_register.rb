require 'pry'
class CashRegister
    attr_accessor :total, :discount, :cash_register_items
    def initialize(discount=0)
        @total = 0.0.to_f
        @discount = discount.to_f
        @cash_register = {}
        @cash_register_items = []
    end

    def add_item(title, price, quantity = 1)
        @cash_register[title] = price
        quantity.times {@cash_register_items << title}
        self.total = @total + price * quantity
    end
    
    def apply_discount
        if @discount != 0.0 
            @total = @total * (1 - (@discount/100.0))
            puts "After the discount, the total comes to #{@total}."
        else
            puts "There is no discount to apply."
        end
    end

    def items
        @cash_register_items
    end
    
    def void_last_transaction
        if @cash_register_items.empty?
            @total = 0.0
        else
            amount_to_reduce = @cash_register[@cash_register_items.pop]
            @total = @total - amount_to_reduce
        end
    end
end
