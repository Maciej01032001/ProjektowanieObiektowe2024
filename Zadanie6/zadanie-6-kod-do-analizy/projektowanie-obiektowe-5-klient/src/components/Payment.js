import React from 'react';
import PropTypes from 'prop-types';

function Payment({paymentId, setPaymentId, paymentValue, setPaymentValue, handlePayment}) {
    return (
        <div>
            <h2>Make Payment</h2>
            <label>
                Enter ID:<input type="text" value={paymentId} onChange={e => setPaymentId(e.target.value)}/>
            </label>

            <label>
                Enter Value:<input type="text" value={paymentValue} onChange={e => setPaymentValue(e.target.value)}/>
            </label>

            <button onClick={handlePayment}>Pay</button>
        </div>
    );
}

Payment.propTypes = {
    paymentId: PropTypes.string.isRequired,
    setPaymentId: PropTypes.func.isRequired,
    paymentValue: PropTypes.string.isRequired,
    setPaymentValue: PropTypes.func.isRequired,
    handlePayment: PropTypes.func.isRequired,
};

export default Payment;