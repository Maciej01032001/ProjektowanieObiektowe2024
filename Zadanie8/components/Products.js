import React, { useState } from 'react';
import { View, Text, TextInput, Button, FlatList } from 'react-native';
import styles from '../styles/styles';

const Products = ({ navigation }) => {
  const [products, setProducts] = useState([]);
  const [productName, setProductName] = useState('');
  const [productCounter, setProductCounter] = useState(0);
  const [basket, setBasket] = useState([]);

  const addProduct = () => {
    if (productName.trim()) {
      setProducts([...products, { key: productCounter.toString(), name: productName }]);
      setProductName('');
      setProductCounter(productCounter + 1);
    }
  };

  const deleteProduct = (key) => {
    setProducts(products.filter(product => product.key !== key));
  };

  const addToBasket = (product) => {
    setBasket([...basket, product]);
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Products</Text>
      <TextInput
        style={styles.input}
        placeholder="Enter product name"
        value={productName}
        onChangeText={setProductName}
      />
      <Button title="Add Product" onPress={addProduct} />
      <FlatList
        data={products}
        renderItem={({ item }) => (
          <View style={styles.item}>
            <Text>{item.name}</Text>
            <Button title="Delete" onPress={() => deleteProduct(item.key)} />
            <Button title="Add to Basket" onPress={() => addToBasket(item)} />
          </View>
        )}
      />
      <Button title="Go to Categories" onPress={() => navigation.navigate('Categories')} />
      <Button title="Go to Basket" onPress={() => navigation.navigate('Basket', { basket })} />
    </View>
  );
};

export default Products;

