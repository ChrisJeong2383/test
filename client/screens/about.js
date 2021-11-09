import { StyleSheet } from 'react-native';
import React, { useState } from 'react';
import { Button, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import {globalStyles} from '../styles/global';

export default function About({ route, navigation }) {


    return (
        <View style={{ flex: 1, padding: 20}}>
           <Text>{'This is About Screen :D'}</Text>
        </View>
    );
}