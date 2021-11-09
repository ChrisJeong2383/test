import  React, { useState} from 'react';
import { Button, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { globalStyles } from '../styles/global';

export default function DetailsScreen({ route, navigation }) {
return (

    <View style={globalStyles.container}>
        {/* Display the fields of the received movie object. */}
        <Text>{ route.params.email }</Text>
        <Text>{ route.params.id }</Text>
        <Text>{ route.params.name }</Text>

    </View>

);

}