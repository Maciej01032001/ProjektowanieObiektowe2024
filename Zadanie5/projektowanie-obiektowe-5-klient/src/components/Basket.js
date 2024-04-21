import React from 'react';

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

export default Basket;
