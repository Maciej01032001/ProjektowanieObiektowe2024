import React, { useState } from 'react';
import { View, Text, TextInput, Button, FlatList } from 'react-native';
import styles from '../styles/styles';

const Categories = ({ navigation }) => {
  const [categories, setCategories] = useState([]);
  const [categoryName, setCategoryName] = useState('');
  const [categoryCounter, setCategoryCounter] = useState(0);

  const addCategory = () => {
    if (categoryName.trim()) {
      setCategories([...categories, { key: categoryCounter.toString(), name: categoryName }]);
      setCategoryName('');
      setCategoryCounter(categoryCounter + 1);
    }
  };

  const deleteCategory = (key) => {
    setCategories(categories.filter(category => category.key !== key));
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Categories</Text>
      <TextInput
        style={styles.input}
        placeholder="Enter category name"
        value={categoryName}
        onChangeText={setCategoryName}
      />
      <Button title="Add Category" onPress={addCategory} />
      <FlatList
        data={categories}
        renderItem={({ item }) => (
          <View style={styles.item}>
            <Text>{item.name}</Text>
            <Button title="Delete" onPress={() => deleteCategory(item.key)} />
          </View>
        )}
      />
      <Button title="Go to Products" onPress={() => navigation.navigate('Products')} />
      <Button title="Go to Basket" onPress={() => navigation.navigate('Basket')} />
    </View>
  );
};

export default Categories;

