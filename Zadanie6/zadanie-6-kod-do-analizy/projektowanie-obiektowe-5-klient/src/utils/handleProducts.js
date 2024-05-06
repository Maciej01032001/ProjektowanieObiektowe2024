import { useState, useEffect } from 'react';

const useHandleProducts = () => {
    const [products, setProducts] = useState([]);

    useEffect(() => {
        handleProducts();
    }, []);

    const handleProducts = async () => {
        try {
            const response = await fetch('http://localhost:3000/products');
            const data = await response.json();
            setProducts(data);
        } catch (error) {
            console.error('Error:', error);
        }
    };

    return products;
};

export default useHandleProducts;
