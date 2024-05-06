import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Products from './Products';
import Payment from './Payment';
import Basket from './Basket';
import Navigation from './Navigation';
import useHandlePayment from '../utils/handlePayment';
import useHandleProducts from '../utils/handleProducts';

function App() {
    const { paymentId, setPaymentId, paymentValue, setPaymentValue, handlePayment } = useHandlePayment();
    const products = useHandleProducts();
    const [productsInBasket, setProductsInBasket] = React.useState([]);

    return (
        <Router>
            <div>
                <Navigation />

                <Routes>
                    <Route path="/payment" element={<Payment
                        paymentId={paymentId}
                        setPaymentId={setPaymentId}
                        paymentValue={paymentValue}
                        setPaymentValue={setPaymentValue}
                        handlePayment={handlePayment}
                    />}/>
                    <Route path="/basket" element={<Basket productsInBasket={productsInBasket}/>}/>
                    <Route path="/" element={<Products products={products} setProductsInBasket={setProductsInBasket}/>}/>
                </Routes>
            </div>
        </Router>
    );
}

export default App;

