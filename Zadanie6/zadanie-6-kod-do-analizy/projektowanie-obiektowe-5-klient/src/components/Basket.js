import React from 'react';
import PropTypes from 'prop-types';


function Basket({productsInBasket}) {
    const productCounts = {};
    productsInBasket.forEach(product => {
        if (product.id in productCounts) {
            productCounts[product.id]++;
        } else {
            productCounts[product.id] = 1;
        }
    });

    return (
        <div>
            <h1>Basket contains:</h1>
            <ul>
                {Object.keys(productCounts).map(productId => (
                    <li key={productId}>
                        {productsInBasket.find(product => product.id === parseInt(productId)).name}
                        {productCounts[productId] > 1 && ` (${productCounts[productId]})`}
                    </li>
                ))}
            </ul>
        </div>
    );
}

Basket.propTypes = {
    productsInBasket: PropTypes.arrayOf(
        PropTypes.shape({
            id: PropTypes.number.isRequired
        })
    ).isRequired,
};

export default Basket;
