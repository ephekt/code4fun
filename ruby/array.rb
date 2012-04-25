class Array
    def rb_map
        n_array = []
        self.each { |elm| n_array << yield(elm) }
        n_array
    end
end

class Array
    def rb_inject initial = nil
        value = initial
        self.each { |elm| value = yield(value,elm) }
        value
    end
end

class Array
    def new_map_using_inject
        rb_inject([]) { |set, elm| set << elm }
    end
end
