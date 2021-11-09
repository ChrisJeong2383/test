import React, { useState,useEffect } from 'react';
import { Button, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { globalStyles } from './styles/global';
import HomeScreen from './screens/home';
import DetailsScreen from './screens/detail';
import About from './screens/about';
import Header from './shared/headers';
//import {HomeScreen} from './



const Stack = createNativeStackNavigator();

function App() {
  return (
      <NavigationContainer>
        <Stack.Navigator initialRouteName="Players">
          <Stack.Screen name="Players" component={HomeScreen} options={({ navigation }) => ({
              headerRight: () => <Header navigation={navigation} />,
             })}/>
          <Stack.Screen name="Details" component={DetailsScreen} options={({ navigation }) => ({
              headerRight: () => <Header navigation={navigation} />,
            })}/>  
          <Stack.Screen name="About" component={About} />
  
        </Stack.Navigator>
  
      </NavigationContainer>
  
  );
  
  }
  
   
  
  
  export default App;
  
   
  
  
