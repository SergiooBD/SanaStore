import './Products.css'
import { useCart } from '../hooks/useCart.js'

export function Products({ products }) {
  const { addToCart, removeFromCart, cart, removeCart } = useCart()

  const qtyProductInCart = product => {
    const prod = cart.find(item => item.id === product.id)

    if (prod) {
      const quantity = prod.quantity;
      return quantity;
    } else {
      return 0;
    }

  }

  return (
    <main className='products'>
      <ul>
        {products.slice(0, 10).map(product => {

          const QtyProductInCart = qtyProductInCart(product)
          return (
            <li key={product.id}>
              <table>
                <tr>
                  <td className='tdImg'>
                    {<img
                      src={product.productCode}
                      alt={product.name}
                    />}
                  </td>
                  <td>
                    <div>
                      <footer><strong>{product.name}</strong> - ${product.price}</footer>
                    </div>
                    <div>
                      <footer><small>Item No. {product.ProductCode}</small><strong>{product.stock} in stock</strong> </footer>
                    </div>
                    <div>
                      <footer><small>Item No. {product.description}</small></footer>
                    </div>
                  </td>
                  <td className='tdQty'>
                    <div>
                      <footer>
                        <small>
                          Qty:
                        </small>
                        <button
                          disabled={QtyProductInCart == 0 ? true : false}
                          onClick={() => {
                            QtyProductInCart == 1
                              ? removeFromCart(product) : removeCart(product)
                          }}>-</button>
                        <small>{QtyProductInCart}</small>
                        <button onClick={() => { addToCart(product) }}>+</button>
                      </footer>
                    </div>
                  </td>
                </tr>
              </table>

            </li>
          )
        })}
      </ul>
    </main>
  )
}
