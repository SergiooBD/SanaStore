import { products as initialProducts } from './mocks/products.json'
import { Products } from './components/Products.jsx'
import { Header } from './components/Header.jsx'
import { Cart } from './components/Cart.jsx'
import { CartProvider } from './context/cart.jsx'
import { useState, useEffect } from 'react';

function App () {
  const [data, setData] = useState(null);

 useEffect(()=> {
    fetch("https://localhost:44366/api/Products")
    .then((response)=> response.json())
    .then((data)=> setData(data));
  }, []); 
   
  return (
    <CartProvider>
      <Header />
      <Cart />
      <Products products={initialProducts} />
    </CartProvider>
  )
}

export default App
