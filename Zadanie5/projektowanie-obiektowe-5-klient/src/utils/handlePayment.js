import { useState } from 'react';

const useHandlePayment = () => {
    const [paymentId, setPaymentId] = useState('');
    const [paymentValue, setPaymentValue] = useState('');

    const handlePayment = async () => {
        try {
            const response = await fetch('http://localhost:3000/payment', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    paymentId: paymentId,
                    value: paymentValue,
                }),
            });
            if (response.ok) {
                console.log('Payment OK');
            } else {
                console.error('Payment FAIL');
            }
        } catch (error) {
            console.error('Error:', error);
        }
    };

    return { paymentId, setPaymentId, paymentValue, setPaymentValue, handlePayment };
};

export default useHandlePayment;
