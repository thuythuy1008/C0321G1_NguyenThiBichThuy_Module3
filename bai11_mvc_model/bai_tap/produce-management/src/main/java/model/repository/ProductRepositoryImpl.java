package model.repository;

import model.bean.Product;

import java.util.*;

public class ProductRepositoryImpl implements ProductRepository{
    private static Map<Integer, Product> products;
    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "IPhone",12000000, "Màu trắng","IPhone"));
        products.put(2, new Product(2, "Oppo",10000000, "Màu xám","Oppo"));
        products.put(3, new Product(3, "Sam sung",9000000, "Màu đen","Sam sung"));
        products.put(4, new Product(4, "Galaxy",8000000, "Màu xanh","Sam sung"));
        products.put(5, new Product(5, "Iphone X",12000000, "Màu hồng","IPhone"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public Product findByName(String name) {
        Set<Integer> set = products.keySet();
        Product product = null;
        for (Integer key : set) {
            if (products.get(key).getName().equals(name)) {
                product = products.get(key);
            }
        }
        return product;
    }
}
