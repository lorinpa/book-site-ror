json.set! :categories do
    json.array!(@categories) do |category|
        json.extract! category, :id, :title
    end
end
