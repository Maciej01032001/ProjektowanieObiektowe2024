import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import Products from './components/Products';
import Categories from './components/Categories';
import Basket from './components/Basket';

const Stack = createStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Products">
        <Stack.Screen name="Products" component={Products} />
        <Stack.Screen name="Categories" component={Categories} />
        <Stack.Screen name="Basket" component={Basket} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
