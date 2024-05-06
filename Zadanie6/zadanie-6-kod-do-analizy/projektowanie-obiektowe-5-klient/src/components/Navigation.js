import React from 'react';
import { Link } from 'react-router-dom';

function Navigation() {
    return (
        <nav>
            <ul>
                <li>
                    <Link to="/">Go to Products</Link>
                </li>
                <li>
                    <Link to="/payment">Go to Payment</Link>
                </li>
                <li>
                    <Link to="/basket">Go to Basket</Link>
                </li>
            </ul>
        </nav>
    );
}

export default Navigation;
