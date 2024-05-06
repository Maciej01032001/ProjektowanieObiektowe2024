import React from 'react';
import PropTypes from 'prop-types';

function Products({products, setProductsInBasket}) {
    const addToBasket = (product) => {
        setProductsInBasket(prevBasket => [...prevBasket, product]);
    };

    return (
        <div>
            <h1>Products list:</h1>
            <ul>
                {products.map(product => (
                    <li key={product.id}>
                        {product.name}
                        <button onClick={() => addToBasket(product)}>Add to Basket</button>
                    </li>
                ))}
            </ul>
        </div>
    );
}

Products.propTypes = {
    products: PropTypes.arrayOf(
        PropTypes.shape({
            id: PropTypes.number.isRequired,
            name: PropTypes.string.isRequired
        })
    ).isRequired,
    setProductsInBasket: PropTypes.func.isRequired,
};
export default Products;
