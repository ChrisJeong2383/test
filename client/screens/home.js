
import  React, { useState, useEffect} from 'react';
import { Button, View, Text, TouchableOpacity, FlatList } from 'react-native';
import { ActivityIndicator } from 'react-native';
import { globalStyles } from "../styles/global";

export default function PlayersScreen({ navigation }) {
    const [isLoading, setLoading] = useState(true);
    const [data, setData] = useState([]);

    useEffect(() => {
      fetch('https://cs262-monopoly-service.herokuapp.com/players/')
          .then((response) => response.json())
          .then((json) => setData(json))
          .catch((error) => console.error(error))
          .finally(() => setLoading(false));
    }, []);

 

return (
    <View style={globalStyles.container}>
          {/* Get rid of that ugly button and, instead, display our list of movies. */}
          <FlatList data={data} renderItem={({ item })=> (
              <TouchableOpacity onPress={() => navigation.navigate('Details', item)}>
                  <Text style={globalStyles.title}>{ item.email }</Text>
              </TouchableOpacity>
          )} />
    </View>

);

};

 