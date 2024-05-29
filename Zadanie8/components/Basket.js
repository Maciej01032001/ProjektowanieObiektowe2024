import React, { useState } from 'react';
import { View, Text, Button, FlatList } from 'react-native';
import styles from '../styles/styles';

const Basket = ({ navigation, route }) => {
  const [basket, setBasket] = useState(route.params?.basket || []);

  const deleteFromBasket = (key) => {
    setBasket(basket.filter(item => item.key !== key));
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Basket</Text>
      <FlatList
        data={basket}
        renderItem={({ item }) => (
          <View style={styles.item}>
            <Text>{item.name}</Text>
            <Button title="Delete" onPress={() => deleteFromBasket(item.key)} />
          </View>
        )}
      />
      <Button title="Go to Products" onPress={() => navigation.navigate('Products')} />
      <Button title="Go to Categories" onPress={() => navigation.navigate('Categories')} />
    </View>
  );
};

export default Basket;
