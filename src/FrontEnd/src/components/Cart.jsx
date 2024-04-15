import './Cart.css'

import { useId } from 'react'
import { CartIcon, RemoveFromCartIcon } from './Icons.jsx'
import { useCart } from '../hooks/useCart.js'




function CartItem ({ price, name, quantity, removeFromCart }) {
  return (
    <li>
      <footer>
      <div>
        <strong>{name}</strong> ${price * quantity}
      </div>
      <small>
      Qty:
      </small>
        <small>
         {quantity}
        </small>
        <button onClick={removeFromCart}><RemoveFromCartIcon /></button>
      </footer>
    </li>
  )
}

export function Cart () {
  const cartCheckboxId = useId()
  const { cart, clearCart, removeFromCart } = useCart()

  return (
    <>
    
      <label className='cart-button' htmlFor={cartCheckboxId}>
        <CartIcon />
      </label>
      <input id={cartCheckboxId} type='checkbox' hidden />

      <aside className='cart'>
        <ul>
          {cart.map(product => (
            <CartItem
              key={product.id}
              removeFromCart={() => removeFromCart(product)}
              {...product}
            />
          ))}
        </ul>
        <table>
          <th className='thTotal'>Total</th>
          <td className='tdTotal'>Total</td>
        </table>
        <button onClick={clearCart}>
          Process Order
        </button>
      </aside>
    </>
  )
}
